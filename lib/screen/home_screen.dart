import 'package:flutter/material.dart';
import 'package:jjk_dice/const/colors.dart';

class HomeScreen extends StatelessWidget {
  final int number;

  const HomeScreen({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('asset/img/$number.png'),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          'Lucky Number',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          number.toString(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 60,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
