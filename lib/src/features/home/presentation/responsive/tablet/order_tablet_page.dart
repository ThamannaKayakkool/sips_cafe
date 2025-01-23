import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_button_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_circular_progress_widget.dart';
import 'package:sips_cafe/src/core/common/widgets/text_widget.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/config/values.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart_bloc.dart';

class OrderTabletPage extends StatelessWidget {
  const OrderTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
       centerTitle: true,
        backgroundColor: ColorsManager.whiteColor,
        title: Text(
          'Order Details',
          style: getSemiBoldStyle(
            fontSize: screenSize.width * 0.025,
            color: ColorsManager.blackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const CustomCircularProgressWidget();
              } else if (state is CartLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return Card(
                        color: ColorsManager.whiteColor,
                        margin: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.01,
                          horizontal: screenSize.width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                          side: BorderSide(
                            color: ColorsManager.blackColor.withOpacity(0.2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: AppSize.s35,
                                backgroundImage: AssetImage(item.image),
                              ),
                              kSizedBoxW12,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: getSemiBoldStyle(
                                        fontSize: screenSize.width * 0.02,
                                        color: ColorsManager.blackColor,
                                      ),
                                    ),
                                    kSizedBox4,
                                    Text(
                                      '\$${(item.price * item.quantity).toStringAsFixed(2)} x ${item.quantity}',
                                      style: getMediumStyle(
                                        fontSize: screenSize.width * 0.015,
                                        color: ColorsManager.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              kSizedBoxW12,
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(DeleteItemEvent(item.id));
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: ColorsManager.redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => kSizedBox8,
                    itemCount: state.items.length,
                  ),
                );
              }
              return const Center(child: Text('No items in the cart.'));
            },
          ),
          totalWidget(context)
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
              horizontal: screenSize.width * 0.1,
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
                      title: 'Payment', fontSize: screenSize.width * 0.02),
                  kSizedBox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          title: 'Subtotal',
                          fontSize: screenSize.width * 0.015),
                      TextWidget(
                          title: '\$${subtotal.toStringAsFixed(2)}',
                          fontSize: screenSize.width * 0.015),
                    ],
                  ),
                  kSizedBox4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          title: 'Tax (10%)',
                          fontSize: screenSize.width * 0.015),
                      TextWidget(
                          title: '\$${tax.toStringAsFixed(2)}',
                          fontSize: screenSize.width * 0.015),
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
                          title: 'Total', fontSize: screenSize.width * 0.02),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: getSemiBoldStyle(
                          fontSize: screenSize.width * 0.02,
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
                          vertical: screenSize.height * 0.01,
                          horizontal: screenSize.width * 0.1,
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
                                fontSize: screenSize.width * 0.02,
                                color: ColorsManager.blackColor,
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to place this order?',
                              style: getSemiBoldStyle(
                                fontSize: screenSize.width * 0.015,
                                color: ColorsManager.blackColor,
                              ),
                            ),
                            actions: [
                              CustomButtonWidget(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  text: 'Cancel',
                                  fontSize: screenSize.width * 0.015),
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
                                        fontSize: screenSize.width * 0.015);
                                  },
                                  text: 'Place Order',
                                  fontSize: screenSize.width * 0.015),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Place Order',
                        style: getSemiBoldStyle(
                          fontSize: screenSize.width * 0.02,
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