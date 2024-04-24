import 'package:chat_app/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  final db = FirebaseFirestore.instance;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
  final Timestamp timestamp = Timestamp.now();

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return db.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((e) {
        final user = e.data();
        return user;
      }).toList();
    });
  }

  // SENDING MESSEGES
  Future<void> sendMessage(String receiverId, String messeage) async {
    // get current user  info
    MessageModel newmessage = MessageModel(
        senderId: currentUserId,
        senderEmail: currentUserEmail.toString(),
        receiverId: receiverId,
        messeage: messeage,
        timestamp: timestamp);

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
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessage(
      String userId, String otherUserId) {
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
  }
}
