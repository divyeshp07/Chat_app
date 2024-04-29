import 'package:chat_app/model/settings_listtilemodel.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  SettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mySettingList.length,
              itemBuilder: (context, index) {
                final setting = mySettingList[index];
                return ListTile(
                  leading: Icon(
                    setting.icon,
                    size: 25,
                  ),
                  title: Text(
                    setting.title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    setting.subtitle,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              },
            ),
          ),
          const Text(
            'Meta',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  final mySettingList = [
    SettingsListTileModel(
        icon: Icons.key,
        subtitle: 'Security notifications,change number',
        title: 'Account'),
    SettingsListTileModel(
        icon: Icons.lock,
        subtitle: 'block contacts,disapearing message',
        title: 'Privacy'),
    SettingsListTileModel(
        icon: Icons.emoji_emotions,
        subtitle: 'create edit prifilephoto',
        title: 'Avatar'),
    SettingsListTileModel(
        icon: Icons.chat,
        subtitle: 'team walpapper chat history',
        title: 'Chats'),
    SettingsListTileModel(
        icon: Icons.notifications,
        subtitle: 'message group and call tones',
        title: 'Notifications'),
    SettingsListTileModel(
        icon: Icons.change_circle,
        subtitle: 'network usage auto downloads',
        title: 'Storage and Data'),
    SettingsListTileModel(
        icon: Icons.blur_circular_rounded,
        subtitle: 'english device language',
        title: 'App Language'),
    SettingsListTileModel(
        icon: Icons.help,
        subtitle: 'help center contact us privacy policy',
        title: 'Help'),
    SettingsListTileModel(
        icon: Icons.group, subtitle: '', title: 'Invite Friends'),
  ];
}
