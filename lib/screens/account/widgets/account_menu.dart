import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountButton(
              caption: 'Tus ordenes',
              onPressed: () {},
            ),
            AccountButton(
              caption: 'Cambiar a vendedor',
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountButton(
              caption: 'Cerrar sesion',
              onPressed: () {},
            ),
            AccountButton(
              caption: 'Tu lista de deseos',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
    required this.caption,
    required this.onPressed,
  });
  final String caption;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )),
          onPressed: onPressed,
          child: Text(
            caption,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
