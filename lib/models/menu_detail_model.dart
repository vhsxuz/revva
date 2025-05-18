class MenuDetailModel {
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
  final String lastRestocked;
  final String createdAt;
  final MenuDetailCategory menuCategory;

  MenuDetailModel({
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

  factory MenuDetailModel.fromJson(Map<String, dynamic> json) {
    return MenuDetailModel(
      id: json['id'],
      name: json['name'],
      menuCategoryId: json['menu_category_id'],
      rating: json['rating']?.toDouble() ?? 0.0,
      description: json['description'],
      productionCost: json['production_cost'],
      price: json['price'],
      margin: json['margin'],
      monthlyRevenue: json['monthly_revenue'],
      monthlyProfit: json['monthly_profit'],
      stockServing: json['stock_serving'],
      prepTimeMinutes: json['prep_time_minutes'],
      lastRestocked: json['last_restocked'],
      createdAt: json['created_at'],
      menuCategory: MenuDetailCategory.fromJson(json['menuCategory']),
    );
  }
}

class MenuDetailCategory {
  final String id;
  final String name;
  final String createdAt;

  MenuDetailCategory({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory MenuDetailCategory.fromJson(Map<String, dynamic> json) {
    return MenuDetailCategory(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}