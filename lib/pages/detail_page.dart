import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/models/space.dart';
import 'package:flutter_bwa_cozy/pages/error_page.dart';
import 'package:flutter_bwa_cozy/theme.dart';
import 'package:flutter_bwa_cozy/widgets/facility_item.dart';
import 'package:flutter_bwa_cozy/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  // DetailPage({Key? key}) : super(key: key);

  final Space space;
  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>  {
  bool wishlistActive = false;

  void _handleTapWishlistBtn() {
    setState(() {
      wishlistActive = !wishlistActive;
    });
  }

  @override
  Widget build(BuildContext context) {

    launchUrl(String urlString) async{
      if(await canLaunch(urlString)){
        launch(urlString);
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ErrorPage()
        ));
      }
    }

    Future<void> showConfirmation() async{
      return showDialog(
        context: context, 
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Kamu ingin menghubungi pemilik property?'),
          content: const Text('Pastikan kamu memiliki pulsa yang cukup'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: (){
                launchUrl('tel:${widget.space.phone}');
              },
              child: const Text('Hubungi'),
            ),
          ]
        )
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
           
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    ),
                    color: whiteColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ////NOTE : TITLE
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22
                                  )
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich( 
                                  TextSpan(
                                    text: '\$ ${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16
                                        ),
                                      )
                                    ]
                                  )
                                ),

                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((item){
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: item,
                                    rating: widget.space.rating
                                  )
                                );
                              }).toList(),
                            )
                          ]
                        ),
                      ),

                      //NOTE : MAIN FACILITIES
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities', 
                          style: blackRegularTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              imageUrl: 'assets/images/001-bar-counter.png',
                              name : 'kitchen',
                              total: widget.space.numberOfKitchens
                            ),
                            FacilityItem(
                              imageUrl: 'assets/images/002-double-bed.png',
                              name : 'bed',
                              total: widget.space.numberOfBedrooms
                            ),
                            FacilityItem(
                              imageUrl: 'assets/images/003-cupboard.png',
                              name : 'cupboard',
                              total: widget.space.numberOfCupboards
                            ),
                          ],
                        ),
                      ),

                      ///////////////// PHOTOS
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos', 
                          style: blackRegularTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: 
                            widget.space.photos.map((item){
                               return Container(
                                 margin: EdgeInsets.only(left: edge),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(16),
                                   child:  Image.network(
                                      item,
                                      height: 88,
                                      width: 110,
                                      fit: BoxFit.cover
                                    ),
                                 )
                               );
                            }).toList(),
                        ),
                      ),


                      /////////////////// Location
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location', 
                          style: blackRegularTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address} \n${widget.space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: (){
                                launchUrl(widget.space.mapUrl);
                                // launchUrl('XXXXXXXX');
                              },
                              child: Image.asset('assets/images/map.png', width: 40),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge
                        ), 
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: (){
                            showConfirmation();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18
                            ),
                          ),
                        )
                      ),
                      SizedBox(
                        height: 40,
                      ),

                    ],
                  ),
                )
              ],
            ),

             Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: _handleTapWishlistBtn,
                    child: Image.asset(
                      (wishlistActive) ? 'assets/images/btn_wishlist_active.png' : 'assets/images/btn_wishlist.png',
                      width: 40,
                    ),
                  )
                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}