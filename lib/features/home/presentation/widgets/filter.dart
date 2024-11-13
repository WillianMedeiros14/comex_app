
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      color: Colors.white,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Selecione um filtro'),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.red,
                                  width: 1.5),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                             style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 3, 146, 91),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 3, 146, 91),
                                  width: 1.5),
                            ),
                            child: const Text('Confirmar', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
