import 'dart:convert';
import 'package:get/get.dart';
import 'package:revva/models/market_model.dart';
import 'package:revva/services/market_service.dart';

class MarketController extends GetxController {
  final MarketService _service = MarketService();
  final symbols = ['NVDA', 'AAPL', 'TSLA', 'QQQ', 'META', 'GOOG', 'WMT', 'AMD', 'MSFT', 'AMZN', 'BINANCE:BTCUSDT', 'BINANCE:BNBUSDT', 'BINANCE:SOLUSDT', 'BINANCE:ETHUSDT'].obs;
  final prices = <String, MarketModel>{}.obs;
  var _channel;

  @override
  void onInit() {
    super.onInit();
    _channel = _service.connect();
    for (var symbol in symbols) {
      subscribeToSymbol(symbol);
    }
    _channel.stream.listen((event) {
      final Map<String, dynamic> data = jsonDecode(event);
      if (data['type'] == 'trade' && data['data'] != null) {
        for (var tradeData in data['data']) {
          final marketInfo = MarketModel.fromJson(tradeData);
          updatePrice(marketInfo.symbol, marketInfo.price);
        }
      }
    });
  }

  void updatePrice(String symbol, double newPrice) {
    final oldMarket = prices[symbol];
    double oldPrice = oldMarket?.price ?? newPrice;

    double change = newPrice - oldPrice;
    double changePercent = oldPrice != 0 ? (change / oldPrice) * 100 : 0;

    final newMarket = MarketModel(
      symbol: symbol,
      price: newPrice,
      change: change,
      changePercent: changePercent,
    );

    prices.update(symbol, (_) => newMarket, ifAbsent: () => newMarket);
    prices.refresh();
  }

  void subscribeToSymbol(String symbol) {
    final message = jsonEncode({'type': 'subscribe', 'symbol': symbol});
    _service.sendMessage(message);
  }

  @override
  void onClose() {
    if (_channel != null) {
      _service.close();
    }
    super.onClose();
  }
}
