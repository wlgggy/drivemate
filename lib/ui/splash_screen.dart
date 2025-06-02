import 'package:drivemate/main.dart';
import 'package:drivemate/ui/view/start/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool _isFaded = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      setState(() {
        _isFaded = true;
      });
    });
    return Material(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: AnimatedOpacity(
              /*Navigator.push(context, MaterialPageRoute(builder: (context)=>const Load()));*/
              onEnd: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              opacity: _isFaded ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SvgPicture.asset(
                    'assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
                    color: MyApp.logo,
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Drive Mate',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '연결하고, 운전하고, 즐기세요',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Image.asset('assets/images/car.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
