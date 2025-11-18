import 'package:flutter/material.dart';

class FruitItemSkeleton extends StatefulWidget {
  const FruitItemSkeleton({Key? key}) : super(key: key);

  @override
  State<FruitItemSkeleton> createState() => _FruitItemSkeletonState();
}

class _FruitItemSkeletonState extends State<FruitItemSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(radius: 12, backgroundColor: Colors.grey[400]),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(height: 80, width: 80, color: Colors.grey[400]),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(height: 12, color: Colors.grey[400]),
                        SizedBox(height: 4),
                        Container(height: 12, color: Colors.grey[400]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
