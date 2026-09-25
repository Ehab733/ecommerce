class Validator {
  Validator._();

  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (!emailRegex.hasMatch(val)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!passwordRegex.hasMatch(val)) {
      return 'Password must include uppercase, lowercase, digit, and special character';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val != password) {
      return 'not same password';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    final RegExp phoneRegex = RegExp(r'^01[0125]\d{8}$');
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (val.length > 11 || !phoneRegex.hasMatch(val)) {
      return 'Phone number must be exactly 11 digits';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    final RegExp fullNameRegex = RegExp(r"^[a-zA-Z]{2,}(?:\s[a-zA-Z]{2,})+$");
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (!fullNameRegex.hasMatch(val)) {
      return 'Enter Valid Full name';
    } else {
      return null;
    }
  }
}
