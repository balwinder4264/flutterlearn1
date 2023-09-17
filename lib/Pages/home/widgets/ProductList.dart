import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/home/widgets/CustomCard.dart';
import 'package:riverpodlearn1/provider/product/fetchProductsProvider.dart';

class ProductListView extends HookConsumerWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifierProvider);
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          final notifier = ref.read(productsNotifierProvider.notifier);
          notifier.fetchNextPage();
        }
      }
    });
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (MediaQuery.of(context).size.width / 2 - 50) / 175,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: productsState.products.length,
        itemBuilder: (context, index) {
          final product = productsState.products[index];
          return CustomCard(
            product.name,
            product.image_urls.isNotEmpty
                ? product.image_urls[0]
                : "https://www.w3schools.com/w3css/img_snowtops.jpg",
            product.description,
          );
        },
      ),
    );
  }
}
