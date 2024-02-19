import 'package:entrust/common/widgets/bottom_bar.dart';
import 'package:entrust/common/constants/global_variables.dart';
import 'package:entrust/models/providers/user_provider.dart';
import 'package:entrust/models/users.dart';
import 'package:entrust/router.dart';
import 'package:entrust/screens/account/account_screen.dart';
import 'package:entrust/screens/admin/admin_screen.dart';
import 'package:entrust/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context, listen: true).user;
    var user = Provider.of<UserProvider>(context).user;
    print('>>>>>>>>>>>> APP OPENED');
    print('${user.type} : ${user.token}');

    final colorScheme = ColorScheme.fromSeed(
      seedColor: GlobalVariables.secondaryColor,
      background: GlobalVariables.backgroundColor,
    );

    return MaterialApp(
      title: GlobalVariables.appTitle,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: GlobalVariables.secondaryColor),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          color: GlobalVariables.secondaryColor,
        ),
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: user.token.isNotEmpty
          ? user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
