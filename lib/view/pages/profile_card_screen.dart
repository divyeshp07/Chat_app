import 'package:chat_app/controller/chat_provider/chat_provider.dart';
import 'package:chat_app/controller/user_provider/user_doc_provider.dart';
import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:chat_app/service/chat-services/firestore_chat_services.dart';
import 'package:chat_app/service/chat-services/storage_chat_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileCardScreen extends ConsumerWidget {
  ProfileCardScreen({super.key});
  static const routePath = '/profileCardScreen';
  final TextEditingController usernewNameController = TextEditingController();

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
        body: ref.watch(userDocProvider).when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await ChatServicesStorage()
                          .getPhoto(ref, AuthServices().getCurrentUser()!.uid);
                      ref.watch(provider) != null
                          ? await ChatServicesFireStore()
                              .addAvatar(
                                  uid: AuthServices().getCurrentUser()!.uid,
                                  url: ref.watch(provider)!)
                              .then((value) {
                              ref.invalidate(userDocProvider);
                            })
                          : null;
                    },
                    child: CircleAvatar(
                      backgroundImage: data.data()!['avatar'] != null
                          ? NetworkImage(data.data()!['avatar'])
                          : null,
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
                          // final String currentUserName = data.data()!['name'];
                          usernewNameController.text = data.data()!['name'];

                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
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
                                          controller: usernewNameController,
                                          // Set the initial value of the TextField controller with the current user's email
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                // updating the Current User Name
                                                ref
                                                    .watch(
                                                        chatProvider.notifier)
                                                    .updateCurrentUsername(
                                                        usernewNameController
                                                            .text,
                                                        ref
                                                            .watch(
                                                                userDocProvider)
                                                            .value!
                                                            .id,
                                                        context);
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
                            data.data()!['name'] ?? 'Enter NAME',
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
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text('Something Wrangg'),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
