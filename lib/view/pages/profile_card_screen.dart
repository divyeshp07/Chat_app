import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileCardScreen extends StatelessWidget {
  ProfileCardScreen({super.key});
  static const routePath = '/profileCardScreen';
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 15,
          ),
          const CircleAvatar(
            radius: 90,
            child: Stack(
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
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter Your Name',
                        ),
                        controller: userNameController,
                      );
                    },
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('name'),
                  subtitle: Text('data'),
                  trailing: Icon(Icons.edit),
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
  }
}
