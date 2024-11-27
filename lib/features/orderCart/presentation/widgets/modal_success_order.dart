import 'package:flutter/material.dart';

class ModalSuccessOrder extends StatefulWidget {
  final bool isOpen;

  const ModalSuccessOrder({
    required this.isOpen,
    super.key,
  });

  @override
  State<ModalSuccessOrder> createState() => ModalSuccessOrderState();
}

class ModalSuccessOrderState extends State<ModalSuccessOrder> {
  late bool isModalOpen;

  @override
  void initState() {
    super.initState();
    isModalOpen = widget.isOpen;
  }

  @override
  void didUpdateWidget(covariant ModalSuccessOrder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen != oldWidget.isOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          isModalOpen = widget.isOpen;
        });
        if (isModalOpen) {
          openModal(context);
        }
      });
    }
  }

  void openModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 200,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Pedido Realizado com Sucesso!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 3, 146, 91),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 3, 146, 91),
                                  width: 1.5),
                            ),
                            child: const Text(
                              'Ir para o pedido',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
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
                            child: const Text('Fechar'),
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
