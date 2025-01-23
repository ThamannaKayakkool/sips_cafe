import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/common/widgets/custom_circular_progress_widget.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/config/values.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart_bloc.dart';

class OrderDesktopPage extends StatelessWidget {
  const OrderDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CustomCircularProgressWidget();
        } else if (state is CartLoaded) {
          return Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Card(
                  color: ColorsManager.whiteColor,
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.002,
                    horizontal: screenSize.width * 0.01,
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
                          radius: AppSize.s25,
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
                                  fontSize: screenSize.width * 0.009,
                                  color: ColorsManager.blackColor,
                                ),
                              ),
                              kSizedBox4,
                              Text(
                                '\$${(item.price * item.quantity).toStringAsFixed(2)} x ${item.quantity}',
                                style: getMediumStyle(
                                  fontSize: screenSize.width * 0.008,
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
    );
  }
}