
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.controllerSearchInput,
  });

  final TextEditingController controllerSearchInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerSearchInput,
      style: const TextStyle(fontSize: 14.8),
      decoration: InputDecoration(
        hintText: "Pesquisar",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide:
              const BorderSide(width: 0.5, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide:
              const BorderSide(width: 1.5, color: Colors.black),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
