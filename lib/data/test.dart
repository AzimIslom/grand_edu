import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '4/f.dart';

class TestPageA extends StatelessWidget {
  const TestPageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: F4()
                .f11
                .map(
                  (e) => Math.tex(e),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
