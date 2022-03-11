import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

class AppwriteDatabaseProvider extends GetxController with StateMixin {
  static Client appwriteClient = Get.find<Client>();

  final Database _database = Database(appwriteClient);

  static Database get database => Database(appwriteClient);

//  Create Document
  Future<Document?> createDocument({
    required String collectionId,
    String documentId = "unique()",
    required Map<dynamic, dynamic> data,
    List? read,
    List? write,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Document document = await _database.createDocument(
        collectionId: collectionId,
        documentId: documentId,
        data: data,
        read: read,
        write: write,
      );
      change(null, status: RxStatus.success());
      return document;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  List Documents
  Future<DocumentList?> listDocuments(
      {required String collectionId,
      List? queries,
      int? limit,
      int? offset,
      String? cursor,
      String? cursorDirection,
      List? orderAttributes,
      List? orderTypes}) async {
    try {
      change(null, status: RxStatus.loading());
      DocumentList documentList = await _database.listDocuments(
        collectionId: collectionId,
        queries: queries,
        limit: limit,
        offset: offset,
        cursor: cursor,
        cursorDirection: cursorDirection,
        orderAttributes: orderAttributes,
        orderTypes: orderTypes,
      );
      change(null, status: RxStatus.success());
      return documentList;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Get Document
  Future<Document?> getDocument({
    required String collectionId,
    required String documentId,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Document document = await _database.getDocument(
        collectionId: collectionId,
        documentId: documentId,
      );
      change(null, status: RxStatus.success());
      return document;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Update Document
  Future<Document?> updateDocument({
    required String collectionId,
    required String documentId,
    required Map<dynamic, dynamic> data,
    List? read,
    List? write,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      Document document = await _database.updateDocument(
        collectionId: collectionId,
        documentId: documentId,
        data: data,
        read: read,
        write: write,
      );
      change(null, status: RxStatus.success());
      return document;
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
    return null;
  }

//  Delete Document
  Future<void> deleteDocument({
    required String collectionId,
    required String documentId,
    required Map<dynamic, dynamic> data,
    List? read,
    List? write,
  }) async {
    try {
      change(null, status: RxStatus.loading());
      await _database.deleteDocument(
        collectionId: collectionId,
        documentId: documentId,
      );
      change(null, status: RxStatus.success());
    } on AppwriteException catch (e) {
      //show message to user or do other operation based on error as required
      print(e.message);
      change(e, status: RxStatus.error(e.message));
    }
    change(null, status: RxStatus.empty());
  }
}
