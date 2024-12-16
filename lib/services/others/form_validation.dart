mixin FormValidationMixin {
  ///Validate if the field is not empty
  String? validateRequiredFiled(String? value, {String filedName = "Fieled"}) {
    if (value == null || value.trim().isEmpty) {
      return "$filedName is required";
    }
    return null;
  }

  // Validates if the email is in a proper format
  String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);

    if (value == null || value.trim().isEmpty) {
      return "Email is required.";
    } else if (!regex.hasMatch(value)) {
      return "Enter a valid email address.";
    }
    return null;
  }

  // Validates if the password meets minimum criteria
  String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return "Password is required.";
    } else if (value.length < minLength) {
      return "Password must be at least $minLength characters long.";
    }
    return null;
  }

  // Validates if two fields match (e.g., password and confirm password)
  String? validateConfirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required.";
    } else if (value != originalPassword) {
      return "Passwords do not match.";
    }
    return null;
  }

  // Custom validation with a condition
  String? validateCustom(
      String? value, bool Function(String?) validator, String errorMessage) {
    if (!validator(value)) {
      return errorMessage;
    }
    return null;
  }
}
