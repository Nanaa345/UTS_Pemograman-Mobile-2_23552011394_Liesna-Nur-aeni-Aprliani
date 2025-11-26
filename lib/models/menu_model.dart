class MenuModel {
  final String id;
  final String name;
  final int price;
  final String category;
  final double discount;

  MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.discount = 0.0,
  });

  int getDiscountedPrice() {
    if (discount == 0) return price;
    return (price - (price * discount)).toInt();
  }
}