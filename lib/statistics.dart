import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final Color barBackgroundColor = Colors.deepPurpleAccent;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Total Balance',
                            style: ThemeData.dark().textTheme.subtitle2),
                        Text('\$859.49',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: CupertinoTheme.of(context)
                                            .textTheme
                                            .navTitleTextStyle
                                            .fontSize! *
                                        1.1,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                    /*ListTile(
                  leading: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('<', style: TextStyle(color: Colors.white))),
                  title: Text('Total Balance',
                      style: Theme.of(context).textTheme.subtitle2),
                  subtitle: Text('\$859.49',
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
                              1.1,
                          fontWeight: FontWeight.bold)),
                ),*/
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text('**** 5684',
                          style: ThemeData.dark().textTheme.subtitle2),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10), child: chart()),
            SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: Column(
                children: [
                  transaction('person1.png', 'Jacob Jordan', 'Recieved', '120'),
                  transaction('person5.png', 'Emma Taylor', 'Recieved', '84'),
                  transaction('person4.png', 'Jake Dobrik', 'Sent', '32'),
                  transaction('person7.png', 'Tim Cook', 'Sent', '48'),
                  transaction('person8.png', 'Jimmy Hartl', 'Recieved', '55'),
                  transaction('person9.png', 'Henry Vargo', 'Sent', '12'),
                  transaction('person10.png', 'Ricky Thielen', 'Sent', '180'),
                  transaction('person6.png', 'Alyson Gorman', 'Recieved', '85'),
                  transaction('person11.png', 'Toby Smith', 'Sent', '55'),
                  transaction('person12.png', 'Casey Weaver', 'Sent', '15'),
                ],
              ),
            ),
          ],
        ));
  }

  Widget transaction(pic, name, status, amount) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.asset(
          'assets/$pic',
          height: 50.0,
          width: 50.0,
        ),
      ),
      title: Text(name),
      subtitle: Text(status),
      trailing:
          Text('$amount USD', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget chart() {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow, width: 1)
              : BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }
}
