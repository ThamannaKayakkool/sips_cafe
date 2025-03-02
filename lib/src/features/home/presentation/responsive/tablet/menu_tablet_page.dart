import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_icon_button_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/rich_text_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/search_text_field_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/text_widget.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/menu/menu_bloc.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/tablet/order_tablet_page.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/tablet/widget/menu_container_tablet_widget.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/tablet/widget/menu_item_tablet_widget.dart';

class MenuTabletPage extends StatelessWidget {
  const MenuTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.01,
          vertical: screenSize.height * 0.03,
        ),
        child: Column(
          children: [
            Row(
              children: [
                RichTextWidget(fontSize: screenSize.width * 0.03),
                kSizedBoxW35,
                SearchTextFieldWidget(
                  width: screenSize.width * 0.3,
                  height: screenSize.height * 0.036,
                  hintFontSize: screenSize.width * 0.015,
                  textFontSize: screenSize.width * 0.015,
                ),
                const Spacer(),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    int itemCount = 0;
                    if (state is CartLoaded) {
                      itemCount = state.items.length;
                    }

                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderTabletPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorsManager.greenColor,
                          ),
                        ),
                        if (itemCount > 0)
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: Text(
                                '$itemCount',
                                style: getBoldStyle(fontSize: 12, color:ColorsManager.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
            kSizedBox25,
            TextWidget(
              title: 'Categories',
              fontSize: screenSize.width * 0.02,
            ),
            kSizedBox25,
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return MenuContainerTabletWidget(
                  selectedCategory: state.selectedCategory,
                  category: state.categories,
                  onCategorySelected: (category) {
                    context.read<MenuBloc>().add(SelectCategoryEvent(category));
                  },
                );
              },
            ),
            kSizedBox25,
            Row(
              children: [
                TextWidget(
                  title: 'Special menu for you',
                  fontSize: screenSize.width * 0.02,
                ),
                const Spacer(),
                CustomIconButtonWidget(
                  iconSize: screenSize.width * 0.03,
                  titleFontSize: screenSize.width * 0.02,
                  contentFontSize: screenSize.width * 0.016,
                ),
              ],
            ),
            kSizedBox25,
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return MenuItemTabletWidget(
                  menuItems: state.filteredMenu,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
