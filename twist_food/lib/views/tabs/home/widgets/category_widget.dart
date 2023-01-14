import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twist_food/utils/colors.dart';

class CategoryItemButton extends StatelessWidget {
  const CategoryItemButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isActive = false,
    this.imageUrl = '',
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final bool isActive;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: (isActive)
            ? TwistColor.C_53E88B
            : TwistColor.C_F9A84D.withOpacity(0.5),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          foregroundColor: (isActive) ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Center(
          child: imageUrl.isEmpty
              ? Text(
                  buttonText,
                  style: TextStyle(
                    color: (isActive) ? Colors.black : TwistColor.C_DA6317,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.scaleDown,
                      width: 30,
                      height: 20,
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).splashColor,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.blueGrey),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 2),
                    Text(
                      buttonText,
                      style: TextStyle(
                        color: (isActive) ? Colors.white : TwistColor.C_53E88B,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
