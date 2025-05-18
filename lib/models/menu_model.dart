class MenuModel {
  final String id;
  final String name;
  final String menuCategoryId;
  final double rating;
  final String description;
  final int productionCost;
  final int price;
  final int margin;
  final int monthlyRevenue;
  final int monthlyProfit;
  final int stockServing;
  final int prepTimeMinutes;
  final DateTime lastRestocked;
  final DateTime createdAt;
  final MenuCategory menuCategory;

  MenuModel({
    required this.id,
    required this.name,
    required this.menuCategoryId,
    required this.rating,
    required this.description,
    required this.productionCost,
    required this.price,
    required this.margin,
    required this.monthlyRevenue,
    required this.monthlyProfit,
    required this.stockServing,
    required this.prepTimeMinutes,
    required this.lastRestocked,
    required this.createdAt,
    required this.menuCategory,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      name: json['name'],
      menuCategoryId: json['menu_category_id'],
      rating: (json['rating'] as num).toDouble(),
      description: json['description'],
      productionCost: json['production_cost'],
      price: json['price'],
      margin: json['margin'],
      monthlyRevenue: json['monthly_revenue'],
      monthlyProfit: json['monthly_profit'],
      stockServing: json['stock_serving'],
      prepTimeMinutes: json['prep_time_minutes'],
      lastRestocked: DateTime.parse(json['last_restocked']),
      createdAt: DateTime.parse(json['created_at']),
      menuCategory: MenuCategory.fromJson(json['menuCategory']),
    );
  }
}

class MenuCategory {
  final String id;
  final String name;
  final DateTime createdAt;

  MenuCategory({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
