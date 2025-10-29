import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffe4e4e4),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/letter-b.png',
              height: 23,
              width: 23,
              color: Color(0xFF3a3a3a),
            ),
            Image.asset(
              'assets/images/font.png',
              height: 23,
              width: 23,
              color: Color(0xFF6d6d6d),
            ),
            Image.asset(
              'assets/images/icons8-underline-100.png',
              height: 23,
              width: 23,
              color: Color(0xFF6d6d6d),
            ),
            Image.asset(
              'assets/images/icons8-align-left-100.png',
              height: 23,
              width: 23,
              color: Color(0xFF6d6d6d),
            ),
            Image.asset(
              'assets/images/icons8-alignment-100.png',
              height: 23,
              width: 23,
              color: Color(0xFF6d6d6d),
            ),
            Image.asset(
              'assets/images/icons8-align-justify-100.png',
              height: 23,
              width: 23,
              color: Color(0xFF6d6d6d),
            ),
          ],
        ),
      ),
    );
  }
}
