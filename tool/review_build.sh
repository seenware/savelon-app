#!/usr/bin/env bash
set -euo pipefail

DEFINES_FILE="dart_defines.local.json"

if [[ ! -f "${DEFINES_FILE}" ]]; then
  echo "Missing ${DEFINES_FILE}."
  echo "Create it from dart_defines.example.json and set your private values."
  exit 1
fi

if [[ $# -lt 1 ]]; then
  echo "Usage: ./tool/review_build.sh <run|ipa|aab|apk> [extra flutter args...]"
  exit 1
fi

MODE="$1"
shift

case "${MODE}" in
  run)
    flutter run --dart-define-from-file="${DEFINES_FILE}" "$@"
    ;;
  ipa)
    flutter build ipa --dart-define-from-file="${DEFINES_FILE}" "$@"
    ;;
  aab)
    flutter build appbundle --release --dart-define-from-file="${DEFINES_FILE}" "$@"
    ;;
  apk)
    flutter build apk --release --dart-define-from-file="${DEFINES_FILE}" "$@"
    ;;
  *)
    echo "Unknown mode: ${MODE}"
    echo "Use one of: run, ipa, aab, apk"
    exit 1
    ;;
esac
