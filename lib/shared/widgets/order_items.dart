import 'package:flutter/material.dart';
import 'package:comex_app/shared/widgets/add_and_decrease_product_quantity.dart';


class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(
              left: 16, bottom: 5, right: 16, top: 5)),
      onPressed: () {
        Navigator.pushNamed(context, '/productDetails');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://www.cnnbrasil.com.br/viagemegastronomia/wp-content/uploads/sites/5/2022/05/origem-do-hambuguer-cnn4.jpg?w=1200&h=900&crop=1',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Container(
              padding:const EdgeInsets.only(top: 16, bottom: 16),
               height: 100,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hamburger",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "R\$ 5,00",
                    style: TextStyle(
                      color: Color(0xFFA72117),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Container(
            color: Colors.white,
            child:const  AddAndDecreaseProductQuantity(
              direction: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}
