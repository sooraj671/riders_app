import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/deliveries.dart';
import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riders_app/screens/payment_success/payment_success_screen.dart';

import '../../api/Earnings.dart';

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
          title: Text(
            "Earnings",
            style: TextStyle(color: kPrimaryColor),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: InkWell(
                    onTap: () async {
                      if(availableWithdraw>0){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentSuccessScreen()),
                        );
                      }else{
                        showPopUp("Please earn first");
                      }


                    },
                    child: Text(
                      "WITHDRAW",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    )),
              ),
            )
          ],
        ),
        body: DefaultTabController(
            length: 2,
            child: ListView(children: <Widget>[
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
                              "$availableWithdraw Pkr",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              "Available for Withdraw",
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
                      fontSize: 20),
                ),
              ),
              Divider(),
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Orders Completed"),
                      Text(
                        completedOrdersNum.toString(),
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
                      Text("Total Earnings"),
                      Row(
                        children: <Widget>[
                          Text(
                            "Rs $totalEarning",
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
                      Text("Total withdrawal"),
                      Text(
                        "Rs $amountWithdraw",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ])
            ])));
  }
}
