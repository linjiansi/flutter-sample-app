import 'package:flutter/material.dart';
import 'package:flutter_sample_app/notifier/theme_mode_notifier.dart';
import 'package:flutter_sample_app/widget/root.dart';
import 'package:provider/provider.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
        builder: ((context, value, child) => MaterialApp(
              title: 'Pokemon App',
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: value.mode,
              home: const RootView(),
            )));
  }
}
