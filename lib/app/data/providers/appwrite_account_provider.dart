import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/widgets/buttons.dart';

class AppwriteAccountProvider extends GetxController {
  static Client appwriteClient = Get.find<Client>();
  static Box box = Get.find<Box>();

  SubmitButtonController submitButtonController =
      Get.find<SubmitButtonController>();

  final Account _account = Account(appwriteClient);

  static Account get account => Account(appwriteClient);

  final Rx<User?> _currentUser = Rx<User?>(null);
  User? get currentUser => _currentUser.value;
  set currentUser(User? value) => _currentUser.value = value;

  final Rx<Session?> _currentSession = Rx<Session?>(null);
  Session? get currentSession => _currentSession.value;
  set currentSession(Session? value) => _currentSession.value = value;

  @override
  void onInit() async {
    super.onInit();
    // currentUser = await getCurrentUser();

    String sessionId = await box.get("sessionId", defaultValue: "");
    print("sessionId: $sessionId");
    if (sessionId.isNotEmpty) {
      currentSession = await getSessionById(sessionId: sessionId);
      print("current session: ${currentSession.toString()}");
    }
  }

  //  Create Account
  Future<Session?> createAccount({
    String userId = "unique()",
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;

      User? user = await _account.create(
        userId: userId,
        email: email,
        password: password,
      );
      currentUser = user;

      // submitButtonController.buttonState = ButtonState.success;

      return createAccountSession(email: email, password: password);
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Account Session
  Future<Session?> createAccountSession({
    required String email,
    required String password,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;

      Session session = await _account.createSession(
        email: email,
        password: password,
      );
      currentSession = session;
      box.put("sessionId", session.$id);

      submitButtonController.buttonState = ButtonState.success;
      return session;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Account Session with OAuth2
  Future<Session?> createAccountSessionWithOAuth2({
    required String provider,
    String? success,
    String? failure,
    List<dynamic>? scopes,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Session session = await _account.createOAuth2Session(
        provider: provider,
        success: success,
        failure: failure,
        scopes: scopes,
      );
      submitButtonController.buttonState = ButtonState.success;
      return session;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Magic URL session
  Future<Token?> createMagicURLSession({
    required String userId,
    required String email,
    String? url,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Token token = await _account.createMagicURLSession(
        userId: userId,
        email: email,
        url: url,
      );
      submitButtonController.buttonState = ButtonState.success;
      return token;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Magic URL session (confirmation)
  Future<Session?> updateMagicURLSession({
    required String userId,
    required String secret,
    String? url,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Session session = await _account.updateMagicURLSession(
        userId: userId,
        secret: secret,
      );
      submitButtonController.buttonState = ButtonState.success;
      return session;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Anonymous Session
  Future<Session?> createAnonymousSession() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Session session = await _account.createAnonymousSession();
      submitButtonController.buttonState = ButtonState.success;
      return session;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Account JWT
  Future<Jwt?> createJWT() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Jwt jwt = await _account.createJWT();
      submitButtonController.buttonState = ButtonState.success;
      return jwt;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Get Account
  Future<User?> getCurrentUser() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      User user = await _account.get();
      submitButtonController.buttonState = ButtonState.success;
      return user;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Get Account Preferences
  Future<Preferences?> getCurrentUserPrefs() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Preferences preferences = await _account.getPrefs();
      submitButtonController.buttonState = ButtonState.success;
      return preferences;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Get Account Sessions
  Future<SessionList?> getSessions() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      SessionList sessionList = await _account.getSessions();
      submitButtonController.buttonState = ButtonState.success;
      return sessionList;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Get Account Logs
  Future<LogList?> getActivityLogs() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      LogList logList = await _account.getLogs();
      submitButtonController.buttonState = ButtonState.success;
      return logList;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Get Session By ID
  Future<Session?> getSessionById({
    required String sessionId,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Session session = await _account.getSession(sessionId: sessionId);
      submitButtonController.buttonState = ButtonState.success;
      return session;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Update Account Name
  Future<User?> updateUserName({
    required String name,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      User user = await _account.updateName(name: name);
      submitButtonController.buttonState = ButtonState.success;
      return user;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Update Account Password
  Future<User?> updatePassword({
    required String password,
    String? oldPassword,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      User user = await _account.updatePassword(
        password: password,
        oldPassword: oldPassword,
      );
      submitButtonController.buttonState = ButtonState.success;
      return user;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Update Account Email
  Future<User?> updateEmail({
    required String email,
    required String password,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      User user = await _account.updateEmail(
        email: email,
        password: password,
      );
      submitButtonController.buttonState = ButtonState.success;
      return user;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Update Account Preferences
  Future<User?> updateUserPrefs({
    required Map<String, dynamic> prefs,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      User user = await _account.updatePrefs(prefs: prefs);
      submitButtonController.buttonState = ButtonState.success;
      return user;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Delete Account
  Future<void> deleteAccount() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      await _account.delete();
      submitButtonController.buttonState = ButtonState.success;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
  }

//  Delete Account Session
  Future<void> deleteAccountSession({
    required String sessionId,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      await box.clear();
      await _account.deleteSession(sessionId: sessionId);
      submitButtonController.buttonState = ButtonState.success;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
  }

//  Update Session (Refresh Tokens)
  Future<Session?> updateSession({
    required String sessionId,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Session session = await _account.updateSession(sessionId: sessionId);
      submitButtonController.buttonState = ButtonState.success;
      return session;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Delete All Account Sessions
  Future<void> deleteAccountSessions() async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      await _account.deleteSessions();
      submitButtonController.buttonState = ButtonState.success;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
  }

//  Create Password Recovery
  Future<Token?> createPasswordRecovery({
    required String email,
    required String url,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Token token = await _account.createRecovery(
        email: email,
        url: url,
      );
      submitButtonController.buttonState = ButtonState.success;
      return token;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Update Password Recovery (confirmation)
  Future<Token?> updatePasswordRecovery({
    required String userId,
    required String secret,
    required String password,
    required String passwordAgain,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Token token = await _account.updateRecovery(
        userId: userId,
        secret: secret,
        password: password,
        passwordAgain: passwordAgain,
      );
      submitButtonController.buttonState = ButtonState.success;
      return token;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Create Email Verification
  Future<Token?> createEmailVerification({
    required String url,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;
      Token token = await _account.createVerification(url: url);
      submitButtonController.buttonState = ButtonState.success;
      return token;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

//  Update Email Verification (confirmation)
  Future<Token?> updateEmailVerification({
    required String userId,
    required String secret,
  }) async {
    try {
      submitButtonController.buttonState = ButtonState.loading;

      Token token = await _account.updateVerification(
        userId: userId,
        secret: secret,
      );

      submitButtonController.buttonState = ButtonState.success;
      return token;
    } on AppwriteException catch (e) {
      handleAppwriteException(exception: e);
      submitButtonController.buttonState = ButtonState.error;
    }
    return null;
  }

  void handleAppwriteException({required AppwriteException exception}) {
    print(exception.message);

    Get.snackbar(
      "Something went wrong",
      exception.message ?? "Please try again later",
      snackPosition: SnackPosition.BOTTOM,
    );
    /* QR.show(
      QDialog.text(
        text: Text("Something went wrong"),
      ),
    );
 */
  }
}
