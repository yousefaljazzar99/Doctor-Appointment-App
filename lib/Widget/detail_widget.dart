import 'package:doctor_app/Widget/he_color.dart';
import 'package:flutter/material.dart';

class detail_widget extends StatelessWidget {
  final String title;
  final String subTitle;

  const detail_widget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: HexColor('#FFE1E2'),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 61,
              height: 31,
              decoration: BoxDecoration(
                color: HexColor('#FFE1E2'),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(16)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: HexColor('#CB333B'),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: HexColor('#696969'),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
