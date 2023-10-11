import 'package:flutter/material.dart';

class MerhabaText extends StatelessWidget {
  const MerhabaText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Merhaba, Tunahan yılmaz".toUpperCase(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
