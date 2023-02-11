import 'package:flutter/material.dart';
import 'package:flutter_sample_app/notifier/theme_mode_notifier.dart';
import 'package:flutter_sample_app/widget/setting/theme_mode_selection_view.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
        builder: (context, value, child) => ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.lightbulb),
                  title: const Text('Dark/Light Mode'),
                  trailing: Text((value.mode == ThemeMode.system)
                      ? 'System'
                      : (value.mode == ThemeMode.dark ? 'Dark' : 'Light')),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const ThemeModeSelectionPage(),
                    ));
                  },
                ),
              ],
            ));
  }
}
