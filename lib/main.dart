import 'package:flutter/material.dart';
import 'package:tapinvest1/ui/dealDetailsPage.dart';
import 'package:tapinvest1/ui/purchasingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenge',
      home: Scaffold(
        body: InvestmentDetailPage(),
      ),
    );
  }
}
