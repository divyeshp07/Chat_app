import 'package:chat_app/controller/chat_provider/chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  final String? receiverId;
  final String? receiverName;
  final String? name;

  const ChatScreen({super.key, this.receiverName, this.receiverId, this.name});

  static const routePath = '/chatScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController messageController = TextEditingController();
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final mychatprovider = ref.watch(chatProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: ref
                  .watch(chatProvider.notifier)
                  .getMessages(currentUserId, receiverId!, context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error.toString()}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No messages yet.'));
                }

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
                          Padding(
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            child: Text(
                              "${dt.hour > 12 ? dt.hour - 12 : dt.hour}:${dt.minute} ${dt.hour > 12 ? 'PM' : 'AM'}",
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
                      mychatprovider.sendMessage(receiverId!,
                          messageController.text, context, name.toString());
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
