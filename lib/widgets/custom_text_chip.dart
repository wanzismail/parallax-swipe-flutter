import 'package:flutter/material.dart';
import 'package:parallax_swipe/themes/app_colors.dart';
import 'package:parallax_swipe/themes/fonts_family.dart';

class CustomTextChip extends StatelessWidget {
  final String label;
  final Color? color;
  final double? width;
  final double? height;
  final bool selected;
  final Function(bool selected) onSelect;

  const CustomTextChip({
    Key? key,
    required this.label,
    this.color,
    this.width,
    this.height,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(milliseconds: 300),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected
              ? (color ?? Colors.black)
              : AppColors.chipUnselectedColor,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () => onSelect(!selected),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily:
                  selected ? FontsFamily.avenirBlack : FontsFamily.avenirMedium,
              color: AppColors.textPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
