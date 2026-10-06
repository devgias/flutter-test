import 'package:flutter/material.dart';
import 'package:gap/gap.dart' as gap;

class Gap extends StatelessWidget {
  final double size;
  const Gap([this.size = 8, Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) => gap.Gap(size);
}
