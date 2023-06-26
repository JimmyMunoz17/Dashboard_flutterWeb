import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Function? onPressed;
  const LinkText({Key? key, required this.text, this.onPressed, this.icon})
      : super(key: key);

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => isHover = true),
            onExit: (_) => setState(() => isHover = false),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: Colors.black,
                    size: 20,
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        decoration: isHover
                            ? TextDecoration.underline
                            : TextDecoration.none),
                  ),
                ],
              ),
            )));
  }
}
