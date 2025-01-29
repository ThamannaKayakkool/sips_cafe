import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_icon_button_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/rich_text_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/search_text_field_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/text_widget.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/menu/menu_bloc.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/mobile/order_mobile_page.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/mobile/widget/menu_container_mobile_widget.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/mobile/widget/menu_item_mobile_widget.dart';

class MenuMobilePage extends StatelessWidget {
  const MenuMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        title: RichTextWidget(fontSize: screenSize.width * 0.05),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderMobilePage(),
                    ));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorsManager.greenColor,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * 0.02,
        ),
        child: Column(
          children: [
            SearchTextFieldWidget(
              width: screenSize.width * 0.7,
              height: screenSize.height * 0.04,
              hintFontSize: screenSize.width * 0.03,
              textFontSize: screenSize.width * 0.03,
            ),
            kSizedBox25,
            TextWidget(
              title: 'Categories',
              fontSize: screenSize.width * 0.035,
            ),
            kSizedBox20,
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return MenuContainerMobileWidget(
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
                  fontSize: screenSize.width * 0.035,
                ),
                const Spacer(),
                CustomIconButtonWidget(
                  iconSize: screenSize.width * 0.045,
                  titleFontSize: screenSize.width * 0.035,
                  contentFontSize: screenSize.width * 0.03,
                ),
              ],
            ),
            kSizedBox25,
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return MenuItemMobileWidget(
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
