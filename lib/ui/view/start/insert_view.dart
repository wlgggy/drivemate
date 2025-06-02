import 'package:drivemate/main.dart';
import 'package:drivemate/ui/view/start/button_widget.dart';
import 'package:drivemate/ui/widget/logo_widget.dart';
import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<StatefulWidget> createState() => InsertState();
}

class InsertState extends State<Insert> {
  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 20,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: LogoWidget(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 650,
                    color: MyApp.insertGrey,
                    child: Column(
                      spacing: 15,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        SizedBox(
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '차량등록하기',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              MaterialButton(
                                onPressed: Navigator.of(context).pop,
                                child: SvgPicture.asset(
                                  'assets/icons/cancel_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InputWidgetB(
                          text: '차량 이름',
                          icon:
                              'assets/icons/directions_car_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg',
                        ),
                        InputWidgetB(
                          text: '차량 번호',
                          icon:
                              'assets/icons/pin_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg',
                        ),
                        Container(
                          width: 400,
                          height: 200,
                          color: MyApp.white,
                          child: SvgPicture.asset(
                            'assets/icons/image_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Column(
                          children: [
                            Text('이미지를 선택 해 주세요.'),
                            Text('갤러리 앱 또는 카메라를 이용하실 수 있습니다.'),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        ButtonWidget(text: '차량 등록 후 이용하기'),
                      ],
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
