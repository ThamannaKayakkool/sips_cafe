import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_circular_progress_widget.dart';
import 'package:sips_cafe/src/core/config/constants.dart';

class LoadingColumnWidget extends StatelessWidget {
  const LoadingColumnWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCircularProgressWidget(),
        kSizedBox10,
        Text('$message....')
      ],
    );
  }
}