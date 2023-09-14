import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/widgets/customTextFiled.dart';
import 'package:riverpodlearn1/widgets/custombutton.dart';
import 'package:email_validator/email_validator.dart';

class LoginForm extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: "test@gmail.com");
    final passwordController = useTextEditingController(text: "12345678");
    final auth = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
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
                      'Login',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
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
                      buttonText: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          auth.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    ),
                        SizedBox(height: 20),
                    CustomButton(
                      buttonText: 'Register up ?',
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
