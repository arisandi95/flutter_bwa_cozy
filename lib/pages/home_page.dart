import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/models/city.dart';
import 'package:flutter_bwa_cozy/models/space.dart';
import 'package:flutter_bwa_cozy/models/tips.dart';
import 'package:flutter_bwa_cozy/theme.dart';
import 'package:flutter_bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:flutter_bwa_cozy/widgets/city_card.dart';
import 'package:flutter_bwa_cozy/widgets/space_card.dart';
import 'package:flutter_bwa_cozy/widgets/tips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),

              // NOTE : TITLE / HEADER
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


              // NOTE : POPULAR CITY
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
              ),
              SizedBox(
                height: 30,
              ),


              // NOTE : RECOMMENDED SPACES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recommended Space', 
                  style: blackRegularTextStyle.copyWith(
                    fontSize: 16
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    SpaceCard(
                      Space(
                        id: 1,
                        name : 'Sands Hostel',
                        imageUrl: 'assets/images/space1.png',
                        price : 52,
                        city : 'Jakarta',
                        country : 'Indonesia',
                        rating : 4                     
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    SpaceCard(
                      Space(
                        id: 2,
                        name : 'Sands Hostel 2',
                        imageUrl: 'assets/images/space2.png',
                        price : 82,
                        city : 'Jakarta',
                        country : 'Indonesia',
                        rating : 3                     
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    SpaceCard(
                      Space(
                        id: 3,
                        name : 'Sands Hostel 3',
                        imageUrl: 'assets/images/space3.png',
                        price : 990,
                        city : 'Jakarta',
                        country : 'Indonesia',
                        rating : 5                    
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // NOTE : TIPS AND GUIDANCE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Guidance', 
                  style: blackRegularTextStyle.copyWith(
                    fontSize: 16
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    TipsCard(
                      Tips(
                        id: 1,
                        title: 'City Guidelines',
                        imageUrl: 'assets/images/tips1.png',
                        updatedAt: '16 Oktober'
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(
                      Tips(
                        id: 2,
                        title: 'City Guidelines',
                        imageUrl: 'assets/images/tips2.png',
                        updatedAt: '29 September'
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70 + edge,
              ),

              
            ],
          )
        ),

        //BOTTOM NAVBAR
        floatingActionButton: 
        Container(
          height: 65,
          width: MediaQuery.of(context).size.width - (2 * edge),
          margin: EdgeInsets.symmetric(
            horizontal: edge
          ),
          decoration: BoxDecoration(
            color : Color(0xffF6F7F8),
            borderRadius: BorderRadius.circular(23)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_home_solid.png',
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_mail_solid.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_card_solid.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_love_solid.png',
                isActive: false,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}