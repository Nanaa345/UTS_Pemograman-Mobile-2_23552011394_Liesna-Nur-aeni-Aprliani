import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/menu_model.dart';

class OrderItem extends Equatable {
  final MenuModel menu;
  final int quantity;

  const OrderItem({required this.menu, required this.quantity});

  int get totalItemPrice => menu.getDiscountedPrice() * quantity;

  @override
  List<Object?> get props => [menu, quantity];
}

class OrderState extends Equatable {
  final List<OrderItem> items;
  
  const OrderState({this.items = const []});

  int get subtotal => items.fold(0, (sum, item) => sum + item.totalItemPrice);

  int get finalTotalPrice {
    int total = subtotal;
    if (total > 100000) {
      return (total * 0.9).toInt(); 
    }
    return total;
  }

  @override
  List<Object?> get props => [items];
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState());

  void addToOrder(MenuModel menu) {
    final currentItems = List<OrderItem>.from(state.items);
    final index = currentItems.indexWhere((item) => item.menu.id == menu.id);

    if (index != -1) {
      final existingItem = currentItems[index];
      currentItems[index] = OrderItem(menu: menu, quantity: existingItem.quantity + 1);
    } else {
      currentItems.add(OrderItem(menu: menu, quantity: 1));
    }
    emit(OrderState(items: currentItems));
  }

  void removeFromOrder(MenuModel menu) {
     final currentItems = List<OrderItem>.from(state.items);
     currentItems.removeWhere((item) => item.menu.id == menu.id);
     emit(OrderState(items: currentItems));
  }

  void updateQuantity(MenuModel menu, int qty) {
    if (qty <= 0) {
      removeFromOrder(menu);
      return;
    }
    
    final currentItems = List<OrderItem>.from(state.items);
    final index = currentItems.indexWhere((item) => item.menu.id == menu.id);

    if (index != -1) {
      currentItems[index] = OrderItem(menu: menu, quantity: qty);
      emit(OrderState(items: currentItems));
    }
  }

  void clearOrder() {
    emit(const OrderState(items: []));
  }
  
  int getTotalPrice() => state.finalTotalPrice;
}