import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/authService.dart';
import 'package:riverpodlearn1/stacks/publicStack.dart';
import 'package:riverpodlearn1/widgets/LoadingWidget.dart';
class AuthOrScreen extends  HookConsumerWidget {
  final Widget screen;
  AuthOrScreen({required this.screen});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData) {
          return screen;
        } else {
          return AuthStack();
        }
      },
    );
  }
}
