import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraan_project/pages/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBarScreen extends StatelessWidget {
  PersistentTabController _controller;
  bool _hideNavBar = false;
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Color(0xFF2B4655),
        inactiveColor: Color(0xFF992B4655),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/committees-24px icon.svg',
          semanticsLabel: 'Acme Logo',
          fit: BoxFit.none,
        ),
        title: ("Committees"),
        activeColor: Color(0xFF2B4655),
        inactiveColor: Color(0xFF992B4655),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add_circle_outline),
        title: ("Pay Now"),
        activeColor: Color(0xFF2B4655),
        inactiveColor: Color(0xFF992B4655),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications),
        title: ("Transactions"),
        activeColor: Color(0xFF2B4655),
        inactiveColor: Color(0xFF992B4655),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: Color(0xFF2B4655),
        inactiveColor: Color(0xFF992B4655),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white70,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      hideNavigationBar: _hideNavBar,
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white, borderRadius: BorderRadius.zero),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property
    );
  }
}
