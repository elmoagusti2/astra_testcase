import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailBaseStats extends StatelessWidget {
  final String? title;
  final int? value;
  final double? indicator;
  const DetailBaseStats({
    super.key,
    required this.title,
    required this.value,
    required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text('$title')),
          SizedBox(
            width: 30,
            child: Text('$value', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
              child: LinearPercentIndicator(
            width: 180,
            barRadius: const Radius.circular(10),
            lineHeight: 8.0,
            percent: indicator ?? 0,
            progressColor: value! < 50 ? Colors.red : Colors.green,
          ))
        ],
      ),
    );
  }
}
