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
        MRKStrings.homeDrawerExpert: 'Become An Expert',
        MRKStrings.homeDrawerLogout: 'Logout',

        MRKStrings.profileTitle: 'Profile',
        MRKStrings.profilePortfolio: 'Portfolio',
        MRKStrings.profileCertificates: 'Certificates',
        MRKStrings.profilePackages: 'Packages',
        MRKStrings.profileTips: 'Tips',
        MRKStrings.profileHire: 'Hire',

        MRKStrings.hireTitle: 'Select Your Preferred Package',
        MRKStrings.hireSubmit: 'Submit',

        MRKStrings.paymentTitle: 'Online Payment',

        MRKStrings.paymentConfirmationSuccess: 'Congratulations, You\'ve Successfully Hired An Expert!',
        MRKStrings.paymentConfirmationFail: 'We\'re Sorry We Couldn\'t Complete The Payment!',

        MRKStrings.addPackageTitle: 'Create Package',
        MRKStrings.addPackageSubtitle: 'Title',
        MRKStrings.addPackageDescription: 'Description',
        MRKStrings.addPackageCost: 'Cost',
        MRKStrings.addPackageDuration: 'Duration (In Days)',
        MRKStrings.addPackageSubmit: 'Create',

        MRKStrings.becomeExpertTitle: 'Become An Expert',
        MRKStrings.becomeExpertSubmit: 'Submit',

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

        MRKStrings.addTipTitle: 'Create Tip',
        MRKStrings.addTipName: 'Tip Title',
        MRKStrings.addTipContent: 'Tip Content',
        MRKStrings.addTipTags: 'Tip Tags',
        MRKStrings.addTipSubmit: 'Create',

        MRKStrings.tipRatingTitle: 'Reviewing %s',
        MRKStrings.tipRatingDescription: 'Tap a star to set your rating',
        MRKStrings.tipRatingSubmit: 'Submit Your Review',

        MRKStrings.communityTitle: 'Community',

        MRKStrings.addCommunityTitle: 'Create Community Business',
        MRKStrings.addCommunityName: 'Business Name',
        MRKStrings.addCommunitySubtitle: 'Business Field',
        MRKStrings.addCommunityDescription: 'About The Business',
        MRKStrings.addCommunityOffer: 'Markey Offer',
        MRKStrings.addCommunitySubmit: 'Create',

        MRKStrings.businessCardAbout: 'About',
        MRKStrings.businessCardOffer: 'Special Offers For Markey Community',
        MRKStrings.businessCardReviewTitle: 'Have You Tried This Place?',
        MRKStrings.businessCardReviewSubmit: 'Submit Your Review',

        MRKStrings.businessRatingTitle: 'Reviewing %s',
        MRKStrings.businessRatingDescription: 'Tap a star to set your rating',
        MRKStrings.businessRatingSubmit: 'Submit Your Review',

        MRKStrings.selectServicesTitle: 'Select Services',
        MRKStrings.selectServicesSubmit: 'Get Experts',

        MRKStrings.mallTitle: 'Mall',
        MRKStrings.mallPlaceholder: 'No Results Found!',

        MRKStrings.sharedViewAll: 'View All',
        MRKStrings.sharedSearch: 'Search ..',
        MRKStrings.sharedPrice: '%s £',
        MRKStrings.sharedDurationInDays: '%s Days',

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
