import 'package:web_socket_channel/web_socket_channel.dart';

class MarketService {
  final String _baseUrl = 'wss://ws.finnhub.io?token=d0iv8f9r01ql09hp4ge0d0iv8f9r01ql09hp4geg';
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
