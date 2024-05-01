import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:chat_app/service/chat-services/storage_chat_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileCardScreen extends ConsumerWidget {
  ProfileCardScreen({super.key});
  static const routePath = '/profileCardScreen';
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () async {
                ChatServicesStorage()
                    .getPhoto(ref, AuthServices().getCurrentUser()!.uid);
              },
              child: CircleAvatar(
                backgroundImage: ref.watch(provider) == null
                    ? null
                    : NetworkImage(ref.watch(provider)!),
                radius: 90,
                child: const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 115,
                      bottom: 10,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Color.fromARGB(255, 4, 154, 14),
                        child: Icon(Icons.camera_alt),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    final String currentUserEmail =
                        AuthServices().getCurrentUser()!.email.toString();

                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Enter Your Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: TextEditingController(
                                        text: currentUserEmail),
                                    // Set the initial value of the TextField controller with the current user's email
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Do something with the entered name
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      AuthServices().getCurrentUser()!.email.toString(),
                    ),
                    subtitle: const Text('data'),
                    trailing: const Icon(Icons.edit),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 57),
                  child: Text('data'),
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('data'),
              subtitle: Text('status'),
              trailing: Icon(Icons.edit),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('phone'),
              subtitle: Text('72726626'),
            )
          ],
        ),
      ),
    );
  }
}
