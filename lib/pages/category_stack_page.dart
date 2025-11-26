import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(0);
  void changeCategory(int index) => emit(index);
}

class CategoryStackPage extends StatelessWidget {
  final List<MenuModel> allMenus = [
    MenuModel(id: '1', name: 'Nasi Goreng', price: 15000, category: 'Makanan', discount: 0.1),
    MenuModel(id: '2', name: 'Ayam Bakar', price: 25000, category: 'Makanan'),
    MenuModel(id: '3', name: 'Es Teh Manis', price: 5000, category: 'Minuman'),
    MenuModel(id: '4', name: 'Jus Jeruk', price: 10000, category: 'Minuman', discount: 0.2),
    MenuModel(id: '5', name: 'Paket Keluarga', price: 120000, category: 'Paket'), 
  ];

  CategoryStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Warung Makan")),
        body: Column(
          children: [
            BlocBuilder<CategoryCubit, int>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryButton(context, 0, "Makanan", state),
                    _buildCategoryButton(context, 1, "Minuman", state),
                    _buildCategoryButton(context, 2, "Paket", state),
                  ],
                );
              },
            ),
            const Divider(),
            Expanded(
              child: BlocBuilder<CategoryCubit, int>(
                builder: (context, currentIndex) {
                  final makanan = allMenus.where((m) => m.category == 'Makanan').toList();
                  final minuman = allMenus.where((m) => m.category == 'Minuman').toList();
                  final paket = allMenus.where((m) => m.category == 'Paket').toList();

                  return IndexedStack(
                    index: currentIndex,
                    children: [
                      _buildMenuList(makanan), 
                      _buildMenuList(minuman), 
                      _buildMenuList(paket),  
                    ],
                  );
                },
              ),
            ),
            _buildBottomSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, int index, String label, int currentIndex) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: index == currentIndex ? Colors.blue : Colors.grey,
      ),
      onPressed: () => context.read<CategoryCubit>().changeCategory(index),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildMenuList(List<MenuModel> menus) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) => MenuCard(menu: menus[index]),
    );
  }
  
  Widget _buildBottomSummary(BuildContext context) {
      return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue[50],
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  const Text("Cek Keranjang ->"),
                  ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, '/summary');
                  }, child: const Text("Bayar"))
              ],
          ),
      );
  }
}