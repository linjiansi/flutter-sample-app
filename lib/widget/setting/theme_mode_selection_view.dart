import 'package:flutter/material.dart';
import 'package:flutter_sample_app/notifier/theme_mode_notifier.dart';
import 'package:provider/provider.dart';

class ThemeModeSelectionPage extends StatelessWidget {
  const ThemeModeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
        builder: (context, value, child) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    ListTile(
                      leading: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            value.update(value.mode);
                            Navigator.of(context).pop();
                          }),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.system,
                      groupValue: value.mode,
                      title: const Text('System'),
                      onChanged: (val) => value.update(val!),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue: value.mode,
                      title: const Text('Dark'),
                      onChanged: (val) => value.update(val!),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue: value.mode,
                      title: const Text('Light'),
                      onChanged: (val) => value.update(val!),
                    ),
                  ],
                ),
              ),
            ));
  }
}
