import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/home/widgets/ProductList.dart';
import 'package:riverpodlearn1/provider/product/fetchProductsProvider.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';

class MyHomePage extends HookConsumerWidget {
  static const routeName = '/home';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider).selectedIndexProvider;

    useEffect(() {
      if (selectedIndex == 0) {
        ref.read(productsNotifierProvider.notifier).fetchNextPage();
      }
    }, [selectedIndex]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const ProductListView(),
    );
  }
}
