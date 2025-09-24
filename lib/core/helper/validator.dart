class Validator {
  /// Validates if the field is not empty
  static String? required(String? value, {String fieldName = "This field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    const pattern =
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  }


  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < minLength) {
      return "Password must be at least $minLength characters";
    }
    return null;
  }
  static String? confirmPassword(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != original) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? number(String? value, {num? min, num? max}) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    final number = num.tryParse(value);
    if (number == null) {
      return "Enter a valid number";
    }
    if (min != null && number < min) {
      return "Value must be at least $min";
    }
    if (max != null && number > max) {
      return "Value must be at most $max";
    }
    return null;
  }
}
