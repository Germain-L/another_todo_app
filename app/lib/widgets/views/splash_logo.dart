import 'package:flutter/material.dart';

class SplashLogo extends StatefulWidget {
  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = Tween(begin: 0.0, end: 0.8).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget child) {
                  return Transform.translate(
                    offset: Offset(0, animation.value * 100),
                    child: child,
                  );
                },
                child: Text(
                  "Another Todo",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget child) {
                  return Transform.scale(
                    scale: animation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  "assets/app_logo.png",
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
