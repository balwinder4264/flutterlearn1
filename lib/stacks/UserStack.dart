import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/Favorite/index.dart';
import 'package:riverpodlearn1/Pages/addPost/index.dart';
import 'package:riverpodlearn1/Pages/home/index.dart';
import 'package:riverpodlearn1/Pages/inbox/MyAddPostPage.dart';
import 'package:riverpodlearn1/Pages/inbox/index.dart';
import 'package:riverpodlearn1/Pages/profile/Profile.dart';
import 'package:riverpodlearn1/Pages/track/Track.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';

class UserStack extends HookConsumerWidget {
  // final ProfileStack({super.key});
  final List<Widget> _widgetOptions = <Widget>[
    MainHomePage(),
    MainFavoritePage(),
    MainAddPostPage(),
    MainInboxPage(),
    MyProfilepage(),
  ];

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
            icon: Icon(Icons.add_circle_outline),
            label: 'Post',
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
