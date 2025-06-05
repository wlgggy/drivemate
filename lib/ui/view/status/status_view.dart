import 'dart:math';

import 'package:drivemate/main.dart';
import 'package:drivemate/ui/view/home/home_widget.dart';
import 'package:drivemate/ui/button_widget.dart';
import 'package:drivemate/ui/view/status/status_widget.dart';
import 'package:drivemate/ui/widget/logo_widget.dart';
import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<StatefulWidget> createState() => StatusState();
}

class StatusState extends State<Status> {
  final List<String> icon = <String>[
    'assets/icons/door.svg',
    'assets/icons/window.svg',
    'assets/icons/tailgate.svg',
    'assets/icons/bonnet.svg',
  ];
  final List<String> title = ['도어', '창문', '테일게이트', '후드'];
  final List<String> close = ['잠김', '닫힘', '닫힘', '닫힘'];

  final List<String> Airicon = <String>[
    'assets/icons/snowflake.svg',
    'assets/icons/handle.svg',
    'assets/icons/mirror.svg',
    'assets/icons/mirror.svg',
    'assets/icons/side mirror.svg',
  ];
  final List<String> Airtitle = [
    '냉/난방',
    '핸들 열선',
    '앞유리 성에 제거',
    '뒷유리 열선',
    '사이드 미러 열선',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: Navigator.of(context).pop,
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
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    spacing: 15,
                    children: [Icon(Icons.notifications), Icon(Icons.settings)],
                  ),
                ],
              ),
            ),
            bottom: TabBar(tabs: [Tab(text: '차량'), Tab(text: '공조')]),
          ),
          body: TabBarView(
            children: [
              FullSizedBox(
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 100,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '차량 상태',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.separated(
                          itemCount: icon.length,
                          itemBuilder: (BuildContext context, int index) {
                            var entry = switch(index) {
                              0 => CarEntry.door,
                              1 => CarEntry.window,
                              _ => null,
                            };
                            return CarWidget(
                              icon: icon[index],
                              title: title[index],
                              close: close[index],
                              entry: entry,
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FullSizedBox(
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 100,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '공조 상태',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.separated(
                          itemCount: Airicon.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AirWidget(
                              icon: Airicon[index],
                              title: Airtitle[index],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
