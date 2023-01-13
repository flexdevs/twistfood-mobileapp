import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';

class CarouselDiscountItem extends StatefulWidget {
  const CarouselDiscountItem({super.key});

  @override
  State<CarouselDiscountItem> createState() => _CarouselDiscountItemState();
}

class _CarouselDiscountItemState extends State<CarouselDiscountItem> {
  final controller = CarouselController();

  final discountImages = [
    TwistIcons.discount1,
    TwistIcons.discount2,
    TwistIcons.discount3,
  ];
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: discountImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = discountImages[index];
              return buildCaruselDiscount(urlImage, index);
            },
            carouselController: controller,
            options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true,
                height: 140,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  discountImages.length,
                  (index) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: activeIndex == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4)),
                      ))
            ],
          )
        ],
      ),
    );
  }

  Widget buildCaruselDiscount(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      width: 400,
      decoration: BoxDecoration(
          color: TwistColor.C_53E88B, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 25,
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "30%",
                  style: TwistStyles.w600
                      .copyWith(fontSize: 55, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Special Deal For\nAugust",
                  style: TwistStyles.w500
                      .copyWith(fontSize: 30, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
