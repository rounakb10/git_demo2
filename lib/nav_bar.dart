//import 'package:flutter/material.dart';
//import 'package:git_demo2/Screens/dashboard_screen.dart';
//import 'package:git_demo2/Screens/home_screen.dart';
//import 'package:git_demo2/Screens/settings_screen.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
//import 'package:flutter/cupertino.dart';
//
//class NavBar extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return PersistentTabView(
//      //controller: controller,
//      screens: _buildScreens(),
//      items: _navBarsItems(),
//      confineInSafeArea: true,
//      backgroundColor: Colors.white,
//      handleAndroidBackButtonPress: true,
//      resizeToAvoidBottomInset: true,
//      stateManagement: true,
//      hideNavigationBarWhenKeyboardShows: true,
//      decoration: NavBarDecoration(
//        borderRadius: BorderRadius.circular(10.0),
//        colorBehindNavBar: Colors.white,
//      ),
//      popAllScreensOnTapOfSelectedTab: true,
//      itemAnimationProperties: ItemAnimationProperties(
//        duration: Duration(milliseconds: 200),
//        curve: Curves.ease,
//      ),
//      screenTransitionAnimation: ScreenTransitionAnimation(
//        animateTabTransition: true,
//        curve: Curves.ease,
//        duration: Duration(milliseconds: 200),
//      ),
//      navBarStyle: NavBarStyle.style15,
//    );
//  }
//
//  List<Widget> _buildScreens() {
//    return [
//      HomeScreen(),
//      DashboardScreen(),
//      SettingsScreen(),
//    ];
//  }
//
//  List<PersistentBottomNavBarItem> _navBarsItems() {
//    return [
//      PersistentBottomNavBarItem(
//        icon: Icon(CupertinoIcons.home),
//        title: ("Home"),
//        activeColor: CupertinoColors.activeBlue,
//        inactiveColor: CupertinoColors.systemGrey,
//      ),
//      PersistentBottomNavBarItem(
//        icon: Icon(Icons.dashboard),
//        title: ("Dashboard"),
//        activeColor: CupertinoColors.activeBlue,
//        inactiveColor: CupertinoColors.systemGrey,
//      ),
//      PersistentBottomNavBarItem(
//        icon: Icon(CupertinoIcons.settings),
//        title: ("Settings"),
//        activeColor: CupertinoColors.activeBlue,
//        inactiveColor: CupertinoColors.systemGrey,
//      ),
//    ];
//  }
//}
