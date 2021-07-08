import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/pages/home_page.dart';
import 'package:flutter_bwa_cozy/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/404.png',
                width: 300
              ),
              SizedBox(
                height: 70,
              ),
              Text('Where Are U Going ?', style: blackTextStyle.copyWith(fontSize: 24)),
              SizedBox(
                height: 14,
              ),
              Text(
                'seems like the page thah you were \nrequested is already gone', 
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: edge
                ), 
                height: 50,
                width: MediaQuery.of(context).size.width - (8 * edge),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => HomePage()
                    ), (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)
                    ),
                  ),
                  child: Text(
                    'Back To Home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                )
              ),

            ],
          ),
        ) 
      )
    );
  }
}