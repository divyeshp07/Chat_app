import 'package:chat_app/view/pages/profile_card_screen.dart';
import 'package:chat_app/view/widgets/profile_screen_widgets/listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routePath = '/settingsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        // centerTitle: true,
        title: const Text('Settings'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            // Card(
            //   child: ListTile(
            //     leading: const CircleAvatar(
            //       radius: 40,
            //     ),
            //     title: const Text(
            //       'name',
            //     ),
            //     subtitle: const Text('status'),
            //     trailing: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         IconButton(
            //             onPressed: () {},
            //             icon: const Icon(
            //               Icons.qr_code,
            //               color: Colors.green,
            //             )),
            //         IconButton(
            //             onPressed: () {},
            //             icon: const Icon(
            //               Icons.person_add_alt,
            //               color: Colors.green,
            //             ))
            //       ],
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                context.push(ProfileCardScreen.routePath);
              },
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 40,
                  ),
                  title: const Text(
                    'name',
                  ),
                  subtitle: const Text('status'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_add_alt,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            SettingsListTile(),
          ],
        ),
      ),
    );
  }
}
