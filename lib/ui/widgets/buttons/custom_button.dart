import 'package:flutter/material.dart';

class CustomButton {
  //Button option
  static ElevatedButton buttonOpt(
      {required Text text,
      required Color colorButton,
      required double bordeRadius,
      required Function onPressed,
      double sizeWidth = 300,
      double sizeHeight = 65}) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(bordeRadius))),
          fixedSize: MaterialStateProperty.all(Size(sizeWidth, sizeHeight)),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(colorButton)),
      child: Padding(padding: const EdgeInsets.all(10), child: text),
    );
  }

  //Button option icon
  static ElevatedButton buttonOptIcon(
      {required Text text,
      required IconData iconImage,
      required Color colorButton,
      required double bordeRadius,
      required Function onPressed,
      double sizeWidth = 300,
      double sizeHeight = 200}) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      icon: Icon(iconImage),
      label: text,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(bordeRadius))),
          fixedSize: MaterialStateProperty.all(Size(sizeWidth, sizeHeight)),
          elevation: MaterialStateProperty.all(20),
          backgroundColor: MaterialStateProperty.all(colorButton)),
    );
  }
}
