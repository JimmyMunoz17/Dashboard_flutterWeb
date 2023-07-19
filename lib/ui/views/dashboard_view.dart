import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cards/white_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            title: 'Sales Statistics',
            child: Text('Data', style: GoogleFonts.roboto(color: Colors.white)))
      ],
    );
  }
}
