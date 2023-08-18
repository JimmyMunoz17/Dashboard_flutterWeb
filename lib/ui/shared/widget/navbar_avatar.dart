import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/providers.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

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

    return CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: ClipOval(child: image));
  }
}
