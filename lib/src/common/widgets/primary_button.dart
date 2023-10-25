import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/common/extensions/widget_modifier.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child.padding(const EdgeInsets.symmetric(vertical: 14),),
    );
  }
}
