class FormValidation {
  FormValidation._();

  static bool hasName(
    String firstName,
    String lastName,
    String nickname,
  ) {
    return firstName.isNotEmpty ||
        lastName.isNotEmpty ||
        nickname.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }
}
