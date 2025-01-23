import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/core/injection/cart_injection_container.dart';
import 'src/features/home/presentation/bloc/cart_bloc.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CartBloc>()..add(GetCartItemEvent()),
      child: const MaterialApp(
        title: 'Sips Cafe',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

