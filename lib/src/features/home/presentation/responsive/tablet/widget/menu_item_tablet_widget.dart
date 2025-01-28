import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/menu/menu_bloc.dart';

class MenuItemTabletWidget extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;

  const MenuItemTabletWidget({
    super.key,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        int gridCount = state.gridCount;
        double childAspectRatio = 1.0;

        double imageWidth, imageHeight;
        switch (gridCount) {
          case 1:
            childAspectRatio = 3.0;
            imageWidth = screenSize.width * 0.95;
            imageHeight = screenSize.height * 0.8;
            break;
          case 2:
            childAspectRatio = 1.8;
            imageWidth = screenSize.width * 0.46;
            imageHeight = screenSize.height * 0.46;
            break;
          case 3:
            childAspectRatio = 1.4;
            imageWidth = screenSize.width * 0.29;
            imageHeight = screenSize.height * 0.29;
            break;
          case 4:
          default:
            childAspectRatio = 1.0;
            imageWidth = screenSize.width * 0.2;
            imageHeight = screenSize.height * 0.2;
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 4,
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
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        "${items['name']}",
                        style: getSemiBoldStyle(
                          fontSize: screenSize.width * 0.015,
                          color: ColorsManager.blackColor,
                        ),
                      ),
                      subtitle: Text(
                        "\$${items['price']}",
                        style: getMediumStyle(
                          fontSize: screenSize.width * 0.013,
                          color: ColorsManager.blackColor,
                        ),
                      ),
                      trailing: IconButton(
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
                          size: screenSize.width * 0.02,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

