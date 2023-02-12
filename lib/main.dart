import 'package:flutter/material.dart';
import 'package:flutter_sample_app/notifier/pokemon_notifier.dart';
import 'package:flutter_sample_app/notifier/theme_mode_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final themeModeNotifier = ThemeModeNotifier(pref);
  final pokemonNotifier = PokemonNotifier();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModeNotifier>(
        create: (_) => themeModeNotifier,
      ),
      ChangeNotifierProvider<PokemonNotifier>(
        create: (_) => pokemonNotifier,
      )
    ],
    child: const PokemonApp(),
  ));
}
