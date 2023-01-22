class MyValidator {
  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a password';
    } else if (value.length < 6) {
      return 'Minimum 6 Character required for Password';
    } else {
      return null;
    }
  }

  static String? validateFullName(String value, String fieldName) {
    value = value.trim();
//if Company name with Digits then use this REGEX : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
    RegExp regex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
    if (value == null || value.isEmpty) {
      return 'Enter a $fieldName';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid $fieldName';
    } else {
      return null;
    }
  }

  static String? validateNumber(String value, String fieldName) {
    RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
    if (value == null || value.isEmpty || value == '') {
      return 'Enter a $fieldName';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter valid $fieldName';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String? passwordText) {
    if (value == null || value.isEmpty || value != passwordText) {
      return 'Password does not match';
    }
    return null;
  }

  static String? validateEmptyField(String value, String fieldName) {
    value = value.trim();
    if (value == null || value.isEmpty || value == '') {
      return 'Enter a $fieldName';
    } else {
      return null;
    }
  }
}
