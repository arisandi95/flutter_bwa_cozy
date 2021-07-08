import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/theme.dart';

class FacilityItem extends StatelessWidget {
  // const FacilityItem({Key? key}) : super(key: key);
  final String name;
  final String imageUrl;
  final int total;

  FacilityItem({this.imageUrl = '', this.name = '', this.total = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich( 
          TextSpan(
            text: ' $total',
            style: purpleTextStyle.copyWith(
              fontSize: 14
            ),
            children: [
              TextSpan(
                text: ' $name',
                style: greyTextStyle.copyWith(
                  fontSize: 14
                ),
              )
            ]
          )
        ),
      ],
    );
  }
}