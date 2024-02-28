import 'package:flutter/material.dart';
import 'package:jjk_dice/screen/home_screen.dart';
import 'package:jjk_dice/screen/settings_screen.dart';
import 'package:shake/shake.dart';
import 'dart:math';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? shakeDetector;
  @override
  void initState() {
    super.initState();
    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
      onPhoneShake: onPhoneShake,
    );
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening();
  }

  void onPhoneShake() {
    final rand = new Random();
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  tabListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavi(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number),
      SettingsScreen(
          threshold: threshold, onThresholdChange: onThresholdChange),
    ];
  }

  BottomNavigationBar renderBottomNavi() {
    return BottomNavigationBar(
        currentIndex: controller!.index,
        onTap: (value) {
          setState(() {
            controller!.animateTo(value);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edgesensor_high_outlined,
              ),
              label: 'dice'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
        ]);
  }

  void onThresholdChange(double val) {
    setState(() {
      threshold = val;
    });
  }
}
