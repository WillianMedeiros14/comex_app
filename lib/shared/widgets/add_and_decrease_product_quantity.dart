import 'package:flutter/material.dart';

class AddAndDecreaseProductQuantity extends StatelessWidget {
  final Axis direction;

  const AddAndDecreaseProductQuantity({
    super.key,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: direction == Axis.horizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildIconButton(Icons.remove, direction),
                const SizedBox(width: 10),
                _textValue(),
                const SizedBox(width: 10),
                _buildIconButton(Icons.add, direction),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(Icons.remove, direction),
                const SizedBox(height: 10),
                _textValue(),
                const SizedBox(height: 10),
                _buildIconButton(Icons.add, direction),
              ],
            ),
    );
  }

  Widget _buildIconButton(IconData icon,    Axis direction) {
    return Container(
      width:  direction == Axis.horizontal? null:  35,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: direction == Axis.horizontal ?  20 : 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget _textValue() {
  return const Text(
    '1',
    style: TextStyle(color: Colors.black, fontSize: 18.4),
  );
}
