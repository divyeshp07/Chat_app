import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:chat_app/controller/auth_provider/auth_provider.dart';
import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:chat_app/service/chat-services/firestore_chat_services.dart';
import 'package:chat_app/view/pages/chat_screen.dart';
import 'package:chat_app/view/pages/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final AuthServices _authServices = AuthServices();
  final ChatServicesFireStore _chatServices = ChatServicesFireStore();
  final NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();
  static const routePath = '/homescreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ChatBox'),
          actions: [
            IconButton(
                onPressed: () {
                  ref.watch(authenticationProvider.notifier).logOut(context);
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
                final userEmail = userData['email'];
                final userId = userData['uid'];
                final name = userData['name'];
                final profile = userData['profile'];
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
                            name: name,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: profile,
                              // child: Icon(Icons.person),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            child: const Icon(Icons.add)),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.amber,
          onTap: (index) {
            if (index == 3) {
              context.push(SettingsScreen.routePath);
            }
          },
          icons: const [
            Icons.abc,
            Icons.abc_outlined,
            Icons.abc_sharp,
            Icons.person,
          ],
          activeIndex: 0,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 50,
          rightCornerRadius: 50,
        ));
  }
}
