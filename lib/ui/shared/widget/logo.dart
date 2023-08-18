import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/providers.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //instancia del provider autenticado y sus datos
    final user = Provider.of<AuthProvider>(context).user!;
    final image = (user.img == null)
        ? const Image(
            image: AssetImage('/img/no-image.jpg'),
          )
        : FadeInImage.assetNetwork(
            placeholder: '/gif/loader.gif', image: user.img!);

    return Container(
      padding: const EdgeInsets.only(top: 30),
      // ignore: prefer_const_constructors
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: ClipOval(
              child: image,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.nombre,
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
