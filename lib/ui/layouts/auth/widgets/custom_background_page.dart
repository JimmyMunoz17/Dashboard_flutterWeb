import 'package:flutter/material.dart';

class CustomBackgroundPage extends StatelessWidget {
  const CustomBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Background Page AUTH
    return Container(
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromRGBO(30, 30, 30, 1),
        Color.fromRGBO(45, 45, 45, 1),
        Color.fromRGBO(69, 69, 69, 1),
      ], begin: Alignment.topRight, end: Alignment.bottomCenter),
    );
  }
}
