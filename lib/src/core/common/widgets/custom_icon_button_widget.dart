import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/menu/menu_bloc.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final double iconSize;
  final double titleFontSize;
  final double contentFontSize;
  const CustomIconButtonWidget({super.key, required this.iconSize, required this.titleFontSize, required this.contentFontSize});

  @override
  Widget build(BuildContext context) {
    return   IconButton(
      icon: Icon(
        Icons.grid_view,
        size: iconSize,
        color: ColorsManager.greenColor,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: ColorsManager.whiteColor,
            title: Text(
              'Select Column',
              style: getSemiBoldStyle(
                fontSize: titleFontSize,
                color: ColorsManager.blackColor,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(4, (index) {
                final crossAxisCount = index + 1;
                return ListTile(
                  title: Text(
                    '$crossAxisCount  Column',
                    style: getMediumStyle(
                      fontSize: contentFontSize,
                      color: ColorsManager.blackColor,
                    ),
                  ),
                  onTap: () {
                    context.read<MenuBloc>().add(UpdateGridCountEvent(crossAxisCount));
                    Navigator.of(context).pop();
                  },
                );
              }),
            ),

          ),
        );
      },
    );
  }
}
