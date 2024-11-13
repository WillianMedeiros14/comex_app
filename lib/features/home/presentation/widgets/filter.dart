import 'package:comex_app/features/home/presentation/widgets/Itens_filter.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  final String filtterActive;
  final ValueChanged<String> onSelectFilter;

  const Filter(
      {super.key, required this.filtterActive, required this.onSelectFilter});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> filtersList = [
    'Todos',
    'Pizas',
    'Bebidas',
    'Hamburguer',
    'Doces',
    'Saladas'
  ];
  late String filterActiveChanged;

  void _onFilterSelectedConfirm() {
    widget.onSelectFilter(filterActiveChanged);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    filterActiveChanged = widget.filtterActive;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      color: Colors.white,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Selecione um filtro',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: filtersList.map((filter) {
                          print({
                            "filter": filter,
                            "isActive": filter == filterActiveChanged,
                          });
                          return ItensFilter(
                            text: filter,
                            isActive: filter == filterActiveChanged,
                            onSelect: (String value) =>
                                {setState(() => filterActiveChanged = value)},
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                    color: Colors.red, width: 1.5),
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
                                _onFilterSelectedConfirm();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 3, 146, 91),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 3, 146, 91),
                                    width: 1.5),
                              ),
                              child: const Text(
                                'Confirmar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}
