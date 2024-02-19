import 'package:entrust/common/constants/global_variables.dart';
import 'package:entrust/screens/account/account_screen.dart';
import 'package:entrust/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  static const String routeName = '/actual-home';
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  List<Widget> pages = [
    const Center(
      child: HomeScreen(),
    ),
    const Center(
      child: AccountScreen(),
    ),
    const Center(
      child: Text('page 3'),
    ),
  ];

  void _updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _updatePage,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          //
          //  HOME
          //
          BottomNavigationBarItem(
            icon: Container(
              width: GlobalVariables.bottomNavigationBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: GlobalVariables.bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          //
          //  PROFILE
          //
          BottomNavigationBarItem(
            icon: Container(
              width: GlobalVariables.bottomNavigationBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: GlobalVariables.bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),

          //
          //  CART
          //
          BottomNavigationBarItem(
            icon: Container(
              width: GlobalVariables.bottomNavigationBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: GlobalVariables.bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const badges.Badge(
                badgeContent: Text('2'),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                  elevation: 0,
                ),
                child: Icon(
                  Icons.home_outlined,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
