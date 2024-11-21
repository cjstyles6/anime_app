import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class AnimeButton extends StatelessWidget {
  final Icon? icon;
  final Color? bgColor;
  final Color? borderColor;
  final String text;
  final VoidCallback? onPressed;
  final double? radius;

  const AnimeButton({
    super.key,
    this.icon,
    this.bgColor,
    required this.text,
    this.borderColor = Colors.transparent,
    this.onPressed,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        child: Row(
          children: [
            icon ?? const SizedBox(),
            5.widthBox,
            Center(child: Text(text).fontSize(18).textColor(Colors.white)),
          ],
        ),
      ),
    );
  }
}
