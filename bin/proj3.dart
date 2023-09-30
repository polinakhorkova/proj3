import 'package:proj3/proj3.dart' as proj3;
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final url = Uri.http('dummyjson.com', '/products');
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print('Error');
    return;
  }
  Map<String, dynamic> jsonData = convert.jsonDecode(response.body);
  List<dynamic> products = jsonData['products'];
  double sumRate = 0.0;
  products.forEach((p) {
    var rate = p['rating'];
    sumRate += rate;
  });
  double average = sumRate / products.length;
  print("average rating: $average");
}
