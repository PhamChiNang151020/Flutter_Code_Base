class MyValidator {
  MyValidator._();
  static String? notEmptyEmailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    if (!isValidEmail(value.trim())) {
      return 'Invalid email format, please try again';
    }

    return null;
  }

  static bool isValidEmail(String email) {
    // Define a regex pattern to match email format
    final regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z]+)+$");
    return regExp.hasMatch(email);
  }

  static const passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain at least 1 lowercase letter';
    }

    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter';
    }

    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least 1 numeric value';
    }

    return null;
  }
}
