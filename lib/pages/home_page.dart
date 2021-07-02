import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/models/city.dart';
import 'package:flutter_bwa_cozy/theme.dart';
import 'package:flutter_bwa_cozy/widgets/city_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: edge),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Explore Now', 
                    style: blackTextStyle.copyWith(
                      fontSize: 24
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Mencari kosan yang cozy', 
                    style: greyTextStyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Popular Cities', 
                    style: blackRegularTextStyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 24,
                      ),
                      CityCard(
                        City(
                          id: 1,
                          name: 'Jakarta',
                          imageUrl: 'assets/images/city1.png',
                          isPopular: true
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        City(
                          id: 2,
                          name: 'Bandung',
                          imageUrl: 'assets/images/city2.png',
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        City(
                          id: 3,
                          name: 'Surabaya',
                          imageUrl: 'assets/images/city3.png',
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ),
    );
  }
}