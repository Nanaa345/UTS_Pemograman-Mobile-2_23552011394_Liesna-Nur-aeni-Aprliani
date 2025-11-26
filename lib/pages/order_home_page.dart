import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/order_cubit.dart';
import 'category_stack_page.dart';

class OrderHomePage extends StatelessWidget {
  const OrderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warung Makan (UTS)"),
        centerTitle: true,
      ),
      // Body memanggil CategoryStackPage sesuai struktur modular
      body: CategoryStackPage(),
      
      // Floating Action Button untuk ke halaman Ringkasan Order
      floatingActionButton: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          // Sembunyikan tombol jika keranjang kosong
          if (state.items.isEmpty) return const SizedBox.shrink();
          
          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/summary');
            },
            icon: const Icon(Icons.shopping_cart),
            label: Text("${state.items.length} Item - Rp ${state.finalTotalPrice}"),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          );
        },
      ),
    );
  }
}