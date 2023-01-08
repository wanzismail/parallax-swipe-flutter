import 'dart:ui';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:parallax_swipe/constants/environment.dart';
import 'package:parallax_swipe/models/shoe_model.dart';
import 'package:parallax_swipe/pages/detail_page.dart';
import 'package:parallax_swipe/themes/app_colors.dart';
import 'package:parallax_swipe/themes/fonts_family.dart';
import 'package:parallax_swipe/widgets/shoe_card.dart';
import 'package:parallax_swipe/widgets/snapping_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List varian produk
  final List<String> _shoeVariants = [
    'All',
    'Air Max',
    'Presto',
    'Huarache',
    'Mercurial',
  ];

  int _selectedVariantValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // Membuat AppBar atau Toolbar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      elevation: 0,
      // Menambahkan ikon kembali pada AppBar
      leading: InkWell(
        child: const Icon(Icons.arrow_back),
        onTap: () => debugPrint('Icon Back Clicked!'),
      ),
      actions: [
        // Menambahkan ikon pencarian pada AppBar
        Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            child: Image.asset(
              '${Environment.iconAssets}ic_search.png',
              width: 20,
              height: 20,
            ),
            onTap: () => debugPrint('Icon Search Clicked!'),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitlePage(),
            _buildVariants(),
            _buildCarousel(),
            _buildTitleOptions(),
            _buildDivider(),
            _buildOptionList(),
          ],
        ),
      ),
    );
  }

  // Membuat title 'Shoes'
  Widget _buildTitlePage() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Shoes',
        style: TextStyle(
          fontFamily: FontsFamily.avalonBold,
          fontSize: 26,
          color: AppColors.textPrimaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // Membuat pilihan varian produk
  Widget _buildVariants() {
    return ChipsChoice<int>.single(
      value: _selectedVariantValue,
      onChanged: (val) => setState(() => _selectedVariantValue = val),
      choiceItems: C2Choice.listFrom<int, String>(
        source: _shoeVariants,
        value: (i, v) => i,
        label: (i, v) => v,
        tooltip: (i, v) => v,
      ),
      choiceStyle: C2ChipStyle.toned(
        borderStyle: BorderStyle.solid,
        borderWidth: 1,
        borderColor: AppColors.chipBorderColor,
        backgroundAlpha: 10,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        foregroundStyle: const TextStyle(
          fontSize: 14,
          fontFamily: FontsFamily.avalonRegular,
          color: AppColors.chipSelectedColor,
        ),
        backgroundColor: AppColors.chipSelectedColor,
        selectedStyle: const C2ChipStyle(
          foregroundStyle: TextStyle(
            fontSize: 14,
            fontFamily: FontsFamily.avalonBold,
            color: Colors.white,
          ),
          backgroundAlpha: 500,
          backgroundColor: AppColors.chipSelectedColor,
          foregroundColor: AppColors.chipSelectedColor,
        ),
      ),
    );
  }

  // Membuat carousel slider produk
  Widget _buildCarousel() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 32),
      height: 305,
      child: SnappingListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: carouselItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ShoeCard(shoe: carouselItems[index]),
            onTap: () {
              _goToDetail(carouselItems[index]);
            },
          );
        },
        itemExtent: 300,
      ),
    );
  }

  // Membuat title informasi pilihan yang tersedia
  Widget _buildTitleOptions() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '243 OPTIONS',
        style: TextStyle(
          fontFamily: FontsFamily.avenirRoman,
          fontSize: 12,
          color: AppColors.textPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: AppColors.dividerColor,
      height: 2,
    );
  }

  // Membuat list pilihan produk
  Widget _buildOptionList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => _buildDivider(),
        itemCount: optionItems.length,
        itemBuilder: (context, index) => Row(
          children: [
            Image.asset(
              Environment.imageAssets + optionItems[index].image,
              width: 135,
              height: 135,
            ),
            const SizedBox(width: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  optionItems[index].name,
                  style: const TextStyle(
                      fontFamily: FontsFamily.gothamMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimaryColor),
                ),
                const SizedBox(height: 8),
                Text(
                  optionItems[index].price,
                  style: TextStyle(
                    fontFamily: FontsFamily.avenirRoman,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimaryColor.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _goToDetail(ShoeModel shoe) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailPage(shoe: shoe),
    ));
  }
}
