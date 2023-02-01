import 'package:dictionary/src/core/util/colors.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  PopUp({this.animatedChild, super.key});
  IconData? animatedChild;

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController? _controller;
  Animation? _colorAnimation;
  Animation<double>? _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: CustomColors.secondaryColor)
            .animate(_controller!);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_controller!);

    _controller!.addListener(() {
      print(_controller!.value);
      print(_colorAnimation!.value);
    });

    _controller!.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller!,
        builder: (context, _) {
          return IconButton(
            onPressed: () {
              isFav ? _controller!.reverse() : _controller!.forward();
            },
            icon: Icon(
              widget.animatedChild,
              size: _sizeAnimation!.value,
              color: _colorAnimation!.value,
            ),
          );
        });
  }
}
