// import 'package:chat_app/service/chat-services/firestore_chat_services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   final String? receiverName;
//   final String? receiverId;

//   const ChatScreen({super.key, this.receiverName, this.receiverId});
//   static const routePath = '/chatScreen';

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController messageController = TextEditingController();
//     final currentUserId = FirebaseAuth.instance.currentUser!.uid;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(receiverName ?? ''),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: ChatServicesFireStore()
//                   .getMessage(currentUserId, receiverId!),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return const Center(child: Text('Error'));
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 final messages = snapshot.data!.docs;
//                 return ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final messageData =
//                         messages[index].data() as Map<String, dynamic>;
//                     final isCurrentUser =
//                         messageData['senderId'] == currentUserId;
//                     final DateTime dt = messageData['timestamp'].toDate();

//                     return Align(
//                       alignment: isCurrentUser
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: Column(
//                         crossAxisAlignment: isCurrentUser
//                             ? CrossAxisAlignment.end
//                             : CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 8, horizontal: 10),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: isCurrentUser
//                                   ? Colors.blue
//                                   : Colors.grey[300],
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Text(
//                               messageData['messeage'],
//                               style: TextStyle(
//                                 color:
//                                     isCurrentUser ? Colors.white : Colors.black,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 14,
//                               right: 14,
//                             ),
//                             child: Text(
//                               "${dt.hour > 12 ? dt.hour - 12 : dt.hour}:${dt.minute}${dt.am}",
//                               textAlign: isCurrentUser
//                                   ? TextAlign.right
//                                   : TextAlign.left,
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               border: Border(
//                 top: BorderSide(color: Colors.grey[300]!),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type your message...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     if (messageController.text.isNotEmpty) {
//                       ChatServicesFireStore()
//                           .sendMessage(receiverId!, messageController.text);
//                       messageController.clear();
//                     }
//                   },
//                   icon: const Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:chat_app/service/chat-services/firestore_chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String? receiverName;
  final String? receiverId;

  // Constructor for ChatScreen
  const ChatScreen({super.key, this.receiverName, this.receiverId});

  static const routePath = '/chatScreen';

  @override
  Widget build(BuildContext context) {
    // Controller for text field
    final TextEditingController messageController = TextEditingController();
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName ?? ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: ChatServicesFireStore()
                  .getMessage(currentUserId, receiverId!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Retrieve messages from snapshot
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final messageData =
                        messages[index].data() as Map<String, dynamic>;
                    final isCurrentUser =
                        messageData['senderId'] == currentUserId;
                    final DateTime dt = messageData['timestamp'].toDate();

                    return Align(
                      alignment: isCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: isCurrentUser
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          // Message container
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isCurrentUser
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              messageData['messeage'],
                              style: TextStyle(
                                color:
                                    isCurrentUser ? Colors.white : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Message timestamp
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 14,
                              right: 14,
                            ),
                            child: Text(
                              "${dt.hour > 12 ? dt.hour - 12 : dt.hour}:${dt.minute}${dt.hour > 12 ? 'PM' : 'AM'}",
                              textAlign: isCurrentUser
                                  ? TextAlign.right
                                  : TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Message input field and send button
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      ChatServicesFireStore()
                          .sendMessage(receiverId!, messageController.text);
                      messageController.clear();
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
