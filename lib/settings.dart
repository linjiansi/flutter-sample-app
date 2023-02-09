import 'package:flutter/material.dart';
import 'package:flutter_sample_app/theme_mode_selection_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Dark/Light Mode'),
          trailing: Text((_themeMode == ThemeMode.system)
              ? 'System'
              : (_themeMode == ThemeMode.dark ? 'Dark' : 'Light')),
          onTap: () async {
            var returnedTheme = await Navigator.of(context).push<ThemeMode>(MaterialPageRoute(
              builder: (context) => ThemeModeSelectionPage(themeMode: _themeMode),
            ));
            setState(() {
              _themeMode = returnedTheme!;
            });
          },
        ),
      ],
    );
  }
}
