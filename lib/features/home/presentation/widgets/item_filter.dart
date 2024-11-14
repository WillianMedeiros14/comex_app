import 'package:flutter/material.dart';

class ItemFilter extends StatefulWidget {
  final String text;
  final bool isActive;
  final ValueChanged<String>? onSelect;

  const ItemFilter(
      {super.key, required this.text, required this.isActive, this.onSelect});

  @override
  State<ItemFilter> createState() => _ItemFilterState();
}

class _ItemFilterState extends State<ItemFilter> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: widget.isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        side: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        if (widget.onSelect != null) {
          widget.onSelect!(widget.text);
        }
      },
      child: Text(
        widget.text,
        style: TextStyle(color: widget.isActive ? Colors.white : Colors.black),
      ),
    );
  }
}
