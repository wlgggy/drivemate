import 'dart:async';

import 'package:drivemate/ui/view/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required String icon, required String text})
    : this._icon = icon,
      this._text = text;
  final String _icon;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SvgPicture.asset(width: 20, height: 20, _icon, color: Colors.black),
        Text(_text),
      ],
    );
  }
}

enum CarEntry { start, door, window }

class ClickWidget extends StatefulWidget {
  const ClickWidget({
    super.key,
    required String icon,
    required String change,
    required String text,
    required CarEntry entry,
  }) : this._icon = icon,
       this._change = change,
       this._entry = entry,
       this._text = text;

  final String _icon;
  final String _text;
  final String _change;
  final CarEntry _entry;

  @override
  State<StatefulWidget> createState() => ClickWidgetState();
}

class ClickWidgetState extends State<ClickWidget> {
  // bool _isSwitch = false;

  @override
  Widget build(BuildContext context) {
    LayoutState? layout = context.findAncestorStateOfType<LayoutState>();
    var data = switch (widget._entry) {
      CarEntry.start =>  layout?.start,
      CarEntry.door => layout?.door,
      CarEntry.window => layout?.window,
    } ?? false;
    void showPopUp() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('현재 사용할 수 없는 기능입니다.')],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('확인'),
                ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        layout?.setState(() {
          switch (widget._entry) {
            case CarEntry.start:
              layout.start = !layout.start;
            case CarEntry.door:
              layout.door = !layout.door;
            case CarEntry.window:
              layout.window = !layout.window;
          }
        });
        showPopUp();
      },
      child: Column(
        children: [
          InkWell(
            child: Container(
              width: 90,
              height: 90,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: data ? Colors.black : Colors.white,
                border: Border.all(width: 2, color: MyApp.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                child: SvgPicture.asset(
                  data ? widget._change : widget._icon,
                  color: data ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),

          Text(widget._text),
        ],
      ),
    );
  }
}

class WarningWidget extends StatefulWidget {
  const WarningWidget({super.key, required String text}) : this._text = text;
  final String _text;

  @override
  State<StatefulWidget> createState() => WarningState();
}

class WarningState extends State<WarningWidget> {
  bool _isSwitch = false;
  bool _color = false;

  @override
  Widget build(BuildContext context) {
    void showPopUp() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('현재 사용할 수 없는 기능입니다.')],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('확인'),
                ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _isSwitch = !_isSwitch;
        });
        showPopUp();
        Timer.periodic(Duration(seconds: 1), (_timer) {
          setState(() {
            _color = !_color;
          });
        });
      },
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _isSwitch ? Colors.black : Colors.white,
              border: Border.all(width: 2, color: MyApp.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              child: SvgPicture.asset(
                _isSwitch
                    ? 'assets/icons/warning.svg'
                    : 'assets/icons/warning.svg',
                color:
                    _isSwitch
                        ? _color
                            ? Colors.red
                            : Colors.white
                        : Colors.black,
              ),
            ),
          ),
          Text(widget._text),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required String icon, required String text})
    : this._icon = icon,
      this._text = text;
  final String _icon;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {},
            child: Container(
              width: 325,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(
                        _icon,
                        width: 30,
                        height: 30,
                        color: MyApp.logo,
                      ),
                      Text(_text, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
