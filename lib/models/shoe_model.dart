import 'package:flutter/material.dart';
import 'package:parallax_swipe/themes/app_colors.dart';

class ShoeModel {
  final String name;
  final String price;
  final String image;
  final Color backgroundColor;
  final Color? textColor;

  ShoeModel({
    required this.name,
    required this.price,
    required this.image,
    required this.backgroundColor,
    this.textColor = Colors.white,
  });
}

final List<ShoeModel> carouselItems = [
  ShoeModel(
    name: 'Alpha Savage',
    price: '₹8,895',
    image: 'img_red_shoe.png',
    backgroundColor: AppColors.shoeRedColor,
  ),
  ShoeModel(
    name: 'Air Max 97',
    price: '₹11,897',
    image: 'img_yellow_shoe.png',
    backgroundColor: AppColors.shoeYellowColor,
  ),
  ShoeModel(
    name: 'KD13 EP',
    price: '₹12,995',
    image: 'img_white_blue_shoe.png',
    backgroundColor: AppColors.shoeBlueColor,
  ),
  ShoeModel(
    name: 'Air Presto by you',
    price: '₹12,995',
    image: 'img_green_shoe.png',
    backgroundColor: AppColors.shoeGreenColor,
  )
];

final List<ShoeModel> optionItems = [
  ShoeModel(
    name: 'Undercover React Presto',
    price: '₹12,797',
    image: 'img_white_red_shoe.png',
    backgroundColor: AppColors.shoeRedColor,
  ),
  ShoeModel(
    name: 'Air Zoom Pegasus 37',
    price: '₹9,995',
    image: 'img_blue_shoe.png',
    backgroundColor: AppColors.shoeBlueColor,
  ),
];
