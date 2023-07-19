import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      // ignore: prefer_const_constructors
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Admin",
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
