import 'package:drivemate/main.dart';
import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/logo_widget.dart';
import 'button_widget.dart';
import 'load_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  bool _isSwitch = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;

  String name = '';
  String password = '';

  void submit() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Load()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void PopUp() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              title: Column(children: [Text('알림')]),
              content: Column(
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

    return Material(
      child: FullSizedBox(
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                LogoWidget(),
                Image.asset('assets/images/red car.png'),
                Text(
                  '로그인 정보를 입력하세요.',
                  style: TextStyle(fontSize: 20, color: MyApp.white),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '이름을 입력하세요';
                            }
                            if (value.length < 4) {
                              return '이름을 입력하세요';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue == null) return;
                            name = newValue;
                          },
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/person_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
                              color: MyApp.fontGrey,
                              width: 40,
                              height: 40,
                            ),
                            filled: true,
                            fillColor: MyApp.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '비밀번호를 입력하세요';
                            }
                            if (value.length < 4) {
                              return '비밀번호를 입력하세요';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue == null) return;
                            password = newValue;
                          },
                          decoration: InputDecoration(
                            labelText: 'password',
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/lock_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
                              color: MyApp.fontGrey,
                              width: 40,
                              height: 40,
                            ),
                            filled: true,
                            fillColor: MyApp.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 400,
                  child: Row(
                    spacing: 10,
                    children: [
                      Switch(
                        value: _isSwitch,
                        onChanged: (isChecked) {
                          setState(() {
                            _isSwitch = isChecked;
                          });
                        },
                      ),
                      Text(
                        'Remember',
                        style: TextStyle(color: MyApp.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 400,
                  color: MyApp.point,
                  child: TextButton(
                    onPressed: submit,
                    /*onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Load()),
                      );
                    },*/
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: MyApp.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 200,
                  width: double.infinity,
                  color: Color.fromARGB(26, 150, 150, 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Container(
                        height: 50,
                        width: 400,
                        color: Colors.grey,
                        child: TextButton(
                          onPressed: () => PopUp(),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 400,
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () => PopUp(),
                          child: Text(
                            'Password Reset',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
