import 'package:flutter/material.dart';

class ToastAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  const ToastAnimation({super.key, required this.child, required this.delay});

  @override
  State<ToastAnimation> createState() => _ToastAnimationState();
}

class _ToastAnimationState extends State<ToastAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.00, 0.35), end: Offset.zero)
            .animate(curve);

    Future.delayed(Duration(milliseconds: widget.delay - 500), () {
      _animController.reverse();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
