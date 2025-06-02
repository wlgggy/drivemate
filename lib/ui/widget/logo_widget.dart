import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        SvgPicture.asset(
          'assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
          color: MyApp.logo,
          width: 40,
          height: 40,
        ),
        Text(
          'Drive Mate',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: MyApp.white,
          ),
        ),
      ],
    );
  }
}
