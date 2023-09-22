import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/Listing/MyAddPostPage/MyAddPostPage.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MyListingPage extends HookConsumerWidget {
  const MyListingPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('My Listing'),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () => ref
                .read(navigationServiceProvider)
                .navigateTo(MyAddPostPage.routeName),
            child: const Text('Add post'),
          ),
          Text("I am listing ")
      ],),
    );
  }
}