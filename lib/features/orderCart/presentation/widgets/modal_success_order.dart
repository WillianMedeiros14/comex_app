import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModalSuccessOrder extends StatefulWidget {
  final bool isOpen;
  final int idOrderCreated;

  const ModalSuccessOrder({
    required this.isOpen,
    required this.idOrderCreated,
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
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

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
                            onPressed: () {
                              cartStore.clearCart();
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                '/orderHistoryDetailsScreen',
                                arguments: {"orderId": widget.idOrderCreated},
                              );
                            },
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
                              cartStore.clearCart();
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
