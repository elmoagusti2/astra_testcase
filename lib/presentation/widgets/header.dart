import 'package:flutter/material.dart';

class HeaderBackButton extends StatelessWidget {
  const HeaderBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
              )),
        ));
  }
}
