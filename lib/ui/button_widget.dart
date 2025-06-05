import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required String text, required VoidCallback link})
      : this._text = text,
        this._link = link;
  final String _text;
  final VoidCallback _link;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      color: MyApp.point,
      child: TextButton(
        onPressed: _link,
        child: Text(_text, style: TextStyle(color: MyApp.white)),
      ),
    );
  }
}

class RouteWidget extends StatelessWidget {
  const RouteWidget({super.key, required String text, required Widget link})
      : this._text = text,
        this._link = link;
  final String _text;
  final Widget _link;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      color: MyApp.point,
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => _link),);
        },
        child: Text(_text, style: TextStyle(color: MyApp.white)),
      ),
    );
  }
}

class RedButtonWidget extends StatelessWidget {
  const RedButtonWidget({super.key, required String text})
      : this._text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 400,
      color: MyApp.point,
      child: Text(_text, style: TextStyle(color: MyApp.white)),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required String text, required String icon})
      : this._text = text,
        this._icon = icon;
  final String _text;
  final String _icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            _icon,
            color: MyApp.fontGrey,
            width: 40,
            height: 40,
          ),
          labelText: _text,
          filled: true,
          fillColor: MyApp.white,
        ),
      ),
    );
  }
}

class InputWidgetB extends StatelessWidget {
  const InputWidgetB({super.key, required String text, required String icon})
      : this._text = text,
        this._icon = icon;
  final String _text;
  final String _icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(_icon, width: 40, height: 40),
          labelText: _text,
          filled: true,
          fillColor: MyApp.white,
        ),
      ),
    );
  }
}
