// import 'package:flutter/material.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpodlearn1/provider/auth.dart';

// import 'package:riverpodlearn1/provider/counter_notifier.dart';
// import 'package:riverpodlearn1/services/navigatorService.dart';

// class MainProfilepage extends HookConsumerWidget {
//   // static final routeName = '/profile';
//   const MainProfilepage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authNotifierProvider.notifier);
//     return Scaffold(
//       body: Navigator(
//         key: globalNavigationService.navigatorKey,
//         initialRoute: '/',
//         onGenerateRoute: (RouteSettings settings) {
//           WidgetBuilder builder;
//           switch (settings.name) {
//             case '/':
//               builder = (BuildContext context) => MyHomePage();
//               break;
//             case '/home':
//               builder = (BuildContext context) => MyHomePage();
//               break;

//             case '/profile':
//               builder = (BuildContext context) => MyProfilepage();
//               break;
//             default:
//               throw Exception('Invalid route: ${settings.name}');
//           }
//           return MaterialPageRoute(builder: builder, settings: settings);
//         },
//       ),
//     );
//   }
// }
