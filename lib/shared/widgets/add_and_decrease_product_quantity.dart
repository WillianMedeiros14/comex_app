import 'package:flutter/material.dart';

class AddAndDecreaseProductQuantity extends StatelessWidget {
  final Axis direction;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final int value;

  const AddAndDecreaseProductQuantity({
    super.key,
    this.direction = Axis.horizontal,
    required this.onIncrease,
    required this.onDecrease,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: direction == Axis.horizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildIconButton(Icons.remove, direction, onIncrease),
                const SizedBox(width: 10),
                _textValue(value: value),
                const SizedBox(width: 10),
                _buildIconButton(Icons.add, direction, onDecrease),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(Icons.add, direction, onIncrease),
                _textValue(value: value),
                _buildIconButton(Icons.remove, direction, onDecrease),
              ],
            ),
    );
  }

  Widget _buildIconButton(
      IconData icon, Axis direction, VoidCallback onPressed) {
    return Container(
      width: direction == Axis.horizontal ? null : 35,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: direction == Axis.horizontal ? 20 : 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget _textValue({required int value}) {
  return Text(
    '$value',
    style: const TextStyle(color: Colors.black, fontSize: 18.4),
  );
}
