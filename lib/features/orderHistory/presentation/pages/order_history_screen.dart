import 'package:comex_app/shared/widgets/order_items.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Histórico de pedidos",
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: const Stack(children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    // child: Wrap(
                    //   spacing: 16,
                    //   runSpacing: 16,
                    //   children: [
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     OrderItems(
                    //       isHistoric: true,
                    //     ),
                    //     SizedBox(
                    //       height: 100,
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
