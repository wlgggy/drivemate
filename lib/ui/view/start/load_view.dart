import 'dart:io';

import 'package:drivemate/main.dart';
import 'package:drivemate/ui/button_widget.dart';
import 'package:drivemate/ui/view/home/home_view.dart';
import 'package:drivemate/ui/view/tab_view.dart';
import 'package:drivemate/ui/widget/logo_widget.dart';
import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Load extends StatefulWidget {
  const Load({super.key});

  @override
  State<StatefulWidget> createState() => LoadState();
}

class LoadState extends State<Load> {
  XFile? selectedImage;
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
          MaterialPageRoute(builder: (context) => LayoutView()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var imagePicker = ImagePicker();
    void PopUp() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              title: Column(children: [Text('알림')]),
              content: Column(
                mainAxisSize:MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        if (selectedImage != null)
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(selectedImage!.path),
                          ),
                        TextButton(
                          onPressed: () async {
                            var image = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (image != null) {
                              print('이미지가 선택되었습니다.');
                              selectedImage = image;
                              setState(() {});
                            } else {
                              print('아무것도 선택안했네');
                            }
                          },
                          child: const Text('갤러리'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        if (selectedImage != null)
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(selectedImage!.path),
                          ),
                        TextButton(
                          onPressed: () async {
                            var image = await imagePicker.pickImage(
                              source: ImageSource.camera,
                            );
                            if (image != null) {
                              print('이미지가 선택되었습니다.');
                              setState(() {
                                selectedImage = image;
                              });
                            } else {
                              print('아무것도 선택안했네');
                            }
                          },
                          child: const Text('카메라'),
                        ),
                      ],
                    ),
                  ),
                ],
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/cloud1.png'),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  LogoWidget(),
                  Image.asset('assets/images/car.webp'),
                  Container(
                    height: 50,
                    width: 400,
                    color: MyApp.point,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 700,
                              child: Container(
                                width: double.infinity,
                                height: 700,
                                color: MyApp.insertGrey,
                                child: Column(
                                  spacing: 15,
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    SizedBox(
                                      width: 400,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '차량등록하기',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed:
                                                Navigator.of(context).pop,
                                            child: SvgPicture.asset(
                                              'assets/icons/cancel.svg',
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 400,
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return '차량 이름을 입력하세요';
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
                                                  'assets/icons/person.svg',
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
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return '차량 번호를 입력하세요';
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
                                                  'assets/icons/lock.svg',
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
                                            height: 200,
                                            child: ElevatedButton(
                                              onPressed: () => PopUp(),
                                              child:
                                                  (selectedImage != null)
                                                      ? Image.file(
                                                        File(
                                                          selectedImage!.path,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      )
                                                      : SvgPicture.asset(
                                                        'assets/icons/image.svg',
                                                        color: MyApp.fontGrey,
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text('이미지를 선택 해 주세요.'),
                                              Text(
                                                '갤러리 앱 또는 카메라를 이용하실 수 있습니다.',
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                          ),
                                          ButtonWidget(
                                            text: '차량 등록 후 이용 하기',
                                            link: submit,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: RedButtonWidget(text: '차량 등록 후 이용하기'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
