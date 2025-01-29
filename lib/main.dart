import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';
import 'src/core/injection/cart_injection_container.dart';
import 'src/features/home/presentation/bloc/cart/cart_bloc.dart';
import 'src/features/home/presentation/bloc/menu/menu_bloc.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CartBloc>()..add(GetCartItemEvent()),
        ), BlocProvider(
          create: (_) => MenuBloc(menuAllItem: menuAllItem,screenWidth: screenSize.width)
        ),
      ],
      child: const MaterialApp(
        title: 'Sips Cafe',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
