import 'package:get/get.dart';

import '../modules/personalization/address/bindings/address_binding.dart';
import '../modules/personalization/address/views/address_view.dart';
import '../modules/authentication/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/authentication/forgetpassword/views/forgetpassword_view.dart';
import '../modules/authentication/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/authentication/loginscreen/views/loginscreen_view.dart';
import '../modules/authentication/onboarding/bindings/onboarding_binding.dart';
import '../modules/authentication/onboarding/views/onboarding_view.dart';
import '../modules/authentication/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/authentication/resetpassword/views/resetpassword_view.dart';
import '../modules/authentication/signup/bindings/signup_binding.dart';
import '../modules/authentication/signup/views/signup_view.dart';
import '../modules/personalization/bindings/personalization_binding.dart';
import '../modules/personalization/views/personalization_view.dart';
import '../modules/shop/homescreen/bindings/homescreen_binding.dart';
import '../modules/shop/homescreen/views/homescreen_view.dart';
import '../modules/shop/product_detail/bindings/product_detail_binding.dart';
import '../modules/shop/product_detail/views/product_detail_view.dart';
import '../modules/shop/product_reviews/bindings/product_reviews_binding.dart';
import '../modules/shop/product_reviews/views/product_reviews_view.dart';
import '../modules/shop/store/bindings/store_binding.dart';
import '../modules/shop/store/views/store_view.dart';
import '../modules/shop/wishlist/bindings/wishlist_binding.dart';
import '../modules/shop/wishlist/views/wishlist_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => const LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => const ForgetpasswordView(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.HOMESCREEN,
      page: () => const HomescreenView(),
      binding: HomescreenBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => const StoreView(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.PERSONALIZATION,
      page: () => const PersonalizationView(),
      binding: PersonalizationBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_REVIEWS,
      page: () => const ProductReviewsView(),
      binding: ProductReviewsBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
  ];
}
