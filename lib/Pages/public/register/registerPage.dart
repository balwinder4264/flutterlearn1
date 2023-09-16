import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/login/Form.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/Pages/public/register/Form.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';
import 'package:riverpodlearn1/widgets/myModal.dart';

class RegiterScreen extends HookConsumerWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: MyModal(
        child: RegisterForm(),
      ),
    );
  }
}
