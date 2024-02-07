import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:tapinvest1/utils/tapinvest_theme.dart';
import 'dealDetailsPage.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

class PurchaseScreen extends StatefulWidget {
  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  int amt = 0;
  bool isFinished =false;

  // Reactive variables
  var enteredAmount = 0.0;
  var totalReturns = 0.0;
  var netYield = 13.11; // Assuming a fixed net yield for the example
  var tenureDays = 61; // Assuming

  double principal = 0.0;
  double rate = 1.0; // Convert percentage to a decimal
  double time = 1.0; // Convert tenure to years

  void calculateTotalReturns() {
    // Simple interest formula for demonstration: A = P(1 + rt)
    // where P is the principal amount, r is the rate of interest per year, and t is time period in years
     principal = enteredAmount;
     rate = enteredAmount / 100; // Convert percentage to a decimal
     time = enteredAmount /20; // Convert tenure to years

    totalReturns = principal + principal /100;
    setState(() {

    });
  }// a fixed tenure for the example

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Purchasing', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
            Text(
              'Agrizy ← Keshav Industries',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Center(
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(7),
                  ],
                onChanged: (String a){
                  setState(() {
                    enteredAmount = double.parse(a);
                    calculateTotalReturns();
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Amount',
                  prefixText: '₹ ',
                  suffixText: 'Min 50,000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 60.0),
            Row(
              children: [
                Text(
                  'Total Returns',
                  style: TextStyle(fontSize: 12.0),
                ),
                Spacer(),
                Text(
                  '${totalReturns}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              color: MyColor.bgGrey,
              height: 2,
              width: double.infinity,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Net Yield IRR', style: TextStyle(fontSize: 12.0)),
                Text('${rate}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              color: MyColor.bgGrey,
              height: 2,
              width: double.infinity,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Tenure', style: TextStyle(fontSize: 12.0)),
                Text('${time}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      
              ],
            ),
            Spacer(),
            SizedBox(height: 180.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Balance: ₹1,00,000', style: TextStyle(fontSize: 16.0)),
                Text( 'Required : ${enteredAmount+10}', style: TextStyle(fontSize: 16.0)),
              ],
            ),
            Spacer(),
            SwipeButton(
              borderRadius: BorderRadius.circular(8),
              activeTrackColor: MyColor.bgGrey,
              inactiveThumbColor: MyColor.tigreen,
              activeThumbColor: MyColor.tigreen,
              height: 60,
              child: Text(
                "Swipe to Pay",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              onSwipe: () {
                HapticFeedback.heavyImpact();
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvestmentDetailPage()),*/
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    isFinished = true;
                  });
                });
                Navigator.push(context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: PaymentDonePage()));
      
      
              },
            )
      
      
      
         /* SwipeableButtonView(
      buttonText: 'SLIDE TO PAYMENT',
        buttonWidget: Container(
          child: Icon(Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
          ),),
        activeColor: Color(0xFF009C41),
        isFinished: isFinished,
        onWaitingProcess: () {
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              isFinished = true;
            });
          });
        },
        onFinish: () async {
          await Navigator.push(context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: PaymentDonePage()));
      
          //TODO: For reverse ripple effect animation
          setState(() {
            isFinished = false;
          });
        },
      )*/
          ],
        ),
      ),
    );
  }
}

class PaymentDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900], // Adjust color to match your design
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                child: Lottie.asset('assets/image/flow1.json')),

            Positioned(
              top: 150.0,
              right: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24.0),
                  Icon(
                    Icons.check_circle, // Use an icon that matches the check mark in your image
                    size: 100.0, // Adjust size accordingly
                    color: Colors.white,
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Payment done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
