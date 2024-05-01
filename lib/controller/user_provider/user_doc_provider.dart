import 'package:chat_app/service/chat-services/firestore_chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_doc_provider.g.dart';

@riverpod
Future<DocumentSnapshot<Map<String, dynamic>>> userDoc(UserDocRef ref) {
  return ChatServicesFireStore().getCurrentUserDoc();
}
