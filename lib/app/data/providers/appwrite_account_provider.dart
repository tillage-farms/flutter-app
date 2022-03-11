import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

class AppwriteAccountProvider extends GetxController with StateMixin {
  static Client appwriteClient = Get.find<Client>();

  final Account _account = Account(appwriteClient);

  static Account get account => Account(appwriteClient);

  //  Create Account
  Future<User?> createAccount({
    String userId = "unique()",
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      User user = await _account.create(
        userId: userId,
        email: email,
        password: password,
      );
      change(null, status: RxStatus.success());
      return user;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Create Account Session
  Future<Session?> createAccountSession({
    required String email,
    required String password,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Session session = await _account.createSession(
        email: email,
        password: password,
      );
      change(null, status: RxStatus.success());
      return session;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
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
      change(null, status: RxStatus.loading());
      Session session = await _account.createOAuth2Session(
        provider: provider,
        success: success,
        failure: failure,
        scopes: scopes,
      );
      change(null, status: RxStatus.success());
      return session;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Create Magic URL session
  Future<Token?> createMagicURLSession({
    required String userId,
    required String email,
    String? url,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Token token = await _account.createMagicURLSession(
        userId: userId,
        email: email,
        url: url,
      );
      change(null, status: RxStatus.success());
      return token;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Create Magic URL session (confirmation)
  Future<Session?> updateMagicURLSession({
    required String userId,
    required String secret,
    String? url,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Session session = await _account.updateMagicURLSession(
        userId: userId,
        secret: secret,
      );
      change(null, status: RxStatus.success());
      return session;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Create Anonymous Session
  Future<Session?> createAnonymousSession() async {
    try {
      change(null, status: RxStatus.loading());
      Session session = await _account.createAnonymousSession();
      change(null, status: RxStatus.success());
      return session;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Create Account JWT
  Future<Jwt?> createJWT() async {
    try {
      change(null, status: RxStatus.loading());
      Jwt jwt = await _account.createJWT();
      change(null, status: RxStatus.success());
      return jwt;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Get Account
  Future<User?> getCurrentUser() async {
    try {
      change(null, status: RxStatus.loading());
      User user = await _account.get();
      change(null, status: RxStatus.success());
      return user;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Get Account Preferences
  Future<Preferences?> getCurrentUserPrefs() async {
    try {
      change(null, status: RxStatus.loading());
      Preferences preferences = await _account.getPrefs();
      change(null, status: RxStatus.success());
      return preferences;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Get Account Sessions
  Future<SessionList?> getSessions() async {
    try {
      change(null, status: RxStatus.loading());
      SessionList sessionList = await _account.getSessions();
      change(null, status: RxStatus.success());
      return sessionList;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Get Account Logs
  Future<LogList?> getActivityLogs() async {
    try {
      change(null, status: RxStatus.loading());
      LogList logList = await _account.getLogs();
      change(null, status: RxStatus.success());
      return logList;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Get Session By ID
  Future<Session?> getSessionById({
    required String sessionId,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Session session = await _account.getSession(sessionId: sessionId);
      change(null, status: RxStatus.success());
      return session;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Update Account Name
  Future<User?> updateUserName({
    required String name,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      User user = await _account.updateName(name: name);
      change(null, status: RxStatus.success());
      return user;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Update Account Password
  Future<User?> updatePassword({
    required String password,
    String? oldPassword,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      User user = await _account.updatePassword(
        password: password,
        oldPassword: oldPassword,
      );
      change(null, status: RxStatus.success());
      return user;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Update Account Email
  Future<User?> updateEmail({
    required String email,
    required String password,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      User user = await _account.updateEmail(
        email: email,
        password: password,
      );
      change(null, status: RxStatus.success());
      return user;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Update Account Preferences
  Future<User?> updateUserPrefs({
    required Map<String, dynamic> prefs,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      User user = await _account.updatePrefs(prefs: prefs);
      change(null, status: RxStatus.success());
      return user;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Delete Account
  Future<void> deleteAccount() async {
    try {
      change(null, status: RxStatus.loading());
      await _account.delete();
      change(null, status: RxStatus.success());
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
  }

//  Delete Account Session
  Future<void> deleteAccountSession({
    required String sessionId,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      await _account.deleteSession(sessionId: sessionId);
      change(null, status: RxStatus.success());
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
  }

//  Update Session (Refresh Tokens)
  Future<Session?> updateSession({
    required String sessionId,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Session session = await _account.updateSession(sessionId: sessionId);
      change(null, status: RxStatus.success());
      return session;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Delete All Account Sessions
  Future<void> deleteAccountSessions() async {
    try {
      change(null, status: RxStatus.loading());
      await _account.deleteSessions();
      change(null, status: RxStatus.success());
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
  }

//  Create Password Recovery
  Future<Token?> createPasswordRecovery({
    required String email,
    required String url,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Token token = await _account.createRecovery(
        email: email,
        url: url,
      );
      change(null, status: RxStatus.success());
      return token;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
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
      change(null, status: RxStatus.loading());
      Token token = await _account.updateRecovery(
        userId: userId,
        secret: secret,
        password: password,
        passwordAgain: passwordAgain,
      );
      change(null, status: RxStatus.success());
      return token;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Create Email Verification
  Future<Token?> createEmailVerification({
    required String url,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Token token = await _account.createVerification(url: url);
      change(null, status: RxStatus.success());
      return token;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Update Email Verification (confirmation)
  Future<Token?> updateEmailVerification({
    required String userId,
    required String secret,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Token token = await _account.updateVerification(
        userId: userId,
        secret: secret,
      );
      change(null, status: RxStatus.success());
      return token;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }
}
