import 'package:flutter/material.dart';

class CustomButton {
  //Button option
  static ElevatedButton buttonOpt({
    required Text text,
    required Color colorButton,
    required double bordeRadius,
    required Function onPressed,
  }) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(bordeRadius))),
          fixedSize: MaterialStateProperty.all(const Size(300, 65)),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(colorButton)),
      child: Padding(padding: const EdgeInsets.all(10), child: text),
    );
  }

  //Button option icon
  static ElevatedButton buttonOptIcon({
    required Text text,
    required Image iconImage,
    required Color colorButton,
    required double bordeRadius,
    required Function onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      icon: iconImage,
      label: text,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(bordeRadius))),
          fixedSize: MaterialStateProperty.all(const Size(300, 65)),
          elevation: MaterialStateProperty.all(20),
          backgroundColor: MaterialStateProperty.all(colorButton)),
    );
  }
}
