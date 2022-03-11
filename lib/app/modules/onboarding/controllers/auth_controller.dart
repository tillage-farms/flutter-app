import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
// import 'package:nhost_flutter_auth/nhost_flutter_auth.dart';

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

  Future<void> signIn() async {
    try {
      Client client = Get.find<Client>();
      Account account = Account(client);

      User user = await account.create(
        userId: 'unique()',
        email: email,
        password: password,
        name: 'Parables',
      );

      Session session = await account.createSession(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }
}
