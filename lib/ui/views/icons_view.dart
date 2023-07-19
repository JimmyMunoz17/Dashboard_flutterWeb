import 'package:flutter/material.dart';

import '../widgets/cards/white_card.dart';
import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Icons',
          style: CustomLabels.h1,
        ),
        const SizedBox(
          height: 10,
        ),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
                title: 'Ac_unit_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                )),
            WhiteCard(
                title: 'Timelapse_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.timelapse_outlined),
                )),
            WhiteCard(
                title: 'Access_alarm_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.access_alarm_outlined),
                )),
            WhiteCard(
                title: 'Zoom_in_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.zoom_in_outlined),
                )),
            WhiteCard(
                title: 'Desktop_mac_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.desktop_mac_outlined),
                )),
            WhiteCard(
                title: 'Phone_android_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.phone_android_outlined),
                )),
            WhiteCard(
                title: 'Portrait_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.portrait_outlined),
                )),
          ],
        )
      ],
    );
  }
}
