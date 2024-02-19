import 'package:flutter/material.dart';

class DealsOfDay extends StatefulWidget {
  const DealsOfDay({super.key});

  @override
  State<DealsOfDay> createState() => _DealsOfDayState();
}

class _DealsOfDayState extends State<DealsOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            'Ofertas del día',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://m.media-amazon.com/images/W/MEDIAX_849526-T2/images/I/81KYcp48kgL._SL1500_.jpg',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text(
            '\$${0.00}',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Product Name',
            style: TextStyle(fontSize: 20),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              'https://m.media-amazon.com/images/W/MEDIAX_849526-T2/images/I/81KYcp48kgL._SL1500_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            Image.network(
              'https://m.media-amazon.com/images/W/MEDIAX_849526-T2/images/I/81KYcp48kgL._SL1500_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            Image.network(
              'https://m.media-amazon.com/images/W/MEDIAX_849526-T2/images/I/81KYcp48kgL._SL1500_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            Image.network(
              'https://m.media-amazon.com/images/W/MEDIAX_849526-T2/images/I/81KYcp48kgL._SL1500_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'Ver todas las ofertas',
            style: TextStyle(
              color: Colors.cyan.shade800,
            ),
          ),
        )
      ],
    );
  }
}
