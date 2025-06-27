import 'package:flutter/material.dart';

class ErrorMassage extends StatelessWidget {
  const ErrorMassage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text(
          'ooOOps There is an Error .',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
