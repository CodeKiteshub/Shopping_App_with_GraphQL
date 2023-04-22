import 'package:get/get.dart';
import 'package:styleclub/app/modules/Notifications/bindings/noti_binding.dart';
import 'package:styleclub/app/modules/Notifications/view/noti_view.dart';
import 'package:styleclub/app/modules/book/bindings/book_binding.dart';
import 'package:styleclub/app/modules/book/views/book_view.dart';
import 'package:styleclub/app/modules/congrats/bindings/congrats_binding.dart';
import 'package:styleclub/app/modules/congrats/view/congrats_view.dart';
import 'package:styleclub/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:styleclub/app/modules/login_page/bindings/login_page_pass_binding.dart';
import 'package:styleclub/app/modules/login_page/views/login_page_view.dart';
import 'package:styleclub/app/modules/login_page/views/login_password.dart';
import 'package:styleclub/app/modules/onboarding/controllers/onboarding_controller.dart';

import 'package:styleclub/app/modules/onboarding/views/range_tags.dart';
import 'package:styleclub/app/modules/payment1/bindings/payment1_binding.dart';
import 'package:styleclub/app/modules/payment1/view/payment1_view.dart';
import 'package:styleclub/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:styleclub/app/modules/reset_password/views/reset_password_view.dart';
import 'package:styleclub/app/modules/tandc/views/tandc_view.dart';
import '../modules/tandc/bindings/tandc_binding.dart';
import '../modules/add_photo/bindings/add_photo_binding.dart';
import '../modules/add_photo/views/add_photo_view.dart';
import '../modules/barber_detail_page/bindings/barber_detail_page_binding.dart';
import '../modules/barber_detail_page/views/barber_detail_page_view.dart';
import '../modules/cart_page/bindings/cart_page_binding.dart';
import '../modules/cart_page/views/cart_page_view.dart';
import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/connected/bindings/connected_binding.dart';
import '../modules/connected/views/connected_view.dart';
import '../modules/create_digital_identity/bindings/create_digital_identity_binding.dart';
import '../modules/create_digital_identity/views/create_digital_identity_view.dart';
import '../modules/deals_page/bindings/deals_page_binding.dart';
import '../modules/deals_page/views/deals_page_view.dart';
import '../modules/edit_account_settings/bindings/edit_account_settings_binding.dart';
import '../modules/edit_account_settings/views/edit_account_settings_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/edit_social_media/bindings/edit_social_media_binding.dart';
import '../modules/edit_social_media/views/edit_social_media_view.dart';
import '../modules/elevate_page/bindings/elevate_page_binding.dart';
import '../modules/elevate_page/views/elevate_page_view.dart';
import '../modules/grooming_page/bindings/grooming_page_binding.dart';
import '../modules/grooming_page/views/grooming_page_view.dart';
import '../modules/haristyle_detail_page/bindings/haristyle_detail_page_binding.dart';
import '../modules/haristyle_detail_page/views/haristyle_detail_page_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/influence_page/bindings/influence_page_binding.dart';
import '../modules/influence_page/views/influence_page_view.dart';
import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otpverify/bindings/otpverify_binding.dart';
import '../modules/otpverify/views/otpverify_view.dart';
import '../modules/photo_upload/bindings/photo_upload_binding.dart';
import '../modules/photo_upload/views/photo_upload_view.dart';
import '../modules/privilege_page/bindings/privilege_page_binding.dart';
import '../modules/privilege_page/views/privilege_page_view.dart';
import '../modules/scan_card/bindings/scan_card_binding.dart';
import '../modules/scan_card/views/scan_card_view.dart';
import '../modules/see_profile/bindings/see_profile_binding.dart';
import '../modules/see_profile/views/see_profile_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/share/bindings/share_binding.dart';
import '../modules/share/views/share_view.dart';
import '../modules/shop_details_page/bindings/shop_details_page_binding.dart';
import '../modules/shop_details_page/views/shop_details_page_view.dart';
import '../modules/shop_page/bindings/shop_page_binding.dart';
import '../modules/shop_page/views/shop_page_view.dart';
import '../modules/signup_page/bindings/signup_page_binding.dart';
import '../modules/signup_page/views/signup_page_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/splashes/bindings/splashes_binding.dart';
import '../modules/splashes/views/splashes_view.dart';
import '../modules/styling_page/bindings/styling_page_binding.dart';
import '../modules/styling_page/views/styling_page_view.dart';
import '../modules/success_page/bindings/success_page_binding.dart';
import '../modules/success_page/views/success_page_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.RESET_PAGE,
        page: () => const ResetPagePassView(),
        binding: ResetPageBinding()),

    GetPage(
      name: _Paths.NOTI,
      page: () => const NotiView(),
      binding: NotiBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT1,
      page: () => const Payment1View(),
      binding: Payment1Binding(),
    ),
    GetPage(
      name: _Paths.CONGRATS,
      page: () => const CongratsView(),
      binding: CongratsBinding(),
    ),
    GetPage(
      name: _Paths.TANDC,
      page: () => const TANDCView(),
      binding: TandCBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_UPLOAD,
      page: () => const PhotoUploadView(),
      binding: PhotoUploadBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_PAGE,
      page: () => SuccessPageView(),
      binding: SuccessPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHES,
      page: () => const SplashesView(),
      binding: SplashesBinding(),
    ),
    GetPage(
      name: _Paths.ELEVATE_PAGE,
      page: () => const ElevatePageView(),
      binding: ElevatePageBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PAGE,
      page: () => SignupPageView(),
      binding: SignupPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () =>  LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE_PASS,
      page: () => const LoginPagePassView(),
      binding: LoginPagePassBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.INFLUENCE_PAGE,
      page: () => const InfluencePageView(),
      binding: InfluencePageBinding(),
    ),
    GetPage(
      name: _Paths.DEALS_PAGE,
      page: () => const DealsPageView(),
      binding: DealsPageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_PAGE,
      page: () => ChatPageView(),
      binding: ChatPageBinding(),
    ),

    GetPage(
      name: _Paths.OTPVERIFY,
      page: () => OtpverifyView(),
      binding: OtpverifyBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_DIGITAL_IDENTITY,
      page: () => CreateDigitalIdentityView(),
      binding: CreateDigitalIdentityBinding(),
    ),
    GetPage(
      name: _Paths.SEE_PROFILE,
      page: () => SeeProfileView(),
      binding: SeeProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_SOCIAL_MEDIA,
      page: () => EditSocialMediaView(),
      binding: EditSocialMediaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACCOUNT_SETTINGS,
      page: () => EditAccountSettingsView(),
      binding: EditAccountSettingsBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_CARD,
      page: () => ScanCardView(),
      binding: ScanCardBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PHOTO,
      page: () => AddPhotoView(),
      binding: AddPhotoBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.CONNECTED,
      page: () => ConnectedView(),
      binding: ConnectedBinding(),
    ),
    GetPage(
      name: _Paths.SHARE,
      page: () => ShareView(),
      binding: ShareBinding(),
    ),
    GetPage(
      name: _Paths.PRIVILEGE_PAGE,
      page: () => const PrivilegePageView(),
      binding: PrivilegePageBinding(),
    ),
    GetPage(
      name: _Paths.GROOMING_PAGE,
      page: () => const GroomingPageView(),
      binding: GroomingPageBinding(),
    ),
    GetPage(
      name: _Paths.HARISTYLE_DETAIL_PAGE,
      page: () => const HaristyleDetailPageView(),
      binding: HaristyleDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.BARBER_DETAIL_PAGE,
      page: () =>  BarberDetailPageView(),
      binding: BarberDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.STYLING_PAGE,
      page: () => StylingPageView(),
      binding: StylingPageBinding(),
    ),
    GetPage(name: _Paths.BOOK, page: () => BookView(), binding: BookBinding()),
    GetPage(
      name: _Paths.SHOP_PAGE,
      page: () => const ShopPageView(),
      binding: ShopPageBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_DETAILS_PAGE,
      page: () => ShopDetailsPageView(),
      binding: ShopDetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => CartPageView(),
      binding: CartPageBinding(),
    ),
    // GetPage(
    //   name: _Paths.HEIGHT_PAGE,
    //   page: ()=>BuildHeightPage(),
    //   binding:OnboardingBinding(),)
  ];
}
