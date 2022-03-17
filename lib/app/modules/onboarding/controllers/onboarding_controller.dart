import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/data/models/app_models.dart';
import 'package:tillage_farms/app/data/providers/appwrite_account_provider.dart';
import 'package:tillage_farms/app/modules/home/bindings/home_binding.dart';
import 'package:tillage_farms/app/modules/home/views/home_view.dart';
import 'package:tillage_farms/app/modules/onboarding/views/business_info.dart';
import 'package:tillage_farms/app/routes/qlevar_router.dart';
import 'package:tillage_farms/app/widgets/buttons.dart';

class OnboardingController extends GetxController {
  final AppwriteAccountProvider appwriteAccountProvider =
      Get.find<AppwriteAccountProvider>();

  final SubmitButtonController submitButtonController =
      Get.find<SubmitButtonController>();

  final Box box = Get.find<Box>();

  final _username = "New Business Client".obs;
  String get username => _username.value;
  set username(String value) => _username.value = value;

  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;

  final _pageTitle = ''.obs;
  get pageTitle => _pageTitle.value;
  set pageTitle(value) => _pageTitle.value = value;

  final _pageSubTitle = ''.obs;
  get pageSubTitle => _pageSubTitle.value;
  set pageSubTitle(value) => _pageSubTitle.value = value;

  final _primaryButtonText = 'Continue'.obs;
  get primaryButtonText => _primaryButtonText.value;
  set primaryButtonText(value) => _primaryButtonText.value = value;

  final RxString? _secondaryButtonText = "Create An Account".obs;
  get secondaryButtonText => _secondaryButtonText?.value;
  set secondaryButtonText(value) => _secondaryButtonText?.value = value;

  final businessProfile = BusinessProfileDTO(
    name: "",
    industry: "",
    phoneNumber: "",
    homeAddress: "",
    country: "",
    region: "",
    city: "",
  ).obs;

  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  late Worker _worker;

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController industryTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController homeAddressTextEditingController =
      TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController regionTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    populateInputFields();

    _worker = everAll([_username, _email, _password], (_) {
      submitButtonController.isFormValid =
          ((email.isEmail && password.isNotEmpty));
    });
  }

  @override
  void onClose() {
    super.onClose();
    usernameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    _username.close();
    _email.close();
    _password.close();
    businessProfile.close();
    _worker.dispose();
  }

  Future<Session?> createAccountSession() async {
    return appwriteAccountProvider.createAccountSession(
      email: email,
      password: password,
    );
  }

  Future<void> createAccount() async {
    Session? session = await appwriteAccountProvider.createAccount(
      email: email,
      password: password,
      name: username,
    );

    if (session != null) {
      QR.toName(AppRoutes.businessInfo);
    }
  }

  void toggleShowPassword() {
    _obscureText.toggle();
  }

  completeOnboarding() async {
    User? userWithPrefs;
    User? userWithName;
    userWithName = await appwriteAccountProvider.updateUserName(
        name: businessProfile().name);
    userWithPrefs = await appwriteAccountProvider.updateUserPrefs(
      prefs: BusinessProfile(
        name: businessProfile().name,
        industry: businessProfile().industry,
        phoneNumber: businessProfile().phoneNumber,
        homeAddress: businessProfile().homeAddress,
        country: businessProfile().country,
        region: businessProfile().region,
        city: businessProfile().city,
      ).toJson(),
    );
    if (userWithName != null && userWithPrefs != null) {
      // await appwriteAccountProvider.createEmailVerification(url: "");
      // box.put("initialRoute", AppRout);
      Get.offAll(() => HomeView(), binding: HomeBinding());
    }
  }

  void populateInputFields() {
    usernameTextEditingController.text = username;
    emailTextEditingController.text = email;
    passwordTextEditingController.text = password;
    nameTextEditingController.text = businessProfile().name;
    industryTextEditingController.text = businessProfile().industry;
    phoneNumberTextEditingController.text = businessProfile().phoneNumber;
    homeAddressTextEditingController.text = businessProfile().homeAddress;
    countryTextEditingController.text = businessProfile().country;
    regionTextEditingController.text = businessProfile().region;
    cityTextEditingController.text = businessProfile().city;
  }

  onPrimaryButtonPressed() {}

  onSecondaryButtonPressed() {}
}

// user(role:guest) account missing scope account
