import 'package:entrust/constants/global_variables.dart';
import 'package:entrust/providers/user_provider.dart';
import 'package:entrust/router.dart';
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

    final _colorScheme = ColorScheme.fromSeed(
      seedColor: GlobalVariables.secondaryColor,
      background: GlobalVariables.backgroundColor,
    );

    return MaterialApp(
        title: "Entrust App",
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
          colorScheme: _colorScheme,
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const AuthScreen() //!false ?  : const HomeScreen(),
        );
  }
}
