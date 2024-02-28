import 'package:flutter/material.dart';
import 'package:jjk_dice/screen/root_screen.dart';
import 'package:jjk_dice/const/colors.dart';

void main() {
  runApp(JJKDice());
}

class JJKDice extends StatelessWidget {
  const JJKDice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          sliderTheme: SliderThemeData(
            thumbColor: primaryColor,
            activeTickMarkColor: primaryColor,
            inactiveTickMarkColor: primaryColor.withOpacity(0.3),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: backgroundColor,
            selectedItemColor: primaryColor,
            unselectedItemColor: secondaryColor,
          )),
      home: RootScreen(),
    );
  }
}
