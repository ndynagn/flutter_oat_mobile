import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';

class PagerBar extends StatelessWidget {
  const PagerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ).padding(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
    );
  }
}
