import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard(
      {super.key,
      required this.date,
      required this.day,
      required this.time,
      required this.cashIn,
      required this.cashOut});
  final String date;
  final String day;
  final String time;
  final String cashIn;
  final String cashOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$day"),
                Row(
                  children: [Text("$date"), Text("$time")],
                )
              ],
            ),
          ),
          Expanded(
              child:
                  Align(alignment: Alignment.center, child: Text('$cashIn'))),
          Expanded(
              child:
                  Align(alignment: Alignment.center, child: Text('$cashOut')))
        ],
      ),
    );
  }
}
