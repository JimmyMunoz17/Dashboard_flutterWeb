import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/buttons/link_text.dart';

class CustomLinksBar extends StatelessWidget {
  const CustomLinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      color: const Color.fromRGBO(48, 48, 48, 1),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: LinkText(
                text: 'Copyright © | Coded by Jimmy Muñoz',
                onPressed: () => _validationUrl(
                    'https://frabjous-kashata-df1b24.netlify.app/#/home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_validationUrl(String url) {
  final Uri urlData = Uri.parse(url);
  return urlData.hasEmptyPath
      ? throw Exception('Error $urlData')
      : launchUrl(urlData);
}
