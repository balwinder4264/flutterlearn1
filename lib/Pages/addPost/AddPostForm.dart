import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/widgets/customTextFiled.dart';
import 'package:riverpodlearn1/widgets/custombutton.dart';

class AddPostForm extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();

    final auth = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      body: Stack(
        children: [
       SingleChildScrollView(child:  Container(
              padding: EdgeInsets.all(20),
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
                    SizedBox(height: 20),
                    Text(
                      'Add Product',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    authState.errorMessage.length > 1
                        ? Text(
                            authState.errorMessage,
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox.shrink(),
                    CustomButton(
                      buttonText: 'Submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // You'll need to decide how you want to use the values
                          // nameController.text, descriptionController.text, and priceController.text
                          // in your login logic.
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
