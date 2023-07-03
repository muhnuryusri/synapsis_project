import 'package:flutter/material.dart';
import 'package:synapsis_project/color_constants.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final IconData icon;
  final String contentTitle;
  final String contentDescription;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.icon,
    required this.contentTitle,
    required this.contentDescription,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ColorConstants.primaryFontColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.mainColor,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            contentTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ColorConstants.primaryFontColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            contentDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorConstants.secondaryFontColor,
            ),
          ),
        ],
      ),
    );
  }
}
