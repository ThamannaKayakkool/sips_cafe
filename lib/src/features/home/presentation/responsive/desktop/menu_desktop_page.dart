import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_button_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/rich_text_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/text_widget.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/desktop/widget/menu_container_desktop_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/menu_item_widget.dart';
import 'package:sips_cafe/src/features/home/presentation/responsive/desktop/order_desktop_page.dart';
import 'package:sips_cafe/src/core/common/widgets/search_text_field_widget.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/config/values.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart_bloc.dart';

class MenuDesktopPage extends HookWidget {
  const MenuDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState("All Menu");

    final filteredMenu = useMemoized(() {
      if (selectedCategory.value == "All Menu") {
        return menuAllItem;
      }
      return menuAllItem
          .where((item) => item["category"] == selectedCategory.value)
          .toList();
    }, [selectedCategory.value]);

    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.01,
              vertical: screenSize.height * 0.03,
            ),
            child: Row(
              children: [
                RichTextWidget(fontSize: screenSize.width * 0.02),
                kSizedBoxW35,
                SearchTextFieldWidget(
                  width: screenSize.width * 0.2,
                  height: screenSize.height * 0.04, hintFontSize: screenSize.width * 0.009, textFontSize: screenSize.width * 0.01,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.02,
                    ),
                    child: Column(
                      children: [
                        TextWidget(
                          title: 'Categories',
                          fontSize: screenSize.width * 0.012,
                        ),
                        kSizedBox15,
                        MenuContainerDesktopWidget(
                          selectedCategory: selectedCategory.value,
                          category: category,
                          onCategorySelected: (category) {
                            selectedCategory.value = category;
                          },
                        ),
                        kSizedBox25,
                        TextWidget(
                          title: 'Special menu for you',
                          fontSize: screenSize.width * 0.012,
                        ),
                        kSizedBox25,
                        MenuItemDesktopWidget(
                          menuItems: filteredMenu,
                          titleFontSize: screenSize.width * 0.01,
                          subTitleFontSize: screenSize.width * 0.008, iconSize: screenSize.width * 0.013,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.015,
                        horizontal: screenSize.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsManager.blackColor.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                      child: Column(
                        children: [
                          TextWidget(
                            title: 'Order Details',
                            fontSize: screenSize.width * 0.012,
                          ),
                          kSizedBox15,
                          const OrderDesktopPage(),
                          totalWidget(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget totalWidget(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final double subtotal = state.subtotal;
          final double tax = subtotal * 0.1;
          final double total = subtotal + tax;

          return Card(
            color: ColorsManager.whiteColor,
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s4),
              side: BorderSide(
                color: ColorsManager.blackColor.withOpacity(0.1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      title: 'Payment', fontSize: screenSize.width * 0.01),
                  kSizedBox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          title: 'Subtotal',
                          fontSize: screenSize.width * 0.008),
                      TextWidget(
                          title: '\$${subtotal.toStringAsFixed(2)}',
                          fontSize: screenSize.width * 0.008),
                    ],
                  ),
                  kSizedBox4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          title: 'Tax (10%)',
                          fontSize: screenSize.width * 0.008),
                      TextWidget(
                          title: '\$${tax.toStringAsFixed(2)}',
                          fontSize: screenSize.width * 0.008),
                    ],
                  ),
                  Divider(
                    color: ColorsManager.blackColor.withOpacity(0.1),
                  ),
                  kSizedBox4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          title: 'Total', fontSize: screenSize.width * 0.01),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: getSemiBoldStyle(
                          fontSize: screenSize.width * 0.01,
                          color: ColorsManager.greenColor,
                        ),
                      ),
                    ],
                  ),
                  kSizedBox10,
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s6),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.002,
                          horizontal: screenSize.width * 0.01,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: ColorsManager.whiteColor,
                            title: Text(
                              'Confirm Order',
                              style: getSemiBoldStyle(
                                fontSize: screenSize.width * 0.01,
                                color: ColorsManager.blackColor,
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to place this order?',
                              style: getSemiBoldStyle(
                                fontSize: screenSize.width * 0.008,
                                color: ColorsManager.blackColor,
                              ),
                            ),
                            actions: [
                              CustomButtonWidget(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  text: 'Cancel',
                                  fontSize: screenSize.width * 0.008),
                              CustomButtonWidget(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(ClearCartEvent());
                                    Navigator.of(context).pop();
                                    Utils().showSnackBar(
                                        context: context,
                                        content: 'Order placed successfully!',
                                        color: ColorsManager.greenColor,
                                        fontSize: screenSize.width * 0.009);
                                  },
                                  text: 'Place Order',
                                  fontSize: screenSize.width * 0.008),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Place Order',
                        style: getSemiBoldStyle(
                          fontSize: screenSize.width * 0.01,
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
