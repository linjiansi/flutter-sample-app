import 'package:flutter/material.dart';
import 'package:flutter_sample_app/theme_mode_notifier.dart';
import 'package:flutter_sample_app/theme_mode_selection_view.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

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
                          ThemeModeSelectionPage(themeMode: value.mode),
                    ));
                  },
                ),
              ],
            ));
  }
}
