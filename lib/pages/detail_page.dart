import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:parallax_swipe/constants/environment.dart';
import 'package:parallax_swipe/models/shoe_model.dart';
import 'package:parallax_swipe/themes/app_colors.dart';
import 'package:parallax_swipe/themes/fonts_family.dart';
import 'package:parallax_swipe/widgets/custom_image_chip.dart';
import 'package:parallax_swipe/widgets/custom_text_chip.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final ShoeModel shoe;

  const DetailPage({super.key, required this.shoe});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // List varian produk
  final List<String> _shoeVariants = [
    'img_white_shoe_small.png',
    'img_yellow_shoe_small.png',
    'img_black_shoe_small.png',
  ];

  // List ukuran produk
  final List<String> _shoeSizes = [
    'UK 6',
    'UK 7',
    'UK 8',
    'UK 9',
    'UK 10',
    'UK 11',
    'UK 12',
    'UK 13',
  ];

  int _selectedVariantValue = 1;
  int _selectedSizeValue = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: _buildBody(),
          bottomNavigationBar: _buildAddButton(),
        ),
        _buildAppBar(),
      ],
    );
  }

  // Membuat AppBar atau Toolbar
  Widget _buildAppBar() {
    return SizedBox(
      height: 80,
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        elevation: 0,
        // Menambahkan ikon kembali pada AppBar
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        actions: [
          // Menambahkan ikon favorit pada AppBar
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              onTap: () => debugPrint('Icon Favorite Clicked!'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: -350,
                    left: -10,
                    child: Hero(
                      tag: 'box_shoe_${widget.shoe.name}',
                      child: Container(
                        height: 700,
                        width: 700,
                        decoration: BoxDecoration(
                          color: widget.shoe.backgroundColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 50,
                    child: Hero(
                      tag: 'image_shoe_${widget.shoe.name}',
                      child: Image.asset(
                        Environment.imageAssets + widget.shoe.image,
                        width: 280,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildInfoProduct(),
            const SizedBox(height: 8),
            _buildDescription(),
            const SizedBox(height: 28),
            _buildShoeVariants(),
            const SizedBox(height: 42),
            _buildShoeSizes(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.shoe.name,
            style: const TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 26,
              fontFamily: FontsFamily.avenirBlack,
            ),
          ),
          Text(
            widget.shoe.price,
            style: const TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 18,
              fontFamily: FontsFamily.avalonBold,
            ),
          )
        ],
      ),
    );
  }

  // Membuat deskripsi produk
  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: ReadMoreText(
        lorem(paragraphs: 1, words: 50),
        trimLines: 3,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        style: const TextStyle(
          color: AppColors.textSecondaryColor,
          fontSize: 14,
          fontFamily: FontsFamily.avenirRoman,
        ),
        trimCollapsedText: 'MORE',
        trimExpandedText: '',
        moreStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.textPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        lessStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.textPrimaryColor,
          fontFamily: FontsFamily.avenirMedium,
        ),
      ),
    );
  }

  // Membuat pilihan varian produk
  Widget _buildShoeVariants() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      width: double.infinity,
      child: ChipsChoice<int>.single(
        value: _selectedVariantValue,
        wrapped: true,
        spacing: 16,
        runSpacing: 16,
        padding: EdgeInsets.zero,
        onChanged: (val) => setState(() => _selectedVariantValue = val),
        choiceItems: C2Choice.listFrom<int, String>(
          source: _shoeVariants,
          value: (i, v) => i,
          label: (i, v) => v,
          tooltip: (i, v) => v,
        ),
        choiceBuilder: (item, i) {
          return CustomImageChip(
            path: _shoeVariants[i],
            width: 72,
            height: 64,
            color: AppColors.chipSelectedColor,
            selected: item.selected,
            onSelect: item.select!,
          );
        },
        direction: Axis.horizontal,
      ),
    );
  }

  // Membuat pilihan ukuran produk
  Widget _buildShoeSizes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Size',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textPrimaryColor,
              fontFamily: FontsFamily.avenirBlack,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ChipsChoice<int>.single(
              value: _selectedSizeValue,
              wrapped: true,
              spacing: 16,
              runSpacing: 16,
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              onChanged: (val) => setState(() => _selectedSizeValue = val),
              choiceItems: C2Choice.listFrom<int, String>(
                source: _shoeSizes,
                value: (i, v) => i,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
              choiceBuilder: (item, i) {
                return CustomTextChip(
                  label: item.label,
                  width: 66,
                  height: 40,
                  color: AppColors.chipSelectedColor,
                  selected: item.selected,
                  onSelect: item.select!,
                );
              },
              direction: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  // Membuat button tambah
  Widget _buildAddButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      margin: const EdgeInsets.only(bottom: 24),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: const Text(
          'Add to Bag',
          style: TextStyle(
            fontFamily: FontsFamily.avenirBlack,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
