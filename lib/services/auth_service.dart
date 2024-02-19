// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:entrust/common/widgets/bottom_bar.dart';
import 'package:entrust/models/providers/user_provider.dart';
import 'package:entrust/screens/admin/admin_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:entrust/common/constants/error_handling.dart';
import 'package:entrust/common/constants/global_variables.dart';
import 'package:entrust/common/constants/utils.dart';
import 'package:entrust/models/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        username: username,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup/'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created, login using your credentials');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () async {
          //SET USER IN APP
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          //SET TOKEN IN MEMORY
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("x-auth-token", jsonDecode(res.body)['token']);
          //NAVIGATE
          print(jsonDecode(res.body)['type']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            jsonDecode(res.body)['type'] == "user"
                ? BottomBar.routeName
                : AdminScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString("x-auth-token", "");
      }

      if (token == null) {
        prefs.setString("x-auth-token", "");
      }

      var response = await http.post(
        Uri.parse('$uri/validToken/'),
        headers: <String, String>{
          'x-auth-token': token!,
          // 'Content-Type': "application/json; charset=UTF-8",
        },
      );

      var validToken = jsonDecode(response.body);
      if (validToken) {
        http.Response res = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8",
            'x-auth-token': token,
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(res.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
