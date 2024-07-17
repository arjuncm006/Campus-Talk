import 'dart:developer';

import 'package:clg_chat/bottom_bar/animated_notch_bottom_bar/models/bottom_bar_item_model.dart';
import 'package:clg_chat/bottom_bar/animated_notch_bottom_bar/notch_bottom_bar.dart';
import 'package:clg_chat/bottom_bar/animated_notch_bottom_bar/notch_bottom_bar_controller.dart';
import 'package:clg_chat/firebase_auth/firebase_auth_service.dart';
import 'package:clg_chat/pages/blist.dart';
import 'package:clg_chat/pages/broadcast.page.dart';

import 'package:clg_chat/pages/home_page.dart';
import 'package:clg_chat/pages/list_of_stu.dart';
import 'package:clg_chat/pages/third_year.dart';
import 'package:clg_chat/pages/mydrawer.dart';
import 'package:flutter/material.dart';

class Host_page extends StatefulWidget {
  const Host_page({super.key});

  @override
  State<Host_page> createState() => _Host_pageState();
}

class _Host_pageState extends State<Host_page> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const home_page(),
    const Broadcast(),
  GetUserNames(),
    const Group(),
    const Group(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campus Talk"),
      ),
      drawer: MyDrawer(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,


              color: Colors.deepOrange.shade50,





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
              notchGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [


                    Colors.blueAccent[100]!,
                    Colors.blueAccent[200]!,
                    Colors.blue[300]!,
                    Colors.blueAccent[100]!,
                  ],
                  stops: const [
                    0.1,
                    0.3,
                    0.9,
                    1.0
                  ]),
              durationInMilliSeconds: 300,
              elevation: 1,

              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.list_alt_outlined,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.list_alt_outlined,
                    color: Colors.black,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.group,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.group,
                    color: Colors.black,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  itemLabel: 'Page 4',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.black,
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
            )
          : null,
    );
  }
}

/*
class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white12, child: const Center(child: Text('Page 2')));
  }
}
*/

class Group extends StatelessWidget {
  const Group({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: const Center(child: Text('Still under devlopment dude .... ')));
  }
}
