// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpodlearn1/provider/ProductsProvider.dart';

// class ProductsScreen extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productsAsyncValue = ref.watch(productsProvider);

//     return productsAsyncValue.when(
//       data: (products) {
//         return ListView.builder(
//           itemCount: products.data.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(products
//                   .data[index].name), // Modify according to your data structure
//             );
//           },
//         );
//       },
//       loading: () => CircularProgressIndicator(),
//       error: (err, stack) => Text('Error: $err'),
//     );
//   }
// }
