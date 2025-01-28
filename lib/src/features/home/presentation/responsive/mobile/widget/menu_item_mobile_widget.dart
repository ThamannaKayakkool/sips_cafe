import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart/cart_bloc.dart';

class MenuItemMobileWidget extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;

  const MenuItemMobileWidget({
    super.key,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.0,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final items = menuItems[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "${items['image']}",
                      width: screenSize.width * 0.4,
                      height: screenSize.height * 0.2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ListTile(
                  title: Text(
                    "${items['name']}",
                    style: getSemiBoldStyle(
                      fontSize: screenSize.width * 0.038,
                      color: ColorsManager.blackColor,
                    ),
                  ),
                  subtitle: Text(
                    " \$${items['price']}",
                    style: getMediumStyle(
                      fontSize: screenSize.width * 0.03,
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
                        size: screenSize.width * 0.05,
                      )),
                ),
              ),
              kSizedBox10,
            ],
          );
        },
      ),
    );
  }
}
