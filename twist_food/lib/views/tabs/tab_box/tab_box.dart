import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/tabs/basket/basket_view.dart';
import 'package:twist_food/views/tabs/home/home_view.dart';
import 'package:twist_food/views/tabs/orders/orders_view.dart';
import 'package:twist_food/views/tabs/profile/profile_view.dart';

import 'bottomnavybar.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodySection(),
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

// * Body Section Components
  bodySection() {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const BascketView();
      case 2:
        return const OrderView();
      case 3:
        return const ProfileViw();
    }
  }

// * BottomNavigationBar Section Components
  customBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: BottomNavyBar(
        containerHeight: 74,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: index,
        itemCornerRadius: 16,
        items: [
          BottomNavyBarItem(
            title: Text('Home',
                style: TwistStyles.w400
                    .copyWith(fontSize: 16, color: TwistColor.C_09051C)),
            icon: SvgPicture.asset(
              TwistIcons.home,
              width: 23,
              height: 23,
              color: TwistColor.C_53E88B,
            ),
            activeColor: TwistColor.primaryColor,
            inactiveColor: TwistColor.C_53E88B,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
              icon: SvgPicture.asset(
                TwistIcons.cart,
                width: 26,
                height: 26,
                color: TwistColor.C_53E88B,
              ),
              title: Text(
                'Cart',
                style: TwistStyles.w400
                    .copyWith(fontSize: 16, color: TwistColor.C_09051C),
              ),
              activeColor: TwistColor.primaryColor,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              TwistIcons.orders,
              width: 22,
              height: 24,
              color: TwistColor.C_53E88B,
            ),
            title: Text('Order',
                style: TwistStyles.w400
                    .copyWith(fontSize: 16, color: TwistColor.C_09051C)),
            activeColor: TwistColor.primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              TwistIcons.profile,
              width: 24,
              height: 22,
              color: TwistColor.C_53E88B,
            ),
            title: Text('Profile',
                style: TwistStyles.w400
                    .copyWith(fontSize: 16, color: TwistColor.C_09051C)),
            activeColor: TwistColor.primaryColor,
            textAlign: TextAlign.center,
          ),
        ],
        onItemSelected: (index) => setState(() => this.index = index),
      ),
    return BottomNavyBar(
      containerHeight: 70,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      selectedIndex: index,  
      items: [
        BottomNavyBarItem(
          title: Text('Home',
              style: TwistStyles.w400
                  .copyWith(fontSize: 16, color: TwistColor.C_09051C)),
          icon: SvgPicture.asset(
            TwistIcons.home,
            color: TwistColor.C_53E88B,
          ),
          activeColor: TwistColor.primaryColor,
          inactiveColor: TwistColor.C_53E88B,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: SvgPicture.asset(
              TwistIcons.cart,
              width: 26,
              height: 26,
              color: TwistColor.C_53E88B,
            ),
            title: Text(
              'Cart',
              style: TwistStyles.w400
                  .copyWith(fontSize: 16, color: TwistColor.C_09051C),
            ),
            activeColor: TwistColor.primaryColor,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: SvgPicture.asset(
            TwistIcons.orders,
            color: TwistColor.C_53E88B,
          ),
          title: Text('Orders',
              style: TwistStyles.w400
                  .copyWith(fontSize: 16, color: TwistColor.C_09051C)),
          activeColor: TwistColor.primaryColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: SvgPicture.asset(
            TwistIcons.profile,
            color: TwistColor.C_53E88B,
          ),
          title: Text('Profile',
              style: TwistStyles.w400
                  .copyWith(fontSize: 16, color: TwistColor.C_09051C)),
          activeColor: TwistColor.primaryColor,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}
