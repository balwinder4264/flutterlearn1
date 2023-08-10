import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/home/index.dart';
import 'package:riverpodlearn1/Pages/Profile.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class UserStack extends HookConsumerWidget {
  // final ProfileStack({super.key});
  final List<Widget> _widgetOptions = <Widget>[
    MainHomePage(),
    MyProfilepage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    void onItemTapped(int index) {
      selectedIndex.value = index;
    }

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex.value,
        onTap: onItemTapped,
      ),
    );
  }
}
