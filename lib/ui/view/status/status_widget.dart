import 'package:drivemate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home/home_widget.dart';
import '../tab_view.dart';

class CarWidget extends StatefulWidget {
  const CarWidget({
    super.key,
    required String icon,
    required String title,
    required String close,
    required CarEntry? entry,
  }) : this._icon = icon,
       this._title = title,
       this._entry = entry,
       this._close = close;

  final String _icon;
  final String _title;
  final String _close;
  final CarEntry? _entry;

  @override
  State<StatefulWidget> createState() => CarWidgetState();
}

class CarWidgetState extends State<CarWidget> {
  bool _isSwitch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LayoutState? layout = context.findAncestorStateOfType<LayoutState>();
    _isSwitch = switch(widget._entry) {
      CarEntry.start => false,
      CarEntry.door => layout?.door,
      CarEntry.window => layout?.window,
      _ => false
    } ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSwitch = !_isSwitch;
        });
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 20,
              children: [
                SvgPicture.asset(
                  width: 35,
                  height: 35,
                  widget._icon,
                  color: _isSwitch ? MyApp.logo : Colors.black,
                ),
                Text(
                  widget._title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              _isSwitch ? '열람' : widget._close,
              style: TextStyle(color: _isSwitch ? MyApp.logo : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class AirWidget extends StatefulWidget {
  const AirWidget({super.key, required String icon, required String title})
    : this._icon = icon,
      this._title = title;
  final String _icon;
  final String _title;

  @override
  State<StatefulWidget> createState() => AirWidgetState();
}

class AirWidgetState extends State<AirWidget> {
  bool _isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSwitch = !_isSwitch;
        });
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 20,
              children: [
                SvgPicture.asset(
                  width: 35,
                  height: 35,
                  widget._icon,
                  color: _isSwitch ? MyApp.logo : Colors.black,
                ),
                Text(
                  widget._title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              _isSwitch ? '켜짐' : '꺼짐',
              style: TextStyle(
                color: _isSwitch ? MyApp.logo : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
