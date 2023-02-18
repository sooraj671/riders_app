import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class EarningsPage extends StatefulWidget {
  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage>
    with TickerProviderStateMixin {
  String currencyDropdownValue = "Last 7 Days";

  @override
  void initState() {
    super.initState();
  }

  Widget _getEarnings() {
    return BezierChart(
      bezierChartScale: BezierChartScale.CUSTOM,
      xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
      series: const [
        BezierLine(
          data: const [
            DataPoint<double>(value: 10, xAxis: 0),
            DataPoint<double>(value: 130, xAxis: 5),
            DataPoint<double>(value: 50, xAxis: 10),
            DataPoint<double>(value: 150, xAxis: 15),
            DataPoint<double>(value: 75, xAxis: 20),
            DataPoint<double>(value: 0, xAxis: 25),
            DataPoint<double>(value: 5, xAxis: 30),
            DataPoint<double>(value: 45, xAxis: 35),
          ],
        ),
      ],
      config: BezierChartConfig(
        displayYAxis: true,
        xLinesColor: Colors.orange,
        verticalIndicatorStrokeWidth: 3.0,
        verticalIndicatorColor: Colors.red,
        showVerticalIndicator: true,
        backgroundColor: Colors.lightGreen,
        snap: false,
      ),
    );
  }

  Widget _getOrders() {
    return BezierChart(
      bezierChartScale: BezierChartScale.CUSTOM,
      xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
      series: const [
        BezierLine(
          data: const [
            DataPoint<double>(value: 10, xAxis: 0),
            DataPoint<double>(value: 130, xAxis: 5),
            DataPoint<double>(value: 50, xAxis: 10),
            DataPoint<double>(value: 150, xAxis: 15),
            DataPoint<double>(value: 75, xAxis: 20),
            DataPoint<double>(value: 0, xAxis: 25),
            DataPoint<double>(value: 5, xAxis: 30),
            DataPoint<double>(value: 45, xAxis: 35),
          ],
        ),
      ],
      config: BezierChartConfig(
        displayYAxis: true,
        xLinesColor: Colors.orange,
        verticalIndicatorStrokeWidth: 3.0,
        verticalIndicatorColor: Colors.red,
        showVerticalIndicator: true,
        backgroundColor: Colors.orangeAccent,
        snap: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earnings", style: TextStyle(color: kPrimaryColor),),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "WITHDRAW",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            )),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 140.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Earnings Rs.12000",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Analytics",
                style: TextStyle(
                  color: kPrimaryColor,
                   fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            Divider(),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Earning this month"),
                      Text(
                        "Rs. 17000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("On going orders"),
                      Row(
                        children: <Widget>[
                          Text(
                            "3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "(Rs. 5025)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Available for withdrawal"),
                      Text(
                        "Rs. 10000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Completed orders"),
                      Row(
                        children: <Widget>[
                          Text(
                            "2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "(Rs. 4000)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Revenues",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Pending clearance",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rs. 2000",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total Withdrawn",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rs. 15000",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
