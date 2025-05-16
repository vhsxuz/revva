import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MarketService {
  final String token = dotenv.env['MARKET_API_KEY'] ?? 'No API Key';
  
  String get _baseUrl => 'wss://ws.finnhub.io?token=$token';
  late WebSocketChannel _channel;

  WebSocketChannel connect() {
    _channel = WebSocketChannel.connect(Uri.parse(_baseUrl));
    return _channel;
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void close() {
    _channel.sink.close();
  }
}
