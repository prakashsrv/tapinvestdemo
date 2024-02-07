import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest1/ui/purchasingPage.dart';
import 'package:tapinvest1/utils/tapinvest_theme.dart';

class InvestmentDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 84,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    'Filled',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: MyColor.textgrey),
                  ),
                  Text(
                    '30%',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: MyColor.bgIconBlack),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                  primary: MyColor.tigreen, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: (){
                  HapticFeedback.heavyImpact();
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PurchaseScreen()),);

                },child: Text("Tap to Invest"),),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Back to Deals',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: MyColor.tigreen)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 20,),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColor.bgDarkGrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 16),
              height: 90,
              width: 90,
              child: Image.asset('assets/image/tapinvest.jpeg'), // Replace with your asset image
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Wrap(
                children:[
                  Text(
                    'Agrizy ← ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: MyColor.bgIconBlack),
                  ),
                  Text(
                    'Keshav Industries',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: MyColor.textgrey),
                  ),
                ]


              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Agrizy offers solutions across digital vendor management, and supply and value chainauto...',
                style: TextStyle(fontSize: 14,color: MyColor.textgrey),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MyColor.bgGrey,
                  border: Border.all(
                    color: MyColor.bgGrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: GridView.count(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2,
                children: <Widget>[
                  InvestmentDetailCard(title: 'MIN INVT', value: '₹ 1 Lakh'),
                  InvestmentDetailCard(title: 'TENURE', value: '61 days'),
                  InvestmentDetailCard(title: 'NET YIELD', value: '13.23 %'),
                  InvestmentDetailCard(title: 'RAISED', value: '70 %'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Clients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                  Row(
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text('Google')),
                    )),
                  ),
                  Text('Backed by', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                  Row(
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text('Google')),
                    )),
                  ),
                  SizedBox(height: 36),

                  Text('Highlights', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),

                  HorizontalListView(),
                  SizedBox(height: 16),

                ],
              ),
            ),

KeyMetricsTabs(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: MyColor.bgGrey,
                    border: Border.all(
                      color: MyColor.bgGrey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),),
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    children: <Widget>[
                      InvestmentDetailCard(title: 'ACTIVE DEALS', value: '6 of 18'),
                      InvestmentDetailCard(title: 'RAISED', value: '₹ 6.94 Cr'),
                      InvestmentDetailCard(title: 'MATURED DEALS', value: '12 of 18'),
                      InvestmentDetailCard(title: 'ON TIME PAYMENT', value: '100 %'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(margin:EdgeInsets.only(left: 16), child: Text('Documents', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(0),
                  child: DocumentCard(
                    icon: Icons.description,
                    title: 'Invoice Discounting Contract',
                    subtitle: 'All the legalese surrounding this deal and how it relates to you.',
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: DocumentCard(
                    icon: Icons.present_to_all,
                    title: 'Company Pitch Deck',
                    subtitle: 'Read more about the company and see how they pitch to investors.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  final List<String> entries = [
    'Agrizy was founded in 2021 by Vicky Dani and Saket Chirania to provide an end-to-end solution to the agri processing market.',
    'Agrizy was founded in 2021 by Vicky Dodani and Saket Chirania to provide an end-to-end solution to the agri processing market.',

    // Add more entries here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // You can adjust height to fit your content
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                  color: MyColor.bgGrey,
                  border: Border.all(
                    color: MyColor.bgGrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              width: 300, // Set a fixed width for each card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.lightbulb_outline),
                    SizedBox(height: 8),
                    Text(
                      entries[index],
                      style: TextStyle(fontSize: 14),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InvestmentDetailCard extends StatelessWidget {
  final String title;
  final String value;

  const InvestmentDetailCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            color: MyColor.bgWhite,
            border: Border.all(
              color: MyColor.bgWhite,
            ),
            boxShadow: [
              BoxShadow(color: MyColor.bgGrey, spreadRadius: 3),
            ],
            borderRadius: BorderRadius.all(Radius.circular(2))
        ),
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class KeyMetricsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Metrics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleButtons(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('FUNDING'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('TRACTION'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('FINANCIALS'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('COMPETITION'),
                ),
              ],
              onPressed: (int index) {
                // handle toggle button logic
                HapticFeedback.heavyImpact();
              },
              isSelected: [false, false, true, false], // Mark 'FINANCIALS' as selected
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              children: <Widget>[
                MetricCard(title: 'ACTIVE DEALS', value: '6 of 18'),
                MetricCard(title: 'RAISED', value: '₹ 6.94 Cr'),
                MetricCard(title: 'MATURED DEALS', value: '12 of 18'),
                MetricCard(title: 'ON TIME PAYMENT', value: '100 %'),
              ],
            ),
            SizedBox(height: 20),
            Text('Documents', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DocumentCard(
              icon: Icons.description,
              title: 'Invoice Discounting Contract',
              subtitle: 'All the legalese surrounding this deal and how it relates to you.',
            ),
            DocumentCard(
              icon: Icons.present_to_all,
              title: 'Company Pitch Deck',
              subtitle: 'Read more about the company and see how they pitch to investors.',
            ),
          ],
        ),
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;

  const MetricCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const DocumentCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: MyColor.bgWhite,
            border: Border.all(
              color: MyColor.bgWhite,
            ),
            boxShadow: [
              BoxShadow(color: MyColor.bgDarkGrey, spreadRadius: 1),
            ],
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),




      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: MyColor.bgGrey,
                  border: Border.all(
                    color: MyColor.bgGrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Icon(icon, size: 25)),
          SizedBox(height: 24,),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8,),
          Text(subtitle, style: TextStyle(fontWeight: FontWeight.normal)),
        ],
      )
    );
  }


}

class KeyMetricsTabs extends StatefulWidget {
  @override
  _KeyMetricsTabsState createState() => _KeyMetricsTabsState();
}

class _KeyMetricsTabsState extends State<KeyMetricsTabs> {
  int _selectedIndex = 2; // Assuming 'FINANCIALS' is initially selected

  final List<String> _tabs = ['FUNDING', 'TRACTION', 'FINANCIALS', 'COMPETITION'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Key Metrics',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        Container(
          height: 50, // Adjust height according to your design
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _tabs.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  margin: EdgeInsets.only(left: 18),
                  child: ChoiceChip(
                    label: Text(_tabs[index]),
                    selected: _selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedIndex = selected ? index : _selectedIndex;
                      });
                    },
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: _selectedIndex == index ? Colors.white : Colors.black,
                    ),
                    backgroundColor: MyColor.bgDarkGrey2,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}