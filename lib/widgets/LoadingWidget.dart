import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoadingWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return CircularProgressIndicator(
              value: _controller.value,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              strokeWidth: 10,
            );
          },
        ),
      ],
    );
  }
}
