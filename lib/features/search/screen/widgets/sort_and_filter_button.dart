import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class SortAndFilterButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const SortAndFilterButton({
    super.key,
    required this.text,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: selected ? primaryColor : Colors.transparent,
          border: Border.all(
            color: selected ? Colors.transparent : primaryColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text.capitalize)
            .fontSize(18)
            .textColor(selected ? Colors.white : primaryColor)
            .bold(),
      ),
    );
  }
}
