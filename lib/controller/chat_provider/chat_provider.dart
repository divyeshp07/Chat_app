import 'package:chat_app/controller/user_provider/user_doc_provider.dart';
import 'package:chat_app/core/utils/snackbar_utils.dart';
import 'package:chat_app/service/chat-services/firestore_chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
class Chat extends _$Chat {
  @override
  List build() {
    return [];
  }

  Stream<List<Map<String, dynamic>>> getUserStream(
      {required BuildContext context}) {
    try {
      return ChatServicesFireStore().getUserStream();
    } on FirebaseFirestore catch (e) {
      throw Future.sync(() => SnackbarUtils.showMessage(context, e.toString()));
    }
  }

  Future<void> sendMessage(String receiverId, String messeage,
      BuildContext context, String name) async {
    try {
      await ChatServicesFireStore().sendMessage(
        receiverId,
        messeage,
        name,
      );
    } on FirebaseFirestore catch (_) {
      throw Future.sync(() => SnackbarUtils.showMessage(
          context, 'cant send message something went wrong'));
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      String userId, String otherUserId, BuildContext context) {
    try {
      return ChatServicesFireStore().getMessage(userId, otherUserId);
    } on FirebaseFirestore catch (_) {
      throw Future.sync(
          () => SnackbarUtils.showMessage(context, 'something went wrangg'));
    }
  }

  updateCurrentUsername(String value, String uid, BuildContext context) async {
    try {
      await ChatServicesFireStore().updateName(value, uid);
      ref.invalidate(userDocProvider);
    } on FirebaseException catch (_) {
      throw Future.sync(
          () => SnackbarUtils.showMessage(context, 'Cant Update the name'));
    }
  }
}
