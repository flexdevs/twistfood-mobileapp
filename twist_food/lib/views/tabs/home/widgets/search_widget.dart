import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.searchController,
    required this.searchFocusNode,
  }) : super(key: key);

  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: TwistColor.C_F9A84D.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 21,
          ),
          SvgPicture.asset(
            TwistIcons.search,
            width: 22,
            height: 22,
            color: TwistColor.C_DA6317,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              cursorColor: TwistColor.C_09051C,
              onChanged: (value) {},
              controller: searchController,
              focusNode: searchFocusNode,
              textInputAction: TextInputAction.done,
              style: TwistStyles.w400.copyWith(
                fontSize: 16,
                color: TwistColor.C_09051C,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "What do you want to order ?",
                hintStyle: TwistStyles.w600.copyWith(
                  fontSize: 16,
                  color: TwistColor.C_DA6317.withOpacity(0.4),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
