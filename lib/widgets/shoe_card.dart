import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:parallax_swipe/constants/environment.dart';
import 'package:parallax_swipe/models/shoe_model.dart';
import 'package:parallax_swipe/themes/fonts_family.dart';

class ShoeCard extends StatelessWidget {
  final ShoeModel shoe;

  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      width: 300,
      child: Stack(
        children: [
          Hero(
            tag: 'box_shoe_${shoe.name}',
            child: Container(
              width: 256,
              padding: const EdgeInsets.only(left: 24, top: 32),
              decoration: BoxDecoration(
                color: shoe.backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: const TextStyle(
                      fontFamily: FontsFamily.gothamBold,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    shoe.price,
                    style: TextStyle(
                      fontFamily: FontsFamily.avalonRegular,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 1,
                    height: 168,
                    color: Colors.white.withOpacity(0.7),
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
            right: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: 'image_shoe_${shoe.name}',
                child: Transform.rotate(
                  angle: -math.pi / 7,
                  child: Image.asset(
                    Environment.imageAssets + shoe.image,
                    width: 250,
                    height: 280,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
