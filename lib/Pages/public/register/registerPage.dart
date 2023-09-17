import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/register/Form.dart';
import 'package:riverpodlearn1/widgets/myModal.dart';

class RegiterScreen extends HookConsumerWidget {
  static const routeName = '/register';

  const RegiterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: MyModal(
        child: RegisterForm(),
      ),
    );
  }
}
