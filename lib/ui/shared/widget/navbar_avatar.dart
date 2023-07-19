import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://qph.cf2.quoracdn.net/main-thumb-145729502-200-tiwxabxurirfybmbizgfujpvvibbyrak.jpeg',
        width: 30,
        height: 30,
      ),
    );
  }
}
