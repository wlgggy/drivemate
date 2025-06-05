import 'dart:async';
import 'dart:math';
import 'package:drivemate/ui/view/home/home_widget.dart';
import 'package:drivemate/ui/view/start/insert_view.dart';
import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final random = Random();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  late final AnimationController _controller;
  late Timer _timer;

  bool _isFaded = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (time) {
      setState(() {
        _isFaded = !_isFaded;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  final List<String> icon = <String>[
    'assets/icons/car_front.svg',
    'assets/icons/fan.svg',
    'assets/icons/location.svg',
    'assets/icons/key.svg',
  ];
  final List<String> title = [
    'Vehicle control',
    'Climate',
    'Location',
    'Valet Mode',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FullSizedBox(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.5, 0.55, 1],
              colors: [
                Color.fromARGB(100, 177, 177, 177),
                Color.fromARGB(100, 129, 129, 129),
                Color.fromARGB(100, 255, 255, 255),
                Color.fromARGB(100, 255, 255, 255),
              ],
            ),
          ),
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: _isFaded ? 1 : 0,
                duration: Duration(seconds: 10),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/cloud2.png'),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _isFaded ? 1 : 0,
                duration: Duration(seconds: 3),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/cloud1.png'),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Insert(),
                                ),
                              );
                            },
                            child: Row(
                              spacing: 10,
                              children: [
                                Text(
                                  'Q8',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          Row(
                            spacing: 15,
                            children: [
                              Icon(Icons.notifications),
                              Icon(Icons.settings),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconWidget(
                                icon: 'assets/icons/weather/sunny.svg',
                                text: '28.1',
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  SvgPicture.asset(
                                    width: 20,
                                    height: 20,
                                    'assets/icons/gas_station.svg',
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    child: Builder(
                                      builder: (context) {
                                        final distance =
                                            random.nextInt(120) + 30;

                                        if (distance < 50) {
                                          return Text(
                                            '${distance}km',
                                            style: TextStyle(color: Colors.red),
                                          );
                                        } else if (distance <= 100) {
                                          return Text(
                                            '${distance}km',
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            '${distance}km',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconWidget(
                            icon: 'assets/icons/location.svg',
                            text: '경상북도 경주시',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 300,
                      child: Image.asset('assets/images/q7.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        ClickWidget(
                          icon: 'assets/icons/power.svg',
                          change: 'assets/icons/power.svg',
                          text: '시동',
                          entry: CarEntry.start,
                        ),
                        ClickWidget(
                          icon: 'assets/icons/lock.svg',
                          change: 'assets/icons/open.svg',
                          text: '도어',
                          entry: CarEntry.door,
                        ),
                        ClickWidget(
                          icon: 'assets/icons/car_door.svg',
                          change: 'assets/icons/car_door.svg',
                          text: '창문',
                          entry: CarEntry.window,
                        ),
                        WarningWidget(text: '비상등'),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '홍길동님, 안녕하세요?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: ListView.separated(
                        itemCount: icon.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MenuWidget(
                            icon: icon[index],
                            text: title[index],
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
