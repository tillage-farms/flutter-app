import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhost_flutter_auth/nhost_flutter_auth.dart';

class AuthController extends GetxController {
  TextEditingController? usernameTextEditingController;
  TextEditingController? emailTextEditingController;
  TextEditingController? passwordTextEditingController;

  final _username = ''.obs;
  String get username => this._username.value;
  set username(String value) => this._username.value = value;

  final _email = ''.obs;
  String get email => this._email.value;
  set email(String value) => this._email.value = value;

  final _password = ''.obs;
  String get password => this._password.value;
  set password(String value) => this._password.value = value;

  @override
  void onInit() {
    super.onInit();
    usernameTextEditingController = TextEditingController(text: username);
    emailTextEditingController = TextEditingController(text: email);
    passwordTextEditingController = TextEditingController(text: password);
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signInOrSignUp() async {
    NhostClient nhostClient = Get.find<NhostClient>();
    try {
      await nhostClient.auth.login(email: email, password: password);
      return;
    } on ApiException {
      // Sign in failed, so try to register instead
      await nhostClient.auth.register(email: email, password: password);
    }
  }
}
