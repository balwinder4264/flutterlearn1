import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/addPost/StatusBottomSheet.dart';
import 'package:riverpodlearn1/models/product.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/provider/product/addProductProvider.dart';
import 'package:riverpodlearn1/widgets/customTextFiled.dart';
import 'package:riverpodlearn1/widgets/custombutton.dart';
import 'package:riverpodlearn1/constant/constant.dart';

class AddPostForm extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  AddPostForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();
    final auth = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    final addProductState = ref.watch(addProductnProvider);
    final addProductNotifier = ref.read(addProductnProvider.notifier);

    final defaultSelected = useState(productStatuses[0]);
    addProduct() {
      final newProduct = Product(
        name: nameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        status: 'Active', // Make sure to handle potential parsing errors
      );
      addProductNotifier.addProduct(newProduct);
    }

    statusBottomSheetSelecte(data) {
      defaultSelected.value = data;
      return data;
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (addProductState.errorMessage != null)
                      Text(
                        addProductState.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 20),
                    const Text(
                      'Add Product',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: descriptionController,
                      maxLines: 4,
                      hintText: 'Description',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: priceController,
                      hintText: 'Price',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a price';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    StatusBottomSheet(),
                    const SizedBox(height: 20),
                    authState.errorMessage.length > 1
                        ? Text(
                            authState.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox.shrink(),
                    CustomButton(
                      buttonText: 'Submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addProduct();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
