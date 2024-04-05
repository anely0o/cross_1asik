import 'package:cross/animated_object.dart';
import 'package:cross/fade_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_villains/villains/villains.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [new VillainTransitionObserver()],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _backgroundColor = Color(0xFFF15BB5);

  static const _colors = [
    Color.fromARGB(255, 255, 100, 198),
    Color.fromARGB(255, 232, 41, 146),
    Color.fromARGB(255, 229, 177, 222),
  ];

  static const _durations = [
    5000,
    4000,
    3000,
  ];

  static const _heightPercentages = [
    0.25,
    0.55,
    0.75,
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300)).then((val) {
      VillainController.playAllVillains(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeInWave(
              child: Container(
                width: double.infinity,
                height: 500,
                color: Colors.grey,
                child: WaveWidget(
                  config: CustomConfig(
                    colors: _colors,
                    durations: _durations,
                    heightPercentages: _heightPercentages,
                  ),
                  backgroundColor: _backgroundColor,
                  size: const Size(double.infinity, double.infinity),
                  waveAmplitude: 0,
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Color.fromARGB(229, 255, 184, 254),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  AnimatedObject(
                      child: Text(' Anelka 19',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 229, 72, 192)))),
                  SizedBox(height: 5),
                  AnimatedObject(
                      child: Text(
                          "This is my 1st assignment!!!!\n blah blah blah",
                          style: TextStyle(
                              color: Color.fromARGB(255, 229, 72, 192),
                              fontSize: 17,
                              fontWeight: FontWeight.w500))),
                  SizedBox(height: 15),
                  AnimatedObject(child: Divider(color: Colors.white))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
