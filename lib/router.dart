import 'package:entrust/common/widgets/bottom_bar.dart';
import 'package:entrust/screens/admin/admin_screen.dart';
import 'package:entrust/screens/auth/auth_screen.dart';
import 'package:entrust/screens/errors/not_found_screen.dart';
// import 'package:entrust/screens/home.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    // case HomeScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const HomeScreen(),
    //   );
    case AdminScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AdminScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const NotFoundScreen(),
      );
  }
}
