import 'package:app_crypto/model/coin_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinListingRepository {
  static Future<List<CoinModel>> all() async {
    final uri =
        Uri.parse("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=USD");

    final response = await http.get(uri, headers: {
      // insert your api key here
      "X-CMC_PRO_API_KEY": "",
    });

    final jsonData = json.decode(response.body);
    return List.from(jsonData["data"]).map((coinData) {
      return CoinModel.fromData(coinData);
    }).toList();
  }
}