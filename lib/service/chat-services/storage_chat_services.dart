import 'dart:io';

import 'package:chat_app/core/utils/snackbar_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class ChatServicesStorage {
  final storage = FirebaseStorage.instance;
  Future<String?> storeFiles(
      {required File file,
      required String uid,
      required BuildContext context}) async {
    try {
      final fileref =
          storage.ref('users/profiles').child('$uid${p.extension(file.path)}');
      final task = fileref.putFile(file);
      if (task.snapshot.state == TaskState.success) {
        return fileref.getDownloadURL();
      }
    } on FirebaseException catch (e) {
      throw Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
