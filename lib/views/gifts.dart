import 'package:flutter/material.dart';
import 'package:printaskwela/styles.dart';
import 'package:url_launcher/url_launcher.dart';

//@TODO: Volunteer on same page but swipe

class GiftsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 80.0,
          backgroundColor: Colors.cyan[400],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text('Donate'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        // padding: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          right: 12.0,
                          bottom: 0,
                          left: 12.0,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.favorite_border_outlined),
                          title: Text(
                            '₱100 Goes a Long Way',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              'With your donation, Printa Skwela will be able to procure printers, paper reams, and other school supplies needed by the teachers to create education modules. The modules would be distributed to students who otherwise couldn’t afford a decent online learning setup.'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  'Donation channels',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: PaymentCard(
                  title: 'GCash',
                  iconPath: gcashIconPath,
                  accountName: 'Fidel Ricafranca',
                  accountNumber: '0961 803 4165',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: PaymentCard(
                  title: 'BPI',
                  iconPath: bpiIconPath,
                  accountName: 'Bridgette Marie Angcon',
                  accountNumber: '1199 7330 91',
                  logoColor: Colors.amber[50],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: PaypalPaymentCard(),
              ),
              Center(
                child: Text(
                  'Thank you!',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  final Color logoColor;
  final title;
  final iconPath;
  final accountName;
  final accountNumber;
  final logoWidth;
  final logoHeight;

  PaymentCard({
    @required this.title,
    @required this.iconPath,
    @required this.accountName,
    @required this.accountNumber,
    this.logoColor = const Color(0xFFE1F5FE),
    this.logoWidth = 100.0,
    this.logoHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      color: logoColor,
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(iconPath),
                  )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 14.0,
                bottom: 14.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        accountName,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        accountNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.copy_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaypalPaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ppIconPath),
                  ),
                ),
              ),
              onTap: _launchPaypal,
            ),
          ),
          Center(child: Text('paypal.me/printaskwela')),
        ],
      ),
    );
  }

  void _launchPaypal() async {
    const url = 'https://paypal.me/printaskwela/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
