import 'package:flutter/material.dart';

class GetLoadingWidget extends StatelessWidget {
  const GetLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
