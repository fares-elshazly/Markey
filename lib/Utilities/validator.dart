import 'package:get/get.dart';
import '/Resources/strings.dart';

abstract class Validator {
  static String? isNotEmpty(String? value) {
    if (value == null || value.isEmpty) return MRKStrings.emptyError.tr;
    return null;
  }

  static String? isEmail(String? value) {
    if (value == null) return MRKStrings.emailError.tr;
    final isValid = GetUtils.isEmail(value);
    if (!isValid) return MRKStrings.emailError.tr;
    return null;
  }

  static String? isValidPassword(String? value) {
    if (value == null) return MRKStrings.passwordError.tr;
    final checkLength = GetUtils.isLengthGreaterOrEqual(value, 8);
    final checkUpperCase = GetUtils.hasCapitalletter(value);
    if (!checkLength || !checkUpperCase) return MRKStrings.passwordError.tr;
    return null;
  }

  static String? isMatchingPassword(String? value, String? password) {
    if (value == null || password == null) return MRKStrings.passwordMatchError.tr;
    if (value.isEmpty) return MRKStrings.emptyError.tr;
    if (value != password) return MRKStrings.passwordMatchError.tr;
    return null;
  }
}
