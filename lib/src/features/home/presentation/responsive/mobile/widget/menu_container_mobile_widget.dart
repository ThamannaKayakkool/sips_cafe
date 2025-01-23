import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/config/values.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';

class MenuContainerMobileWidget extends StatelessWidget {
  final String selectedCategory;
  final List<String>category;
  final Function(String) onCategorySelected;
  const  MenuContainerMobileWidget({super.key, required this.selectedCategory, required this.category, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);

    return SizedBox(
      height: screenSize.height * 0.09,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: menuItem.length,
        itemBuilder: (context, index) {
          final String categoryItem = category[index];
          final bool isSelected = selectedCategory == categoryItem;

          return InkWell(
            onTap: () {
              onCategorySelected(categoryItem);
            },
            child: Container(
              width: screenSize.width * 0.2,
              decoration: BoxDecoration(
                  color: isSelected? ColorsManager.greenColor :ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(AppSize.s4),
                  border: Border.all(color: Colors.black.withOpacity(0.1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Image.asset(
                      menuItem[index]['image'],
                      width: screenSize.width * 0.07,
                    ),
                  ),
                  Text(
                    categoryItem,
                    style: getMediumStyle(
                        fontSize: screenSize.width * 0.03,
                        color: isSelected
                            ? ColorsManager.whiteColor
                            : ColorsManager.blackColor),
                  ),
                  Text(
                    "${ menuItem[index]['type']} items",
                    style: getRegularStyle(
                        fontSize: screenSize.width * 0.028,
                        color: isSelected
                            ? ColorsManager.whiteColor
                            : ColorsManager.blackColor),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => kSizedBoxW15,
      ),
    );
  }
}
