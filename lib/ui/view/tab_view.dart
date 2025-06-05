import 'package:drivemate/main.dart';
import 'package:drivemate/ui/view/home/home_view.dart';
import 'package:drivemate/ui/view/share/share_view.dart';
import 'package:drivemate/ui/view/status/status_view.dart';
import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'control/control_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  final bodyWidgets = const [
    FullSizedBox(child: Home()),
    FullSizedBox(child: Control()),
    FullSizedBox(child: Status()),
    FullSizedBox(child: Share()),
  ];

  @override
  State<StatefulWidget> createState() => LayoutState();
}

class LayoutState extends State<LayoutView> {
  late final _pageController;
  bool start = false;
  bool door = false;
  bool window = false;
  late bool warning;
  late bool s_door;
  late bool s_window;
  late bool tailgate;
  late bool bonnet;
  late bool snowflake;
  late bool handle;
  late bool front;
  late bool back;
  late bool side;

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: widget.bodyWidgets,
        onPageChanged: _updateTabIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera),
            label: 'Control',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Status',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.device_hub), label: 'Share'),
        ],
        selectedItemColor: MyApp.logo,
        unselectedItemColor: MyApp.background,
        unselectedLabelStyle: TextStyle(color: Colors.black),

        onTap: (selectedIndex) {
          _updateTabIndex(
            selectedIndex,
            () => _pageController.animateToPage(
              _selectedIndex,
              duration: Duration(microseconds: 250),
              curve: Curves.easeInOut,
            ),
          );
        },
      ),
    );
  }

  void _updateTabIndex(
    final int selectedIndex, [
    final VoidCallback? callback,
  ]) {
    setState(() {
      _selectedIndex = selectedIndex;
      callback?.call();
    });
  }
}
