import 'package:entrust/common/constants/global_variables.dart';
import 'package:entrust/screens/account/widgets/account_menu.dart';
import 'package:entrust/screens/account/widgets/below_appbar.dart';
import 'package:entrust/screens/account/widgets/orders.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/entrust-logo-text-only-color.png',
                  scale: 18,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        )),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          AccountMenu(),
          SizedBox(height: 10),
          Orders(),
        ],
      ),
    );
  }
}
