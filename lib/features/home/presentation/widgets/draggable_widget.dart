import 'dart:math';

import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final int value;
  const DraggableWidget({super.key, required this.value});

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double _top = 150;
  double _left = 16;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/orderCartScreen',
            arguments: {"isActiveBottom": false}),
        onPanUpdate: (details) {
          setState(() {
            _top = max(0, _top + details.delta.dy);
            _left = max(0, _left + details.delta.dx);
          });
        },
        child: Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 192, 35, 24),
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "${widget.value}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
