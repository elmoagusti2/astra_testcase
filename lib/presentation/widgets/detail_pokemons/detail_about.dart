import 'package:flutter/material.dart';

class DetailAbouts extends StatelessWidget {
  final String? title;
  final String? value;
  const DetailAbouts({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text('$title')),
        Flexible(child: Text('$value', style: const TextStyle(fontWeight: FontWeight.bold,)))
      ],
    );
  }
}
