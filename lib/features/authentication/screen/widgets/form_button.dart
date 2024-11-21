import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? borderColor;
  final Widget? icon;
  final double? padding;
  final VoidCallback? onTap;
  const FormButton({
    super.key,
    this.bgColor,
    this.borderColor,
    required this.text,
    this.icon,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            5.widthBox,
            Text(text)
                .textColor(Colors.white)
                .bold()
                .fontSize(18)
                .alignAtCenter(),
          ],
        ),
      ),
    );
  }
}
