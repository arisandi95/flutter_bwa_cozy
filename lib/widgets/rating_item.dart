import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/theme.dart';

class RatingItem extends StatelessWidget {
  // const RatingItem({Key? key}) : super(key: key);

  final num index;
  final int rating;

  RatingItem({this.index = 0, this.rating = 0});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Icon_star_solid.png',
      color: (index <= rating) ? orangeColor : Color(0xff989BA1),
      // color: Color(0xff989BA1),
      width: 20,
    );
  }
}