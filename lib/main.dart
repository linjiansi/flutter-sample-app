import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pokemon_list.dart';
import 'package:flutter_sample_app/settings.dart';
import 'package:flutter_sample_app/theme_mode_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final themeModeNotifier = ThemeModeNotifier(pref);
  runApp(ChangeNotifierProvider(
    create: (_) => themeModeNotifier,
    child: const PokemonApp(),
  ));
}

class PokemonApp extends StatefulWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PokemonAppState();
}

class _PokemonAppState extends State<PokemonApp> {

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

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentIndex == 0 ? const PokemonListView() : const SettingsView()
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(
            () => currentIndex = index
          )
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),
        ],
      ),
    );
  }
}
