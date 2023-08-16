import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _scale = 10.0;
  double _animationOpacityLogo = 0.0;
  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 120 * _scale;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scale = 1;
        _animationOpacityLogo = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background_image_chair.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            duration: const Duration(seconds: 3),
            child: AnimatedContainer(
              width: _logoAnimationWidth,
              height: _logoAnimationHeight,
              curve: Curves.linearToEaseOut,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                'assets/images/imgLogo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
