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

        MRKStrings.forgotPasswordTitle: 'Forgot Password',
        MRKStrings.forgotPasswordSubtitle: 'Please enter the username that you\'ve used to sign up',
        MRKStrings.forgotPasswordUsername: 'Username',
        MRKStrings.forgotPasswordSubmit: 'Send Code',

        MRKStrings.verifyCodeTitle: 'Verify Code',
        MRKStrings.verifyCodeSubtitle: 'Please enter the code you received to verify that it\'s you',
        MRKStrings.verifyCodeCode: 'Code',
        MRKStrings.verifyCodeResend: 'Resend',
        MRKStrings.verifyCodeSubmit: 'Verify',

        MRKStrings.resetPasswordTitle: 'Reset Password',
        MRKStrings.resetPasswordNewPassword: 'New Password',
        MRKStrings.resetPasswordConfirmNewPassword: 'Confirm New Password',
        MRKStrings.resetPasswordSubmit: 'Reset',

        MRKStrings.viewerHome: 'Home',
        MRKStrings.viewerChat: 'Chat',
        MRKStrings.viewerNotifications: 'Notifications',
        MRKStrings.viewerProfile: 'Profile',

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
