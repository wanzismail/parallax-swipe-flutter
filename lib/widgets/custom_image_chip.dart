import 'package:flutter/material.dart';
import 'package:parallax_swipe/constants/environment.dart';
import 'package:parallax_swipe/themes/app_colors.dart';

class CustomImageChip extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final bool selected;
  final Function(bool selected) onSelect;

  const CustomImageChip({
    Key? key,
    required this.path,
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
        color: AppColors.chipUnselectedColor,
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
          child: Image.asset(
            Environment.imageAssets + path,
            width: 60,
          ),
        ),
      ),
    );
  }
}
