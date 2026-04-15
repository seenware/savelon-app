// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Kontak Terenkripsi';

  @override
  String get navContacts => 'Kontak';

  @override
  String get navOrganize => 'Mengatur';

  @override
  String get navSupport => 'Dukungan';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSystemDefault => 'Bawaan sistem';

  @override
  String get organizeTitle => 'Mengatur';

  @override
  String get supportTitle => 'Dukungan';

  @override
  String get search => 'Cari';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonEdit => 'Sunting';

  @override
  String get commonMerge => 'Gabung';

  @override
  String get commonSkip => 'Lewati';

  @override
  String get commonRetry => 'Mencoba kembali';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonNext => 'Berikutnya';

  @override
  String get commonBack => 'Kembali';

  @override
  String get commonYes => 'Ya';

  @override
  String get commonNo => 'Tidak';

  @override
  String get commonContinue => 'Lanjutkan';

  @override
  String get commonTryAgain => 'Coba Lagi';

  @override
  String get commonApply => 'Terapkan';

  @override
  String get commonDiscard => 'Membuang';

  @override
  String get commonUnlock => 'Buka kunci';

  @override
  String get commonLoading => 'Memuat...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get brandSlogan => 'Kontak Anda. Hanya milik Anda.';

  @override
  String get contactNotFound => 'Kontak tidak ditemukan';

  @override
  String get contactDeleted => 'Kontak dihapus';

  @override
  String get contactUpdated => 'Kontak diperbarui';

  @override
  String get contactSaved => 'Kontak disimpan';

  @override
  String get contactsMerged => 'Kontak digabungkan';

  @override
  String get deleteContactTitle => 'Hapus Kontak';

  @override
  String deleteContactConfirm(String name) {
    return 'Apakah Anda yakin ingin menghapus $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Apakah Anda yakin ingin menghapus \"$name\"?';
  }

  @override
  String failedToDelete(String error) {
    return 'Gagal menghapus: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Gagal memperbarui: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Gagal menyimpan: $error';
  }

  @override
  String get noName => 'Tanpa Nama';

  @override
  String get noNameTitle => 'Tanpa Nama';

  @override
  String get noNameBody => 'Kontak ini tidak memiliki nama. Tetap simpan?';

  @override
  String get discardChangesTitle => 'Hapus perubahan?';

  @override
  String get discardChangesBody =>
      'Anda memiliki perubahan yang belum disimpan dan akan hilang.';

  @override
  String get newContact => 'Kontak Baru';

  @override
  String get editContact => 'Sunting Kontak';

  @override
  String get addMore => 'Tambahkan lebih banyak';

  @override
  String get addNameFieldsTitle => 'Tambahkan Bidang Nama';

  @override
  String get call => 'Panggil';

  @override
  String get sendEmail => 'Kirim Email';

  @override
  String get copy => 'Salin';

  @override
  String get visit => 'Kunjungi';

  @override
  String get copiedToClipboard => 'Disalin ke papan klip';

  @override
  String get importContacts => 'Impor Kontak';

  @override
  String get importing => 'Mengimpor...';

  @override
  String importedCount(int count) {
    return 'Kontak $count yang diimpor';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Kontak $imported yang diimpor, $skipped dilewati';
  }

  @override
  String get failedToImportContacts => 'Gagal mengimpor kontak';

  @override
  String get noContactsToImport => 'Tidak ada kontak untuk diimpor.';

  @override
  String get contactsPermissionRequiredImport =>
      'Izin kontak diperlukan untuk mengimpor kontak';

  @override
  String get importDialogTitle => 'Impor Kontak';

  @override
  String get importDialogBody => 'Impor kontak dari perangkat atau file Anda?';

  @override
  String get importSourceTitle => 'Impor';

  @override
  String get importZipPasswordTitle => 'Kata sandi arsip';

  @override
  String get importZipPasswordChecking => 'Memeriksa...';

  @override
  String get exportContacts => 'Ekspor Kontak';

  @override
  String get unlockPro => 'Buka Pro';

  @override
  String get exportContactsTitle => 'Ekspor kontak';

  @override
  String get exportSubtitle =>
      'Pilih bagaimana Anda ingin menyimpan kontak Anda.';

  @override
  String get exportFormatVcfTitle => 'Simpan sebagai .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Satu file yang berfungsi dengan Apple Kontak, Google Kontak, dan banyak lagi.';

  @override
  String get exportFormatZipTitle =>
      'Simpan dalam arsip yang dilindungi kata sandi';

  @override
  String get exportFormatZipSubtitle =>
      '.zip dengan .vcf di dalamnya — memerlukan kata sandi untuk membukanya.';

  @override
  String get exportProtectedTitle => 'Ekspor dilindungi';

  @override
  String get exportCompleteTitle => 'Ekspor selesai';

  @override
  String get stillLoadingContacts => 'Masih memuat kontak. Harap tunggu.';

  @override
  String get couldNotLoadContacts => 'Tidak dapat memuat kontak.';

  @override
  String get passwordChangedSuccess => 'Kata sandi berhasil diubah';

  @override
  String get passwordProtectionEnabled =>
      'Perlindungan kata sandi berhasil diaktifkan';

  @override
  String get passwordProtectionRemoved =>
      'Perlindungan kata sandi berhasil dihapus';

  @override
  String get removePasswordProtectionButton => 'Hapus Perlindungan Kata Sandi';

  @override
  String get changePasswordTitle => 'Ubah Kata Sandi';

  @override
  String get setPasswordTitle => 'Tetapkan Kata Sandi';

  @override
  String get passwordSettingsChangeTitle => 'Ubah Kata Sandi';

  @override
  String get passwordSettingsSetTitle => 'Tetapkan Kata Sandi';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Gagal membuka kebijakan privasi: $error';
  }

  @override
  String get resetAppTitle => 'Setel ulang aplikasi';

  @override
  String get resetAppConfirmTitle =>
      'Hapus semua kontak, dan setel ulang aplikasi?';

  @override
  String get resetAppCannotUndo => 'Hal ini tidak dapat dibatalkan';

  @override
  String resetAppError(String error) {
    return 'Kesalahan saat menyetel ulang aplikasi: $error';
  }

  @override
  String get photoPickerNewImage => 'Pilih gambar baru';

  @override
  String get photoPickerRemoveImage => 'Hapus gambar';

  @override
  String get onboardingHeadline1 => 'Siapa yang dapat mengakses kontak Anda?';

  @override
  String get onboardingSubline1 =>
      'Beberapa aplikasi mengunggahnya ke cloud. Hal ini dapat menimbulkan lebih banyak risiko privasi.';

  @override
  String get onboardingHeadline2 => 'Banyak aplikasi yang meminta akses kontak';

  @override
  String get onboardingSubline2 =>
      'Ini bisa berguna — tetapi kontak penting harus tetap bersifat pribadi.';

  @override
  String get onboardingHeadline3 => 'Pisahkan kontak sensitif';

  @override
  String get onboardingSubline3 =>
      'Kami menyarankan untuk menyimpan kontak penting dan jarang digunakan di luar aplikasi kontak utama Anda.';

  @override
  String get onboardingHeadline4 => 'Lindungi kontak penting Anda';

  @override
  String get onboardingSubline4 =>
      'Savelon menyimpannya di perangkat Anda, terenkripsi dan pribadi dari aplikasi lain.';

  @override
  String get onboardingGetStarted => 'Memulai';

  @override
  String get onboardingNext => 'Berikutnya';

  @override
  String get activateDemoTitle => 'Aktifkan Demo';

  @override
  String get activateDemoCancel => 'Batal';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Anda sekarang memiliki akses demo hingga $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Tambahkan perlindungan kata sandi';

  @override
  String get setupPasswordMismatch => 'Kata sandi tidak cocok';

  @override
  String get setupPasswordFailedSeed =>
      'Gagal membuat seed. Silakan coba lagi.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Gagal melakukan inisialisasi. Kesalahan: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Kontak Anda akan tetap dienkripsi dengan kuat oleh kunci rahasia panjang, yang hanya disimpan di perangkat Anda. Namun kata sandi menambah perlindungan ekstra.';

  @override
  String get setupPasswordLabel => 'Kata sandi';

  @override
  String get setupPasswordConfirmLabel => 'Konfirmasi Kata Sandi';

  @override
  String get setupPasswordWarning =>
      'Kata sandi ini tidak dapat dipulihkan. Tuliskan dan simpan dengan aman!';

  @override
  String get setupPasswordPageTitle => 'Buat Kata Sandi';

  @override
  String get setupPasswordNext => 'Berikutnya';

  @override
  String get setupPasswordSkip => 'Lewati';

  @override
  String get confirmationCheckboxTitle =>
      'Saya memahami kata sandi saya tidak dapat dipulihkan';

  @override
  String get loginWelcomeBack => 'Selamat Datang kembali';

  @override
  String get loginPasswordLabel => 'Kata sandi';

  @override
  String get loginUnlock => 'Buka kunci';

  @override
  String get loginPasswordRequired => 'Masukkan kata sandi Anda';

  @override
  String get loginIncorrectPassword => 'Kata sandi salah. Silakan coba lagi.';

  @override
  String get paywallNoSubscription =>
      'Tidak ditemukan langganan aktif. Silakan membeli untuk melanjutkan.';

  @override
  String get lifetimeThanksTitle => 'Terima kasih telah bersama kami';

  @override
  String get lifetimeThanksSubtitle =>
      'Kami menghadiahkan akses Pro seumur hidup untuk Anda';

  @override
  String get lifetimeThanksGift => 'hadiah';

  @override
  String get lifetimeThanksCta => 'Klaim akses seumur hidup';

  @override
  String get paywallNoInternetTitle => 'Tidak Ada Koneksi Internet';

  @override
  String get paywallNoInternetBody =>
      'Koneksi internet diperlukan untuk mengakses aplikasi untuk pertama kalinya. Silakan sambungkan dan coba lagi.';

  @override
  String get paywallStoreUnavailableTitle => 'Toko Tidak Tersedia';

  @override
  String get paywallStoreUnavailableBody =>
      'Tidak dapat memuat opsi berlangganan. Silakan coba lagi.';

  @override
  String get subscriptionVerifyTitle => 'Verifikasi Langganan';

  @override
  String get subscriptionSoftWarningTitle => 'Verifikasi Langganan Diperlukan';

  @override
  String get subscriptionContinueAnyway => 'Tetap Lanjutkan';

  @override
  String subscriptionLastVerified(String date) {
    return 'Terakhir diverifikasi $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Langganan tidak dapat diverifikasi secara online.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Akses Anda berlanjut hingga $date — sambungkan sebelum itu untuk memverifikasi.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Hubungkan ke internet untuk memverifikasi langganan Anda.';

  @override
  String get organizeNoDuplicates =>
      'Tidak ada potensi duplikat yang ditemukan';

  @override
  String get organizeSkippedShownAgain =>
      'Duplikat yang dilewati akan ditampilkan lagi.';

  @override
  String get organizeShowSkippedTooltip =>
      'Tampilkan lagi grup duplikat yang dilewati';

  @override
  String organizeFailedToLoad(String error) {
    return 'Gagal memuat grup duplikat: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplikat';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Ketuk untuk melihat detailnya';

  @override
  String get organizeConflictMostlyIdentical => 'Sebagian besar identik';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count varian';
  }

  @override
  String get fieldLabelName => 'nama';

  @override
  String get fieldLabelCompany => 'perusahaan';

  @override
  String get fieldLabelPhone => 'telepon';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource => 'Impor tidak tersedia di sini.';

  @override
  String get importErrorPermissionDenied =>
      'Izin kontak diperlukan untuk mengimpor kontak.';

  @override
  String get importErrorNoContacts => 'Tidak ada kontak untuk diimpor.';

  @override
  String get importErrorUnsupportedFileType =>
      'Silakan pilih file .vcf atau arsip .zip.';

  @override
  String get importErrorInvalidFile =>
      'File yang dipilih tidak valid atau tidak dapat dibaca.';

  @override
  String get importErrorWrongPassword =>
      'Kata sandi arsip salah. Silakan coba lagi.';

  @override
  String get importErrorNoVcfInArchive =>
      'Tidak ada file .vcf yang ditemukan di arsip yang dipilih.';

  @override
  String importErrorFailed(String detail) {
    return 'Gagal mengimpor kontak: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'Kontak belum tersedia.';

  @override
  String get exportErrorNoContacts => 'Tidak ada kontak untuk diekspor.';

  @override
  String get exportErrorPasswordRequired =>
      'Kata sandi diperlukan untuk ekspor yang dilindungi.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Ekspor yang dilindungi memerlukan kata sandi minimal $min karakter.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Ekspor gagal: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Pengunduhan dimulai.';

  @override
  String get exportNoticeFileSaved => 'File berhasil disimpan.';

  @override
  String get phoneTypeMobile => 'seluler';

  @override
  String get phoneTypeHome => 'rumah';

  @override
  String get phoneTypeWork => 'bekerja';

  @override
  String get phoneTypeSchool => 'sekolah';

  @override
  String get phoneTypeOther => 'lainnya';

  @override
  String get emailTypePersonal => 'pribadi';

  @override
  String get emailTypeWork => 'bekerja';

  @override
  String get emailTypeSchool => 'sekolah';

  @override
  String get emailTypeOther => 'lainnya';

  @override
  String get addressTypeHome => 'Rumah';

  @override
  String get addressTypeWork => 'Bekerja';

  @override
  String get addressTypeSchool => 'Sekolah';

  @override
  String get addressTypeBirth => 'Kelahiran';

  @override
  String get linkTypeWebsite => 'Situs web';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Lainnya';

  @override
  String get dateTypeCreated => 'Dibuat';

  @override
  String get dateTypeBirthday => 'Hari ulang tahun';

  @override
  String get dateTypeMet => 'Bertemu';

  @override
  String get dateTypeGraduation => 'Kelulusan';

  @override
  String get dateTypeMarriage => 'Pernikahan';

  @override
  String get dateTypeOther => 'Lainnya';

  @override
  String get noNameInList => '(Tidak ada nama)';

  @override
  String get formAddPhone => 'Tambahkan telepon';

  @override
  String get formAddEmail => 'Tambahkan email';

  @override
  String get formAddAddress => 'Tambahkan alamat';

  @override
  String get formAddLink => 'Tambahkan tautan';

  @override
  String get formAddDate => 'Tambahkan tanggal';

  @override
  String get formHintPhoneNumber => 'Nomor telepon';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Alamat';

  @override
  String get formHintSelectDate => 'Pilih tanggal';

  @override
  String get formHintNotes => 'Tambahkan catatan';

  @override
  String get formCompany => 'Perusahaan';

  @override
  String get formDepartment => 'Departemen';

  @override
  String get formJobTitle => 'Jabatan';

  @override
  String get formPrefix => 'Awalan';

  @override
  String get formFirstName => 'Nama depan';

  @override
  String get formMiddleName => 'Nama tengah';

  @override
  String get formLastName => 'Nama Belakang';

  @override
  String get formSuffix => 'Akhiran';

  @override
  String get formNickname => 'Nama panggilan';

  @override
  String get contactsListTitle => 'Kontak';

  @override
  String get contactsListEmpty => 'Belum ada kontak';

  @override
  String get contactsImportButton => 'Impor Kontak';

  @override
  String get mergeContactsTitle => 'Gabungkan kontak';

  @override
  String get mergeContactsSubtitle =>
      'Pilih kontak untuk digabungkan menjadi satu';

  @override
  String get exportPasswordHint => 'Kata sandi';

  @override
  String get exportPasswordConfirmHint => 'Konfirmasikan kata sandi';

  @override
  String exportPasswordHelper(int min) {
    return 'Setidaknya $min karakter';
  }

  @override
  String get zipPasswordHint => 'Kata sandi arsip';

  @override
  String get activateDemoAccessCodeLabel => 'Kode akses';

  @override
  String get subscriptionExpiredTitle =>
      'Langganan telah habis masa berlakunya';

  @override
  String get subscriptionExpiredBody =>
      'Perpanjang untuk terus menggunakan semua fitur.';

  @override
  String get contactsLoadError => 'Tidak dapat memuat kontak.';

  @override
  String get contactsListError => 'Tidak dapat memuat kontak.';

  @override
  String get contactsSearchNoResults => 'Tidak ada kontak';

  @override
  String get supportPageIntro =>
      'Ada pertanyaan, masukan, atau sesuatu tidak berfungsi? Tim Savelon membaca setiap pesan.';

  @override
  String get supportCtaMessageTeam => 'Hubungi tim';

  @override
  String get importFromDeviceContacts => 'Dari kontak Anda';

  @override
  String get importFromFileVcfZip => 'Dari file (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Buat kata sandi unik';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Kata sandi ini tidak dapat dipulihkan.';

  @override
  String get exportProtectedArchiveCta => 'Ekspor arsip terlindungi';

  @override
  String get exportIosSavedFileWarning =>
      'File ini disimpan di folder Savelon. Jika Anda menghapus aplikasi, file ini juga akan terhapus. Pindahkan ke lokasi lain untuk menyimpannya.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Impor $count kontak ke Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Atur kata sandi';

  @override
  String get settingsChangePasswordPageTitle => 'Ubah kata sandi';

  @override
  String get settingsRemovePasswordPageTitle => 'Hapus kata sandi';

  @override
  String get settingsNewPasswordLabel => 'Kata sandi baru';

  @override
  String get settingsConfirmNewPasswordLabel => 'Konfirmasi kata sandi baru';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Masukkan lagi kata sandi baru Anda';

  @override
  String get settingsSetPasswordCta => 'Atur kata sandi';

  @override
  String get settingsChangePasswordCta => 'Ubah kata sandi';

  @override
  String get settingsRemovePasswordCta => 'Hapus kata sandi';

  @override
  String get settingsCurrentPasswordLabel => 'Kata sandi saat ini';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Masukkan kata sandi saat ini';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Kata sandi baru harus berbeda dari yang saat ini';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Gagal mengatur kata sandi: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Gagal mengubah kata sandi: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Gagal menghapus kata sandi: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Kata sandi tidak valid';

  @override
  String get settingsCurrentPasswordIncorrect => 'Kata sandi saat ini salah';

  @override
  String get settingsCurrentPasswordRequired =>
      'Kata sandi saat ini wajib diisi';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Kata sandi diperlukan saat perlindungan kata sandi diaktifkan';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Kata sandi diperlukan saat mengaktifkan opsi kata sandi';

  @override
  String get authPasswordRequiredForAccount =>
      'Kata sandi diperlukan untuk akun ini';
}
