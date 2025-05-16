class MarketModel {
  final String symbol;
  final double price;
  final double change;
  final double changePercent;

  MarketModel({
    required this.symbol,
    required this.price,
    required this.change,
    required this.changePercent,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      try {
        if (value is List) {
          // If it's a list, pick the first element if available
          return value.isNotEmpty ? double.parse(value.first.toString()) : 0.0;
        } else if (value is num) {
          // If it's a number, directly convert to double
          return value.toDouble();
        } else if (value is String) {
          // If it's a string, try parsing it as a double
          return double.tryParse(value) ?? 0.0;
        }
      } catch (e) {
        // Handle any unexpected cases
        print("Error parsing double: $e");
      }
      return 0.0; // Fallback for unexpected data
    }

    return MarketModel(
      symbol: json['s'] ?? '',
      price: parseDouble(json['p']),
      change: parseDouble(json['c']),
      changePercent: parseDouble(json['cp']),
    );
  }
}