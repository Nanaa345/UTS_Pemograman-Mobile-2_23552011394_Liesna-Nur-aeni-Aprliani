import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';
import '../blocs/order_cubit.dart';

class MenuCard extends StatelessWidget {
  final MenuModel menu;

  const MenuCard({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    bool hasDiscount = menu.discount > 0;

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(menu.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    "Rp ${menu.price}",
                    style: TextStyle(
                      color: hasDiscount ? Colors.grey : Colors.black,
                      decoration: hasDiscount ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  if (hasDiscount)
                    Text(
                      "Rp ${menu.getDiscountedPrice()}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<OrderCubit>().addToOrder(menu);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${menu.name} ditambahkan"), duration: const Duration(milliseconds: 500)),
                );
              },
              child: const Text("Tambah"),
            )
          ],
        ),
      ),
    );
  }
}