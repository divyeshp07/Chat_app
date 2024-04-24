// import 'package:chat_app/service/chat-services/chat_services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   // TODO
//   String? recivername;
//   String? reciverId;

//   BuildContext? context;
//   ChatScreen({super.key, this.recivername, this.context, this.reciverId});
//   static const routePath = '/chatScreen';
//   final TextEditingController _messageController = TextEditingController();

//   void sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       await ChatServices()
//           .sendMessage(reciverId.toString(), _messageController.text);
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const CircleAvatar(
//           radius: 30,
//         ),
//         title: Text(
//           recivername.toString(),
//           style: const TextStyle(fontSize: 20),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.video_call)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: buildmessagelist(),
//           ),
//           buildUserInput(),
//         ],
//       ),
//     );
//   }

//   buildmessagelist() {
//     final senderId = FirebaseAuth.instance.currentUser!.uid;
//     return StreamBuilder(
//       stream: ChatServices().getMessage(senderId, reciverId.toString()),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text('Error'),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: Text('loding'),
//           );
//         }
//         return ListView(
//           children:
//               snapshot.data!.docs.map((e) => buildMessageitem(e)).toList(),
//         );
//       },
//     );
//   }

//   Widget buildMessageitem(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

//     // is current user?
//     final isCurrentUser =
//         data['senderId'] == FirebaseAuth.instance.currentUser!.uid;
//     var alignment =
//         isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
//     return Container(
//       alignment: alignment,
//       child: Column(
//         crossAxisAlignment:
//             isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Text(data['Message']),
//         ],
//       ),
//     );
//   }

//   Widget buildUserInput() {
//     return Row(
//       children: [
//         Expanded(
//             child: TextField(
//           controller: _messageController,
//         )),
//         IconButton(onPressed: sendMessage, icon: const Icon(Icons.send))
//       ],
//     );
//   }
// }

import 'package:chat_app/service/chat-services/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String? recivername;
  final String? reciverId;

  const ChatScreen({Key? key, this.recivername, this.reciverId})
      : super(key: key);
  static const routePath = '/chatScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recivername ?? ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildMessageList(),
          ),
          buildUserInput(),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: ChatServices().getMessage(currentUserId, reciverId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final messages = snapshot.data!.docs;
        // final messages = (snapshot.data?.docs ?? []).toList();

        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final messageData = messages[index].data() as Map<String, dynamic>;
            return buildMessageItem(messageData);
          },
        );
      },
    );
  }

  Widget buildMessageItem(Map<String, dynamic> messageData) {
    final isCurrentUser =
        messageData['senderId'] == FirebaseAuth.instance.currentUser!.uid;
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 22, bottom: 12, left: 22),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 16,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              messageData['messeage'],
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserInput() {
    final TextEditingController messageController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: messageController,
          ),
        ),
        IconButton(
          onPressed: () {
            if (messageController.text.isNotEmpty) {
              ChatServices().sendMessage(reciverId!, messageController.text);
              messageController.clear();
            }
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
