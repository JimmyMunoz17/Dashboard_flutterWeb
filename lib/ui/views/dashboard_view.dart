import 'package:dashboard_admin/providers/auth_provider.dart';
import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/cards/white_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //instancia del provider autenticado y sus datos
    final user = Provider.of<AuthProvider>(context).user!;
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Dashboard view',
          style: CustomLabels.h1,
        ),
        const SizedBox(
          height: 10,
        ),
        WhiteCard(
            title: user.nombre,
            child: Text(user.correo,
                style: GoogleFonts.roboto(color: Colors.white)))
      ],
    );
  }
}
