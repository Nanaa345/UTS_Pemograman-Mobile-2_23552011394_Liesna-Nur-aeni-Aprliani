import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/order_cubit.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan Pesanan")),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text("Keranjang Kosong"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ListTile(
                      title: Text(item.menu.name),
                      subtitle: Text("${item.quantity} x Rp ${item.menu.getDiscountedPrice()}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () => context.read<OrderCubit>().updateQuantity(item.menu, item.quantity - 1),
                          ),
                          Text("Rp ${item.totalItemPrice}"),
                           IconButton(
                            icon: const Icon(Icons.add_circle),
                            onPressed: () => context.read<OrderCubit>().updateQuantity(item.menu, item.quantity + 1),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // BAGIAN TOTAL & BONUS
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal:"),
                        Text("Rp ${state.subtotal}"),
                      ],
                    ),
                    if (state.subtotal > 100000)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bonus Diskon (10%):", style: TextStyle(color: Colors.green)),
                          Text("Termasuk", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    const Divider(thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("TOTAL BAYAR:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Rp ${state.finalTotalPrice}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                            context.read<OrderCubit>().clearOrder();
                            Navigator.pop(context);
                        },
                        child: const Text("Selesaikan Transaksi")
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}