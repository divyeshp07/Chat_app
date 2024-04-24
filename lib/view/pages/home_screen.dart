// import 'package:chat_app/service/auth-services/auth_services.dart';
// import 'package:chat_app/service/chat-services/chat_services.dart';
// import 'package:chat_app/view/pages/chat_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   static const routePath = '/homescreen';
//   final AuthServices _authServices = AuthServices();
//   final ChatServices _chatServices = ChatServices();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('ChatBox'),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   context.pop();
//                 },
//                 icon: const Icon(Icons.arrow_back))
//           ],
//         ),
//         body: buildUserList());
//   }

//   Widget buildUserList() {
//     return StreamBuilder(
//       stream: _chatServices.getUserStream(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(child: Text('Error'));
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: Text('Loading'));
//         }
//         return ListView(
//           children: snapshot.data!
//               .map<Widget>((userData) => builduserListIteam(userData, context))
//               .toList(),
//         );
//         //  ListView.builder(
//         //   itemCount: snapshot.data!.length,
//         //   // itemCount: 5,
//         //   itemBuilder: (context, index) {
//         //     return InkWell(
//         //       onTap: () {
//         //         Navigator.push(context, MaterialPageRoute(builder: (context) {
//         //           if (snapshot.data![index]['email'] !=
//         //               FirebaseAuth.instance.currentUser!.email) {
//         //             return ChatScreen(
//         //               // TODO
//         //               recivername: snapshot.data![index]['email'],
//         //               context: context,
//         //               reciverId: snapshot.data![index]['uid'].toString(),
//         //             );
//         //           }
//         //           return ChatServices().sendMessage(receiverId, messeage);
//         //         }));
//         //       },
//         //       child: Card(
//         //           child: ListTile(
//         //         title: Text(snapshot.data![index]['name']),
//         //         subtitle: Text(snapshot.data![index]['email']),
//         //       )),
//         //     );
//         //   },
//         // );
//       },
//     );
//   }

//   Widget builduserListIteam(
//       Map<String, dynamic> userData, BuildContext context) {
//     if (userData["email"] != _authServices.getCurrentUser()) {
//       return InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ChatScreen(
//                   context: context,
//                   // reciverId: userData['uid'],
//                   recivername: userData['email'],
//                 ),
//               ));
//         },
//         child: Card(
//             child: ListTile(
//           title: Text(userData['uid']),
//           subtitle: Text(userData['email']),
//         )),
//       );
//     } else {
//       return Container();
//     }
//   }
// }

import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:chat_app/service/chat-services/chat_services.dart';
import 'package:chat_app/view/pages/chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routePath = '/homescreen';
  final AuthServices _authServices = AuthServices();
  final ChatServices _chatServices = ChatServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBox'),
      ),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatServices.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final userList = snapshot.data!;
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final userData = userList[index];
            return buildUserListItem(userData, context);
          },
        );
      },
    );
  }

  Widget buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    final currentUserEmail = _authServices.getCurrentUser()!.email;
    // final currentUserUid = _authServices.getCurrentUser()!.uid;
    final userEmail = userData['email'] as String;
    final userId = userData['uid'] as String;

    if (userEmail != currentUserEmail) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                recivername: userEmail,
                reciverId: userId,
              ),
            ),
          );
        },
        child: Card(
          child: ListTile(
            title: Text(userId),
            subtitle: Text(userEmail),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
