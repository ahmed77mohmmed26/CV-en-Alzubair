import 'package:flutter/material.dart';
import 'main.dart';

/// -------------------- Settings Page --------------------
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        SwitchListTile(
          title: const Text('Dark Mode'),
          value: _darkMode,
          onChanged: (val) {
            setState(() {
              _darkMode = val;
            });
          },
          secondary: const Icon(Icons.dark_mode),
        ),

        SwitchListTile(
          title: const Text('Enable Notifications'),
          value: _notificationsEnabled,
          onChanged: (val) {
            setState(() {
              _notificationsEnabled = val;
            });
          },
          secondary: const Icon(Icons.notifications),
        ),

        const Divider(height: 40),

        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            // No Action
          },
        ),

        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            // No Action
          },
        ),
      ],
    );
  }
}
