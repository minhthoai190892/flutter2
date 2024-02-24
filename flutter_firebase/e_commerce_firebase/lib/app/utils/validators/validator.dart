class TValidator {
  static String? validateEmail({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    /// Regular expression for validating email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    // check for upper case letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one upper case letter';
    }
    // check for number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    // check for special characters
    if (value.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? validatePhoneNumer({required String? value}) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required)';
    }
    return null;
  }
  // add more validation
}
