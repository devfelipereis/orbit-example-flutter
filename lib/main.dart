import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Orbit Example',
      home: Orbit(),
    );
  }
}

class Orbit extends StatefulWidget {
  const Orbit({Key? key}) : super(key: key);

  @override
  _Orbit createState() => _Orbit();
}

class _Orbit extends State<Orbit> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this)
      ..repeat(period: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/stars.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage('assets/earth.png'),
            width: 220,
            height: 220,
          ),
          RotationTransition(
            turns: controller,
            child: Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: const Offset(0, 150),
                child: Transform.rotate(
                  angle: 5,
                  child: const Image(
                    width: 40,
                    height: 40,
                    image: AssetImage('assets/moon.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
