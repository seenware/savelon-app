import 'dart:typed_data';
import 'dart:math';

import 'package:contacts/features/startup/setup/presentation/models/avatar_catalog.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_entrance.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateVaultPage extends StatefulWidget {
  const CreateVaultPage({
    super.key,
    required this.initialUsername,
    required this.initialAvatarId,
    required this.onAvatarChanged,
    required this.onUsernameChanged,
    required this.onBack,
    required this.onContinue,
  });

  final String initialUsername;
  final String initialAvatarId;
  final ValueChanged<String> onAvatarChanged;
  final ValueChanged<String> onUsernameChanged;
  final VoidCallback onBack;
  final VoidCallback onContinue;

  @override
  State<CreateVaultPage> createState() => _CreateVaultPageState();
}

class _CreateVaultPageState extends State<CreateVaultPage> {
  Color _darker(Color color, [double amount = .22]) {
    final hsl = HSLColor.fromColor(color);
    final next = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return next.toColor();
  }

  late final TextEditingController _controller;
  late final FocusNode _usernameFocusNode;
  late String _avatarId;
  Uint8List? _photoBytes;

  String _randomVaultName() {
    final n = Random().nextInt(1000);
    return 'Vault${n.toString().padLeft(3, '0')}';
  }

  String _randomAvatarId() {
    final index = Random().nextInt(setupAvatarCatalog.length);
    return setupAvatarCatalog[index].id;
  }

  @override
  void initState() {
    super.initState();
    final randomizedAvatar = widget.initialAvatarId == setupAvatarCatalog.first.id
        ? _randomAvatarId()
        : widget.initialAvatarId;
    _avatarId = randomizedAvatar;
    _usernameFocusNode = FocusNode();
    final initial = widget.initialUsername.trim();
    final generated = _randomVaultName();
    final shouldGenerate =
        initial.isEmpty ||
        initial == 'My vault' ||
        RegExp(r'^Vault\d{3}$').hasMatch(initial);
    _controller = TextEditingController(
      text: shouldGenerate ? generated : initial,
    );
    _controller.addListener(() => widget.onUsernameChanged(_controller.text));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (randomizedAvatar != widget.initialAvatarId) {
        widget.onAvatarChanged(randomizedAvatar);
      }
      _usernameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  Future<void> _openAvatarPicker() async {
    _usernameFocusNode.unfocus();
    final theme = Theme.of(context);
    final selected = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              ...setupAvatarCatalog.map((option) {
                final isSelected =
                    option.id == _avatarId && _photoBytes == null;
                return InkWell(
                  onTap: () => Navigator.pop(ctx, option.id),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: option.background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: Icon(option.icon, color: Colors.white, size: 28),
                  ),
                );
              }),
              InkWell(
                onTap: () async {
                  Navigator.pop(ctx);
                  await _pickPhoto();
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.45),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate_rounded,
                    color: theme.colorScheme.primary,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (!mounted || selected == null) return;
    setState(() {
      _photoBytes = null;
      _avatarId = selected;
    });
    widget.onAvatarChanged(selected);
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (picked == null) return;
    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop photo',
          lockAspectRatio: true,
          hideBottomControls: true,
          showCropGrid: false,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [],
        ),
        IOSUiSettings(
          title: 'Crop photo',
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
          resetButtonHidden: true,
          rotateClockwiseButtonHidden: true,
          rotateButtonsHidden: true,
          aspectRatioPickerButtonHidden: true,
          cropStyle: CropStyle.circle,
        ),
      ],
    );
    if (cropped == null) return;
    final bytes = await FlutterImageCompress.compressWithFile(
      cropped.path,
      minWidth: 800,
      minHeight: 800,
      quality: 90,
      format: CompressFormat.jpeg,
    );
    if (bytes == null) return;
    if (!mounted) return;
    setState(() {
      _photoBytes = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final avatar = avatarById(_avatarId);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: SetupPageScaffold(
        showBackButton: true,
        onBack: widget.onBack,
        bottomButtonText: 'Next',
        onBottomButtonPressed: widget.onContinue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: SetupEntrance(
                      index: 0,
                      child: Text(
                        'Create your vault',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SetupEntrance(
              index: 1,
              child: Text(
                'Stored on your device only. Encrypted and private.',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.74,
                  ),
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SetupEntrance(
                    index: 3,
                    child: GestureDetector(
                      onTap: _openAvatarPicker,
                      child: Container(
                        width: 168,
                        height: 168,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _photoBytes == null
                                ? _darker(avatar.background)
                                : theme.colorScheme.outline,
                            width: 4,
                          ),
                          color: _photoBytes == null
                              ? avatar.background
                              : theme.colorScheme.surfaceContainerHighest,
                        ),
                        child: _photoBytes == null
                            ? Icon(avatar.icon, size: 86, color: Colors.white)
                            : ClipOval(
                                child: SizedBox.square(
                                  dimension: 160,
                                  child: Image.memory(
                                    _photoBytes!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SetupEntrance(
                    index: 4,
                    child: TextField(
                      controller: _controller,
                      focusNode: _usernameFocusNode,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 30,
                      ),
                      decoration: InputDecoration(
                        hintText: 'My vault',
                        hintStyle: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.grey,
                          fontSize: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
