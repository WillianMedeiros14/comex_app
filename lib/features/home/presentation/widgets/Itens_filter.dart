import 'package:flutter/material.dart';

class ItensFilter extends StatelessWidget {
  final String text;
  final bool isActive;
  final ValueChanged<String>? onSelect;

  const ItensFilter(
      {super.key, required this.text, required this.isActive, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        side: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        if (onSelect != null) {
          onSelect!(text);
        }
      },
      child: Text(
        text,
        style: TextStyle(color: isActive ? Colors.white : Colors.black),
      ),
    );
  }
}
