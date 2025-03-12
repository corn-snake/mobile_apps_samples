import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintScreen extends StatefulWidget {
  @override
  _CustomPaintScreenState createState() => _CustomPaintScreenState();
}

class _CustomPaintScreenState extends State<CustomPaintScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Color _currentColor = Colors.purple;
  Offset _shadowOffset = Offset(5, 5);
  int _tapCount = 0; // Contador de toques

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeColor() {
    setState(() {
      _tapCount++;
      _currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
    });
  }

  void _updateShadow(DragUpdateDetails details) {
    setState(() {
      _shadowOffset = details.localPosition - Offset(150, 150);
    });
  }

  void _onLongPress() {
    setState(() {
      _currentColor = Colors.black;
    });
  }

  void _onDoubleTap() {
    setState(() {
      _currentColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Custom Paint Avanzado')),
    body: GestureDetector(
      onTap: _changeColor,
      onPanUpdate: _updateShadow,
      onLongPress: _onLongPress,
      onDoubleTap: _onDoubleTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: CustomPaint(
                  size: Size(300, 300),
                  painter: FiguraComplejaPainter(_currentColor, _shadowOffset),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
            'Toques: $_tapCount',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class FiguraComplejaPainter extends CustomPainter {
final Color color;
final Offset shadowOffset;

FiguraComplejaPainter(this.color, this.shadowOffset);

@override
void paint(Canvas canvas, Size size) {
final Paint paint = Paint()
..shader = ui.Gradient.linear(
Offset(0, 0),
Offset(size.width, size.height),
[color, Colors.white],
)
..style = PaintingStyle.fill;

final Paint shadowPaint = Paint()
..color = Colors.black.withOpacity(0.3)
..maskFilter = MaskFilter.blur(BlurStyle.normal, 10.0);

final Path path = Path();
double centerX = size.width / 2;
double centerY = size.height / 2;
double radius = size.width / 3;

for (int i = 0; i < 10; i++) {
double angle = (i*36) *(pi / 180);
double r = i.isEven ? radius : radius / 2;
double x = centerX + r * cos(angle);
double y = centerY + r * sin(angle);
if (i == 0) {
path.moveTo(x, y);
} else {
path.lineTo(x, y);
}
}
path.close();

canvas.translate(shadowOffset.dx, shadowOffset.dy);
canvas.drawPath(path, shadowPaint);
canvas.translate(-shadowOffset.dx, -shadowOffset.dy);

canvas.drawPath(path, paint);
}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}