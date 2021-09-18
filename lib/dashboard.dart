import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body:
            ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
          SizedBox(
            height: 70,
          ),
          ListTile(
            title: Text(
              '👋 Kyle',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: (Platform.isIOS || Platform.isMacOS)
                      ? CupertinoTheme.of(context).textTheme.textStyle.color
                      : Theme.of(context).textTheme.subtitle1!.color,
                  fontSize: (Platform.isIOS || Platform.isMacOS)
                      ? CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .fontSize
                      : Theme.of(context).textTheme.headline6!.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.chat_bubble_outline_rounded,
                color: (Platform.isIOS || Platform.isMacOS)
                    ? CupertinoTheme.of(context).textTheme.textStyle.color
                    : Theme.of(context).textTheme.subtitle1!.color),
          ),
          Divider(),
          ListTile(
            title: Text(
              '\$2,264.84',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: (Platform.isIOS || Platform.isMacOS)
                      ? CupertinoTheme.of(context).textTheme.textStyle.color
                      : Theme.of(context).textTheme.subtitle1!.color,
                  fontSize: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle
                          .fontSize! *
                      1.5,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Total Balance'),
            trailing: TextButton(onPressed: () {}, child: Text('Add a card')),
          ),
          // cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              creditCards('1159.49', 'mastercard.png', '**** 7628',
                  [Colors.tealAccent, Colors.teal], [0.01, 0.6]),
              creditCards('1159.49', 'visa.png', '**** 5684',
                  [Colors.lightBlueAccent, Colors.blue], [0.1, 0.45]),
            ],
          ),
          Padding(
            //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text(
              'Send Money',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: (Platform.isIOS || Platform.isMacOS)
                      ? CupertinoTheme.of(context).textTheme.textStyle.color
                      : Theme.of(context).textTheme.subtitle1!.color,
                  fontSize: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle
                          .fontSize! *
                      1.1),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, top: 8),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                    child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0,
                        children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Container(
                          height: 60,
                          width: 60,
                          color: CupertinoColors.lightBackgroundGray,
                          child: Icon(
                            Icons.person_add_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      sendMoneyPic('person3.png'),
                      sendMoneyPic('person6.png'),
                      sendMoneyPic('person4.png'),
                      sendMoneyPic('person2.png'),
                      sendMoneyPic('person1.png'),
                      sendMoneyPic('person5.png'),
                    ])),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                'Transfer',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Recieve',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )))
          ]),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Savings',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: (Platform.isIOS || Platform.isMacOS)
                                ? CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .color
                                : Theme.of(context).textTheme.subtitle1!.color,
                            fontSize: CupertinoTheme.of(context)
                                    .textTheme
                                    .navTitleTextStyle
                                    .fontSize! *
                                1.1)),
                    Text('See All',
                        style: Theme.of(context).textTheme.subtitle2)
                  ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              savingsWidget('Car', '\$7,374 / 25,000', Icons.car_rental_rounded,
                  Colors.teal, 0.3, Colors.tealAccent),
              savingsWidget(
                  'Poerto Rico',
                  '\$15,495 / 32,000',
                  Icons.airplane_ticket_rounded,
                  Colors.amberAccent,
                  0.5,
                  Colors.orangeAccent),
            ],
          ),
        ]));
  }

  Widget sendMoneyPic(imageName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Image.asset(
        'assets/$imageName',
        height: 60.0,
        width: 60.0,
      ),
    );
  }

  Widget savingsWidget(title, subtitle, icon, iconColor, progress, colour) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(children: [
          ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                      color: colour, borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    icon,
                    size: 40,
                    color: iconColor,
                  )),
              title: Text(title),
              subtitle: Text(subtitle,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.subtitle2!.fontSize! /
                              1.3))),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: LinearProgressIndicator(
                color: iconColor,
                backgroundColor: colour,
                value: progress,
              ))
        ]));
  }

  Widget creditCards(title, imageName, subtitle, colorsList, stop) {
    return Container(
        height: 180,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: stop,
                colors: colorsList)),
        child: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/$imageName',
                height: 50,
                width: 80,
              )),
          SizedBox(height: 30),
          ListTile(
            title: Text(title,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            subtitle: Text(subtitle, style: TextStyle(color: Colors.white54)),
          )
        ]));
  }
}
