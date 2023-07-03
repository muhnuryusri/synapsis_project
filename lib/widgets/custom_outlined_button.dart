import 'package:flutter/material.dart';

import '../color_constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        backgroundColor: ColorConstants.containerColor,
        foregroundColor: ColorConstants.mainColor,
        elevation: 0,
        side: BorderSide(width: 1, color: ColorConstants.strokeColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Text(
            text,
            style: TextStyle(
              color: ColorConstants.primaryFontColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 25,
          )
        ],
      ),
    );
  }
}
