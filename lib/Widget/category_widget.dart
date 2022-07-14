import 'package:doctor_app/Widget/he_color.dart';
import 'package:doctor_app/models/category.dart';
import 'package:flutter/material.dart';

class Category_Widget extends StatelessWidget {
  final Category category;

  const Category_Widget({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: HexColor('#FFE1E2'),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  category.icon,
                  size: 24,
                  color: HexColor('#D5545A'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  category.title,
                  style: TextStyle(
                    color: HexColor('#010101'),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    color: HexColor('#FFE1E2'),
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(10))),
              ),
              Positioned(
                left: 16,
                child: Text(
                  'Specialist',
                  style: TextStyle(
                    color: HexColor('#696969'),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
