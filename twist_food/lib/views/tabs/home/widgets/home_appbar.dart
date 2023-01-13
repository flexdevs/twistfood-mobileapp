import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                TwistIcons.profilePhoto,
                width: 45,
                height: 45,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deliver to",
                style: TwistStyles.w400.copyWith(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Tashkent",
                      style: TwistStyles.w500.copyWith(
                        fontSize: 22,
                        color: TwistColor.C_09051C,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(
                      TwistIcons.location,
                      color: TwistColor.primaryColor,
                      width: 18,
                      height: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            width: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0,
                    blurRadius: 0.3)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: SvgPicture.asset(
                TwistIcons.notification,
                color: TwistColor.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
