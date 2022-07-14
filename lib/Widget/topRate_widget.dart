import 'package:doctor_app/Widget/custom_icons_icons.dart';
import 'package:doctor_app/Widget/he_color.dart';
import 'package:doctor_app/models/doctor.dart';

import 'package:flutter/material.dart';

class TopRateDrWidget extends StatelessWidget {
  final Doctor doctor;

  const TopRateDrWidget({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: HexColor('#404B63').withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageSection(),
          const SizedBox(
            width: 16,
          ),
          _detailsSection(),
        ],
      ),
    );
  }

  Container _imageSection() {
    return Container(
      height: 77,
      width: 90,
      decoration: BoxDecoration(
        color: HexColor('#D5545A'),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/${doctor.image}'),
        ),
      ),
    );
  }

  /// Details Section
  Column _detailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              doctor.rating.toString(),
              style: TextStyle(
                color: HexColor('#929BB0'),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Icon(
              CustomIcons.star,
              color: HexColor('#FFBB23'),
              size: 14,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${doctor.firstName} ${doctor.lastName}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${doctor.type} Specialist',
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
