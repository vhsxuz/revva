class HistoryModel {
  final String paymentType;
  final String transactionDate;
  final List<HistoryDetail> details;
  final int totalAmount;

  HistoryModel({
    required this.paymentType,
    required this.transactionDate,
    required this.details,
    required this.totalAmount,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    var detailsList = <HistoryDetail>[];
    if (json['details'] is List) {
      detailsList = (json['details'] as List)
          .map((item) => HistoryDetail.fromJson(item))
          .toList();
    } else if (json['details'] is Map<String, dynamic>) {
      detailsList = [HistoryDetail.fromJson(json['details'])];
    }

    return HistoryModel(
      paymentType: json['paymentType']?['name'] ?? 'Unknown',
      transactionDate: json['paymentType']?['created_at'] ?? 'Unknown',
      details: detailsList,
      totalAmount: json['totalAmount'] ?? 0,
    );
  }
}

class HistoryDetail {
  final String menuName;
  final String menuCategory;
  final int price;
  final int quantity;

  HistoryDetail({
    required this.menuName,
    required this.menuCategory,
    required this.price,
    required this.quantity,
  });

  factory HistoryDetail.fromJson(Map<String, dynamic> json) {
    return HistoryDetail(
      menuName: json['menu']?['name'] ?? 'Unknown',
      menuCategory: json['menu']?['menuCategory']?['name'] ?? 'Unknown',
      price: json['menu']?['price'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }
}
