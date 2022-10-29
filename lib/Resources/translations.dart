import 'package:get/get.dart';

import '/Resources/strings.dart';

class MRKTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        MRKStrings.loginUsername: 'Email',
        MRKStrings.loginPassword: 'Password',
        MRKStrings.loginForgotPassword: 'Forgot password?',
        MRKStrings.loginSubmit: 'Sign In',
        MRKStrings.loginDontHaveAccount: 'Don\'t have an account?',
        MRKStrings.loginRegister: 'Sign Up',

        MRKStrings.registerTitle: 'Sign Up',
        MRKStrings.registerUsername: 'Username',
        MRKStrings.registerName: 'Full Name',
        MRKStrings.registerEmail: 'Email',
        MRKStrings.registerPassword: 'Password',
        MRKStrings.registerConfirmPassword: 'Confirm Password',
        MRKStrings.registerReferral: 'Referral Code',
        MRKStrings.registerSubmit: 'Continue',

        MRKStrings.registerTagsTitle: 'Interests',
        MRKStrings.registerTagsSubtitle: 'Select At Least One Interest',
        MRKStrings.registerTagsSubmit: 'Sign Up',

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

        MRKStrings.homeGreeting: 'Hello 👋🏻',
        MRKStrings.homeActiveProjects: 'Active Projects',
        MRKStrings.homeTipsters: 'Tipsters',
        MRKStrings.homeCommunity: 'Community',

        MRKStrings.homeDrawerProfile: 'Profile',
        MRKStrings.homeDrawerChats: 'Chats',
        MRKStrings.homeDrawerWallet: 'Wallet',
        MRKStrings.homeDrawerSettings: 'Settings',
        MRKStrings.homeDrawerSupport: 'Support',
        MRKStrings.homeDrawerLogout: 'Logout',

        MRKStrings.profileTitle: 'Profile',
        MRKStrings.profileStatsRate: 'Rating',
        MRKStrings.profileStatsTips: 'Tips',
        MRKStrings.profileStatsVotes: 'Votes',
        MRKStrings.profilePortfolio: 'Portfolio',
        MRKStrings.profilePackages: 'Packages',
        MRKStrings.profileTips: 'Tips',

        MRKStrings.chatTitle: 'Chat',

        MRKStrings.notificationsTitle: 'Notifications',

        MRKStrings.settingsTitle: 'Settings',
        MRKStrings.settingsBecomeExpert: 'Become An Expert',
        MRKStrings.settingsEditProfile: 'Edit Profile',
        MRKStrings.settingsLanguage: 'Language',
        MRKStrings.settingsPrivacy: 'Privacy Policy',
        MRKStrings.settingsShare: 'Tell A Friend',
        MRKStrings.settingsLogout: 'Logout',

        MRKStrings.tipsTitle: 'Tipsters',

        MRKStrings.communityTitle: 'Community',

        MRKStrings.businessCardAbout: 'About',
        MRKStrings.businessCardOffer: 'Special Offers For Markey Community',
        MRKStrings.businessCardReviewTitle: 'Have You Tried This Place?',
        MRKStrings.businessCardReviewSubmit: 'Submit Your Review',

        MRKStrings.mallTitle: 'Mall',
        MRKStrings.mallServices: 'Services',
        MRKStrings.mallShops: 'Shops',

        MRKStrings.sharedViewAll: 'View All',
        MRKStrings.sharedSearch: 'Search ..',

        MRKStrings.successTitle: 'Success!',
        MRKStrings.errorTitle: 'Something went wrong!',
        MRKStrings.emptyError: 'This field is required',
        MRKStrings.emailError: 'Invalid email address',
        MRKStrings.passwordError: 'Invalid password min 8 digits, contains upper-case',
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
