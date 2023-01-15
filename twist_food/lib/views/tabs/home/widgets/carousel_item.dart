import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:twist_food/data/models/discounts/discounts_model.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class CarouselDiscountItem extends StatefulWidget {
  final List<DiscountsModel> discountData;
  const CarouselDiscountItem({super.key, required this.discountData});

  @override
  State<CarouselDiscountItem> createState() => _CarouselDiscountItemState();
}

class _CarouselDiscountItemState extends State<CarouselDiscountItem> {
  final controller = CarouselController();

  int activeIndex = 0;
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.discountData
        .map(
          (e) => Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            width: 400,
            decoration: BoxDecoration(
                color: TwistColor.C_53E88B,
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: e.imagePath!,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 25,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        e.price.toString(),
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
                        e.discountName!,
                        style: TwistStyles.w500
                            .copyWith(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider(
              items: imageSlider,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.discountData.map((e) {
              int index = widget.discountData.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeIndex == index
                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                      : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
