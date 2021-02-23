import 'package:elapsed/elapsed.dart';
import 'package:http/http.dart' as http;

void main() async {
  var data = await elapsed(getSum(3, 8)); // Basic example.
  print(data.result); // prints "11" .
  print('${data.inSeconds} seconds'); // prints "2.5 seconds" .

  var voidExample = await elapsed(divide(10, 2)); // void example. no return type.
  print('${voidExample.inSeconds} seconds'); // prints "3.0 seconds" .

  var response = await getSampleREST('https://jsonplaceholder.typicode.com/posts/1');
  print(response.body); // prints JSON data from the api.
}

Future<void> divide(int a, int b) async {
  await Future.delayed(Duration(milliseconds: 3000));
  print(a / b);
}

Future<int> getSum(int a, int b) async {
  await Future.delayed(Duration(milliseconds: 2500));
  return a + b;
}

Future<http.Response> getSampleREST(String url) async {
  var data = await elapsed(http.get(url)); // HTTP REST example.
  print('${data.inSeconds} seconds'); // seconds printed depends on internet speed.
  print(data.result.statusCode); // prints "200" .
  return data.result;
}
