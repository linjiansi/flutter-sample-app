import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pokemon_list.dart';
import 'package:flutter_sample_app/settings.dart';

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
