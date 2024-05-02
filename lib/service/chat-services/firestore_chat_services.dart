import 'package:chat_app/core/exceptions/base_exception.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServicesFireStore {
  final db = FirebaseFirestore.instance;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
  final Timestamp timestamp = Timestamp.now();

  Stream<List<Map<String, dynamic>>> getUserStream() {
    try {
      return db.collection('Users').snapshots().map(
        (snapshot) {
          return snapshot.docs.map((e) {
            final user = e.data();
            return user;
          }).toList();
        },
      );
    } on FirebaseFirestore catch (e) {
      throw BaseException(e.toString());
    }
  }

  // SENDING MESSEGES
  Future<void> sendMessage(
      String receiverId, String messeage, String name) async {
    try {
      // get current user  info
      MessageModel newmessage = MessageModel(
          senderId: currentUserId,
          senderEmail: currentUserEmail.toString(),
          receiverId: receiverId,
          messeage: messeage,
          timestamp: timestamp,
          name: name);

      // construct the chat room id for the two users(sorted to ensure uniqueness)
      List<String> ids = [currentUserId, receiverId];
      ids.sort(); //sort the ids for this ensure that the chat room id is same for any peoples
      final chatRoomId = ids.join("_");
      // adding messeage to database
      await db
          .collection('Chat_Room')
          .doc(chatRoomId)
          .collection('Message')
          .add(newmessage.toMap());
    } on FirebaseFirestore catch (e) {
      throw BaseException(e.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessage(
      String userId, String otherUserId) {
    try {
      // construct a chatroomid for the pesrons
      List<String> ids = [userId, otherUserId];
      ids.sort();
      String chatRoomId = ids.join('_');
      return db
          .collection('Chat_Room')
          .doc(chatRoomId)
          .collection('Message')
          .orderBy('timestamp', descending: false)
          .snapshots();
    } on FirebaseFirestore catch (e) {
      throw BaseException(e.toString());
    }
  }

// for uploading profile geting the document id
  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserDoc() async {
    final String uid = AuthServices().getCurrentUser()!.uid;
    return await db.collection('Users').doc(uid).get();
  }

// adding a new feild to the doc avathar
  Future<void> addAvatar({required String uid, required String url}) async {
    await db
        .collection('Users')
        .doc(uid)
        .set({'avatar': url}, SetOptions(merge: true));
  }

  Future<void> updateName(dynamic value, String uid) async {
    await db.collection('Users').doc(uid).update({'name': value});
  }
}
