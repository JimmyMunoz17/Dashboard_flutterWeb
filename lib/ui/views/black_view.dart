import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cards/white_card.dart';
import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';

class BlackView extends StatelessWidget {
  const BlackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Black view',
          style: CustomLabels.h1,
        ),
        const SizedBox(
          height: 10,
        ),
        WhiteCard(
            title: 'Black view',
            child: Text('Data', style: GoogleFonts.roboto(color: Colors.white)))
      ],
    );
  }
}
