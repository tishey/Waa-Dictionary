

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FadeInleft extends StatefulWidget {
  Widget? animatedWidget;
  FadeInleft({Key? key, this.animatedWidget}) : super(key: key);

  @override
  _FadeInleftState createState() => _FadeInleftState();
}

class _FadeInleftState extends State<FadeInleft> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 900),
        tween: Tween<double>(begin: 0, end: 1),
        child: widget.animatedWidget,
        builder: (context, double _value, Widget? child) {
          return Opacity(
              opacity: _value,
              child: TweenAnimationBuilder(
                  duration: const Duration(seconds: 1),
                  tween: Tween<double>(begin: 50, end: 0),
                  child: widget.animatedWidget,
                  builder: (context, double _value, Widget? child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: _value * 2,
                      ),
                      child: child,
                    );
                  }));
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// ignore: must_be_immutable
class FadeInRight extends StatefulWidget {
  Widget? animatedWidget;
  FadeInRight({Key? key, this.animatedWidget}) : super(key: key);

  @override
  _FadeInRightState createState() => _FadeInRightState();
}

class _FadeInRightState extends State<FadeInRight> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 900),
        tween: Tween<double>(begin: 0, end: 1),
        child: widget.animatedWidget,
        builder: (context, double _value, Widget? child) {
          return Opacity(
              opacity: _value,
              child: TweenAnimationBuilder(
                  duration: const Duration(seconds: 1),
                  tween: Tween<double>(begin: 50, end: 0),
                  child: widget.animatedWidget,
                  builder: (context, double _value, Widget? child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: _value * 2,
                      ),
                      child: child,
                    );
                  }));
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}


class FadeInBottom extends StatefulWidget {
  Widget? animatedWidget;
  FadeInBottom({Key? key, this.animatedWidget}) : super(key: key);

  @override
  _FadeInBottomState createState() => _FadeInBottomState();
}

class _FadeInBottomState extends State<FadeInBottom> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 900),
        tween: Tween<double>(begin: 0, end: 1),
        child: widget.animatedWidget,
        builder: (context, double _value, Widget? child) {
          return Opacity(
              opacity: _value,
              child: TweenAnimationBuilder(
                  duration: const Duration(seconds: 1),
                  tween: Tween<double>(begin: 50, end: 0),
                  child: widget.animatedWidget,
                  builder: (context, double _value, Widget? child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: _value * 2,
                      ),
                      child: child,
                    );
                  }));
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}