import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late double width = (MediaQuery.of(context).size.width / 2) - 24;

    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
              const EdgeInsets.only(top: 24, bottom: 11, left: 16, right: 16),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/productDetails');
        },
        child: Column(
          children: [
            Container(
              width: width,
              height: width * 0.7,
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
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "Hamburger",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.9,
                        fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Burger",
                    style: TextStyle(
                        color: Color.fromARGB(92, 46, 44, 1),
                        fontSize: 13.3,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('R 5,00',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.2,
                            fontWeight: FontWeight.w600)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 35,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
