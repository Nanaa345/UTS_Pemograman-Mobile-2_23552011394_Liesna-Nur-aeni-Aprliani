import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/order_cubit.dart';
import 'pages/category_stack_page.dart';
import 'pages/order_summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OrderCubit()),
      ],
      child: MaterialApp(
        title: 'UTS Mobile Prog 2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: CategoryStackPage(),
        routes: {
            '/summary': (context) => const OrderSummaryPage(),
        },
      ),
    );
  }
}