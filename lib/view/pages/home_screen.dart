import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:chat_app/service/chat-services/chat_services.dart';
import 'package:chat_app/view/pages/chat_screen.dart';
import 'package:chat_app/view/pages/signin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routePath = '/homescreen';
  final AuthServices _authServices = AuthServices();
  final ChatServices _chatServices = ChatServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ChatBox'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _chatServices.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final userList = snapshot.data!;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final userData = userList[index];
              final userEmail = userData['email'] as String;
              final userId = userData['uid'] as String;
              final currentUserEmail = _authServices.getCurrentUser()!.email;
              if (userEmail != currentUserEmail) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          receiverName: userEmail,
                          receiverId: userId,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            // You can add user profile images here
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            // child: Icon(Icons.person),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userId,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  userEmail,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
