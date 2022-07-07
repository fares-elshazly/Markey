import 'package:get/get.dart';

import '/Resources/strings.dart';

class MRKTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        MRKStrings.loginUsername: 'Username',
        MRKStrings.loginPassword: 'Password',
        MRKStrings.loginForgotPassword: 'Forgot password?',
        MRKStrings.loginSubmit: 'Sign In',
        MRKStrings.loginDontHaveAccount: 'Don\'t have an account?',
        MRKStrings.loginRegister: 'Sign Up',

        MRKStrings.registerTitle: 'Sign Up',
        MRKStrings.registerUsername: 'Username',
        MRKStrings.registerName: 'Full Name',
        MRKStrings.registerPassword: 'Password',
        MRKStrings.registerConfirmPassword: 'Confirm Password',
        MRKStrings.registerSubmit: 'Sign Up',

        MRKStrings.successTitle: 'Success!',
        MRKStrings.errorTitle: 'Something went wrong!',
        MRKStrings.emptyError: 'This field is required',
        MRKStrings.emailError: 'Invalid email address',
        MRKStrings.passwordError: 'Invalid password min 6 digits',
        MRKStrings.passwordMatchError: 'Your password and confirmation password do not match',
      },
      'ar': {
        MRKStrings.successTitle: 'تم بنجاح!',
        MRKStrings.errorTitle: 'هناك خطأ ما!',
        MRKStrings.emptyError: 'هذه الخانة مطلوبه',
        MRKStrings.emailError: 'بريد الكتروني غير صحيح',
        MRKStrings.passwordError: 'كلمة مرور غير صالحة على الأقل ٦ خانات',
        MRKStrings.passwordMatchError: 'كلمة المرور وتأكيد كلمة المرور غير متطابقين',
      }
    };
  }
}
