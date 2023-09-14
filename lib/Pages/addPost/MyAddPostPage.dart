import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';
import 'package:riverpodlearn1/Pages/addPost/AddPostForm.dart';
class MyAddPostPage extends HookConsumerWidget {
  static const routeName = '/addPost';
  const MyAddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterInstance = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Add Post'),
      ),
      body: AddPostForm(),
     
    );
  }
}
