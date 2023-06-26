import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'gif/icon_auth.gif',
            width: 50,
            height: 50,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Connectate Now',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 50, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
