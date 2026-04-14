#!/usr/bin/env python3
"""Fill lib/l10n/app_*.arb from app_en.arb using Google Translate (deep-translator).

Preserves ICU placeholders like {error}, {count} and copies @metadata blocks from the template.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import time
from pathlib import Path

try:
    from deep_translator import GoogleTranslator
except ImportError:
    print("Install: pip install deep-translator", file=sys.stderr)
    raise

# ARB locale id (filename app_<id>.arb) -> Google Translate target code
LOCALE_TARGETS: dict[str, str] = {
    "ar": "ar",
    "bn": "bn",
    "de": "de",
    "es": "es",
    "fa": "fa",
    "fr": "fr",
    "hi": "hi",
    "id": "id",
    "it": "it",
    "ja": "ja",
    "ko": "ko",
    "nl": "nl",
    "pl": "pl",
    "pt": "pt",
    "pt_BR": "pt",
    "ru": "ru",
    "th": "th",
    "tr": "tr",
    "vi": "vi",
    "zh": "zh-CN",
    "zh_CN": "zh-CN",
}

# After MT, copy these keys verbatim from app_en.arb (brands / platform labels).
VERBATIM_FROM_EN: tuple[str, ...] = (
    "appTitle",
    "linkTypeLinkedIn",
    "linkTypeX",
    "linkTypeFacebook",
    "linkTypeInstagram",
)

_PLACEHOLDER_PATTERN = re.compile(r"\{[^{}]+\}")


def _mask_placeholders(text: str) -> tuple[str, dict[str, str]]:
    mapping: dict[str, str] = {}

    def repl(m: re.Match[str]) -> str:
        token = f"⟦PH{len(mapping)}⟧"
        mapping[token] = m.group(0)
        return token

    masked = _PLACEHOLDER_PATTERN.sub(repl, text)
    return masked, mapping


def _unmask_placeholders(text: str, mapping: dict[str, str]) -> str:
    out = text
    for token, original in mapping.items():
        out = out.replace(token, original)
    return out


def _prepare(s: str) -> tuple[str, dict[str, str]]:
    return _mask_placeholders(s)


def _finalize(s: str, ph: dict[str, str]) -> str:
    t = _unmask_placeholders(s, ph)
    t = re.sub(r"\{\s*(\w+)\s*\}", r"{\1}", t)
    return t


def iter_message_keys(doc: dict) -> list[str]:
    return [
        k
        for k in doc
        if not k.startswith("@") and isinstance(doc[k], str)
    ]


def translate_batch_with_retry(
    translator: GoogleTranslator, texts: list[str], *, retries: int = 4
) -> list[str]:
    last_err: Exception | None = None
    for attempt in range(retries):
        try:
            out = translator.translate_batch(texts)
            if len(out) != len(texts):
                raise RuntimeError(f"batch size mismatch: {len(out)} != {len(texts)}")
            return out
        except Exception as e:  # noqa: BLE001
            last_err = e
            wait = 2**attempt
            print(f"  batch retry {attempt + 1}/{retries} after {wait}s: {e}", flush=True)
            time.sleep(wait)
    raise RuntimeError(f"translate_batch failed: {last_err}")


def translate_arb(en_path: Path, out_path: Path, locale_tag: str, dry_run: bool) -> None:
    target_lang = LOCALE_TARGETS.get(locale_tag)
    if not target_lang:
        raise SystemExit(f"No target mapping for locale {locale_tag!r}")

    en_doc = json.loads(en_path.read_text(encoding="utf-8"))
    doc = json.loads(en_path.read_text(encoding="utf-8"))
    translator = GoogleTranslator(source="en", target=target_lang)

    keys = [k for k in iter_message_keys(doc) if k not in VERBATIM_FROM_EN]
    prepared: list[tuple[str, dict[str, str]]] = [_prepare(doc[k]) for k in keys]

    batch_size = 18
    translated_parts: list[str] = []
    for i in range(0, len(prepared), batch_size):
        chunk = prepared[i : i + batch_size]
        batch_in = [p[0] for p in chunk]
        batch_out = translate_batch_with_retry(translator, batch_in)
        for j, part in enumerate(batch_out):
            ph = chunk[j][1]
            translated_parts.append(_finalize(part, ph))
        print(f"  {locale_tag}: {min(i + batch_size, len(keys))}/{len(keys)}", flush=True)
        time.sleep(0.35)

    for k, t in zip(keys, translated_parts, strict=True):
        doc[k] = t

    for k in VERBATIM_FROM_EN:
        doc[k] = en_doc[k]

    doc["@@locale"] = locale_tag

    if dry_run:
        print(json.dumps(doc, ensure_ascii=False, indent=2)[:2500])
        return

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(
        json.dumps(doc, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {out_path}", flush=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--arb-dir",
        type=Path,
        default=Path(__file__).resolve().parents[1] / "lib" / "l10n",
    )
    parser.add_argument("--locale", help="Single locale tag (e.g. es). Default: all.")
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    en_path = args.arb_dir / "app_en.arb"
    if not en_path.is_file():
        raise SystemExit(f"Missing {en_path}")

    locales = (
        [args.locale]
        if args.locale
        else sorted(
            p.stem.removeprefix("app_")
            for p in args.arb_dir.glob("app_*.arb")
            if p.stem != "app_en"
        )
    )

    for loc in locales:
        if loc not in LOCALE_TARGETS:
            print(f"Skip unknown locale {loc}", file=sys.stderr)
            continue
        out_path = args.arb_dir / f"app_{loc}.arb"
        print(f"Translating -> {loc} ...", flush=True)
        translate_arb(en_path, out_path, loc, args.dry_run)
        time.sleep(0.6)


if __name__ == "__main__":
    main()
