import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/common/widgets/text_widget.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/menu/menu_bloc.dart';

class MenuItemMobileWidget extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;

  const MenuItemMobileWidget({
    super.key,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        int gridCount = state.gridCount;
        double childAspectRatio = 1.0;

        double imageWidth,
            imageHeight,
            titleFontSize,
            subtitleFontSize,
            iconSize;
        switch (gridCount) {
          case 1:
            childAspectRatio = 3.0;
            imageWidth = screenSize.width * 0.91;
            imageHeight = screenSize.height * 0.9;
            titleFontSize = screenSize.width * 0.033;
            subtitleFontSize = screenSize.width * 0.03;
            iconSize = screenSize.width * 0.045;
            break;
          case 2:
            childAspectRatio = 1.0;
            imageWidth = screenSize.width * 0.43;
            imageHeight = screenSize.height * 0.2;
            titleFontSize = screenSize.width * 0.03;
            subtitleFontSize = screenSize.width * 0.03;
            iconSize = screenSize.width * 0.045;
            break;
          case 3:
            childAspectRatio = 1.0;
            imageWidth = screenSize.width * 0.26;
            imageHeight = screenSize.height * 0.29;
            titleFontSize = screenSize.width * 0.02;
            subtitleFontSize = screenSize.width * 0.015;
            iconSize = screenSize.width * 0.026;
            break;
          case 4:
          default:
            childAspectRatio = 0.2/0.5;
            imageWidth = screenSize.width * 0.2;
            imageHeight = screenSize.height * 0.2;
            titleFontSize = screenSize.width * 0.02;
            subtitleFontSize = screenSize.width * 0.02;
            iconSize = screenSize.width * 0.03;
            break;
        }

        return Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final items = menuItems[index];
              return Column(
                children: [
                  Flexible(
                   // flex: 3,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "${items['image']}",
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 0.025),
                    child: TextWidget(title: "${items['name']}", fontSize: titleFontSize),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      TextWidget(title:"\$${items['price']}", fontSize: subtitleFontSize),
                     //const Spacer(),
                      IconButton(
                          onPressed: () {
                            context.read<CartBloc>().add(AddItemEvent(
                                  id: items['name'].hashCode,
                                  image: items['image'],
                                  name: items['name'],
                                  price: double.tryParse(items['price']) ?? 0.0,
                                  quantity: 1,
                                ));
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorsManager.greenColor,
                            size: iconSize,
                          )),
                    ],
                  ),
                  kSizedBox10,
                ],
              );
            },
          ),
        );
      },
    );
  }
}
