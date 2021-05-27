import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

final _controller = PageController(
  initialPage: 0,
);
List<Widget> _pages = [
  Column(
    children: [
      Image.asset('assets/images/delivery boy.png'),
      Text('Order Online From GoodHealth')
    ],
  ),
  Column(
    children: [
      Image.asset('assets\images\location.png'),
      Text('Set Your Delivery Location!')
    ],
  )
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
      ),
    );
  }
}
