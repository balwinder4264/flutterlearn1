import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/Favorite/index.dart';
import 'package:riverpodlearn1/Pages/Listing/index.dart';
import 'package:riverpodlearn1/Pages/home/index.dart';
import 'package:riverpodlearn1/Pages/inbox/index.dart';
import 'package:riverpodlearn1/Pages/profile/Profile.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';

class UserStack extends HookConsumerWidget {
  // final ProfileStack({super.key});
  final List<Widget> _widgetOptions = <Widget>[
    const MainHomePage(),
    const MainFavoritePage(),
    const MainListingPage(),
    const MainInboxPage(),
    const MyProfilepage(),
  ];

   UserStack({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider).selectedIndexProvider;
    final tabInstance = ref.read(tabIndexProvider.notifier);
    void onItemTapped(int index) {
      tabInstance.setIndex(index);
    }

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'serach',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listings',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
