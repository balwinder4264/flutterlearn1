import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpodlearn1/provider/category/fetchCategoryProvider.dart';
import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/Listing/MyAddPostPage/AddPostForm.dart';
import 'package:riverpodlearn1/widgets/LoadingWidget.dart';

class MyAddPostPage extends HookConsumerWidget {
  static const routeName = '/addPost';
  const MyAddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final categoryInstance = ref.watch(categoryProvider);

    useEffect(() {
      ref.read(categoryProvider.notifier).fetchCategories();
    }, [0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Add Post'),
      ),
      body: categoryInstance.category.isNotEmpty ?AddPostForm():LoadingWidget(),
    );
  }
}
