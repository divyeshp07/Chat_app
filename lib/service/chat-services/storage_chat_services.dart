import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:chat_app/core/exceptions/base_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

// class ChatServicesStorage {
//   final storage = FirebaseStorage.instance;
//   final img = ImagePicker();

//   Future<String?> storeProfile(
//       {required File file,
//       required String uid,
//       required BuildContext context}) async {
//     try {
//       final fileref =
//           storage.ref('users/profiles').child('$uid${p.extension(file.path)}');
//       final task = fileref.putFile(file);
//       img.pickImage(source: task);

//       if (task.snapshot.state == TaskState.success) {
//         return fileref.getDownloadURL();
//       }
//     } on FirebaseException catch (e) {
//       throw Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }
// }

class ChatServicesStorage {
  final soregeref = FirebaseStorage.instance.ref();
  FutureOr<String?> getPhoto(WidgetRef ref, String uid) async {
    try {
      final picker = ImagePicker();
      final XFile? source = await picker.pickImage(source: ImageSource.camera);
      final String? app =
          await ChatServicesStorage().storeProfile(File(source!.path), uid);
      log(File(source.path).path);
      ref.read(provider.notifier).state = app;
    } on FirebaseStorage catch (e) {
      throw BaseException(e.toString());
    }
    return '';
  }

  Future<String?> storeProfile(File file, String uid) async {
    try {
      final name = p.basename(file.path);
      final putFile = await soregeref.child('user/profile/$name').putFile(file);
      return putFile.ref.getDownloadURL();
    } on FirebaseStorage catch (e) {
      throw BaseException(e.toString());
    }
  }
}

final provider = StateProvider<String?>((ref) => null);
