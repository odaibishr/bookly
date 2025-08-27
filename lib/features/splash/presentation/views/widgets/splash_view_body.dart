import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero).animate(_controller);
    _controller.forward();
    animation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(
              offset: animation.value,
              child: const Text("Read Free Books", textAlign: TextAlign.center),
            );
          },
        ),
      ],
    );
  }
}
