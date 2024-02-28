import 'package:jjk_dice/const/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold;
  final ValueChanged<double> onThresholdChange;

  const SettingsScreen(
      {required this.threshold, required this.onThresholdChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                '민감도',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Slider(
          value: threshold,
          onChanged: onThresholdChange,
          label: threshold.toStringAsFixed(1),
          min: 0.1,
          max: 10,
          divisions: 101,
        )
      ],
    );
  }
}
