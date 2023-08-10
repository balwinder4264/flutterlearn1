import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

final AuthenticationProvider =
    StateNotifierProvider<Authentication, bool>((ref) {
  return Authentication();
});

class Authentication extends StateNotifier<bool> {
  Authentication() : super(false);

  void login() => {
        state = true
        // login  here
      };
  void logout() => {
        state = false
        // logout here
      };
}
