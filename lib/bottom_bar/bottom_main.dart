import 'dart:developer';

import 'package:flutter/material.dart';

import '../firebase_auth/firebase_auth_service.dart';
import 'animated_notch_bottom_bar/models/bottom_bar_item_model.dart';
import 'animated_notch_bottom_bar/notch_bottom_bar.dart';
import 'animated_notch_bottom_bar/notch_bottom_bar_controller.dart';

class bottom_main extends StatelessWidget {
  bottom_main({super.key});
  final FirebaseAuthService _auth = FirebaseAuthService();

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(

      /// Provide NotchBottomBarController
      notchBottomBarController: _controller,
      color: Colors.grey,

      showLabel: false,
      shadowElevation: 5,
      kBottomRadius: 28.0,
      // notchShader: const SweepGradient(
      //   startAngle: 0,
      //   endAngle: pi / 2,
      //   colors: [Colors.red, Colors.green, Colors.orange],
      //   tileMode: TileMode.mirror,
      // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
      notchColor: const Color(0xff502f4c),

      /// restart app if you change removeMargins
      removeMargins: false,
      bottomBarWidth: 500,
      showShadow: false,

      durationInMilliSeconds: 300,
      elevation: 1,

      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          itemLabel: 'Page 1',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.message,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.message,
            color: Colors.white,
          ),
          itemLabel: 'Page 2',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          itemLabel: 'Page 4',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.person,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.person,
            color: Colors.white,
          ),
          itemLabel: 'Page 5',
        ),
      ],
      onTap: (index) {
        /// perform action on tab change and to update pages you can update pages without pages
        log('current selected index $index');
        _pageController.jumpToPage(index);
      },
      kIconSize: 24.0,
    );
  }
}
