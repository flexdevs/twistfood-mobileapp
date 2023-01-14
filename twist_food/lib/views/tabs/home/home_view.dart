import 'package:flutter/material.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twist_food/views/tabs/home/widgets/carouse_loading.dart';
import 'package:twist_food/views/tabs/home/widgets/carousel_item.dart';
import 'package:twist_food/views/tabs/home/widgets/search_widget.dart';

import 'widgets/category_widget.dart';
import 'widgets/home_appbar.dart';
import 'widgets/twotext_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController searchController;
  final smoothController = PageController();
  FocusNode searchFocusNode = FocusNode();
  var selectedIndex = -1;
  var activeIndex = 0;
  final discountImages = [
    TwistIcons.discount1,
    TwistIcons.discount2,
    TwistIcons.discount3,
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          Column(
            children: [
              SearchWidget(
                  searchController: searchController,
                  searchFocusNode: searchFocusNode),
              getCategoryMethod(),
            ],
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                TwoRowTextWidget(
                  onTap: () {},
                  title: 'Speacial Offers',
                ),
                const CarouselDiscountItem(),
                TwoRowTextWidget(
                  onTap: () {},
                  title: 'Popular Menu',
                ),
                ...List.generate(
                  8,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    height: 87,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(
                                1, 3), // changes position of shadow
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(TwistIcons.menu1),
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 21),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Green Noddle",
                                style: TwistStyles.w400.copyWith(
                                  color: TwistColor.C_09051C,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Noodle Home",
                                style: TwistStyles.w400.copyWith(
                                  color: TwistColor.C_3B3B3B.withOpacity(0.3),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "KZT 1500",
                          style: TwistStyles.w400.copyWith(
                            color: TwistColor.C_FEAD1D,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getCategoryMethod() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: 60,
      child: Center(
        child: SizedBox(
          height: 36,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: [
              CategoryItemButton(
                buttonText: "All",
                onPressed: () {
                  selectedIndex = -1;

                  setState(() {});
                },
                isActive: selectedIndex == -1,
              ),
              ...List.generate(
                5,
                (index) {
                  return CategoryItemButton(
                    buttonText: "Soup",
                    onPressed: () {
                      selectedIndex = index;

                      setState(() {});
                    },
                    isActive: selectedIndex == index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
