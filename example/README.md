<p align="center"><img src="https://i.imgur.com/RsPh5tA.png"></p>
<p align="center">Get time elapsed for asynchronous function in a single line of code.</p>
<p align="center">
<a href="https://pub.dev/packages/elapsed" target="_blank"><img src="https://img.shields.io/pub/v/elapsed" alt="Pub Version" /></a>
<a href="https://github.com/xamantra/elapsed/actions/workflows/CI.yaml" target="_blank"><img src="https://github.com/xamantra/elapsed/actions/workflows/CI.yaml/badge.svg?branch=master" alt="Testing Status" /></a>
<a href="https://codecov.io/gh/xamantra/elapsed"><img src="https://codecov.io/gh/xamantra/elapsed/branch/master/graph/badge.svg?token=HDPBJXQZ9Q"/></a>
</p>
<hr>

# Examples
Pay attention to the `elapsed(...)` method calls below. That's the core of this library.

## Basic
- The `getSum(...)` function mocks `Future` with a delay of *2.5s*
- The result of future is accessible in `.result` property. In this case, it's the sum of two numbers.
- This example uses `.inSeconds` time property. Just as the name suggests, it represents the time elapsed in seconds.

  ```dart
    import 'package:elapsed/elapsed.dart';

    void main() async {
      var data = await elapsed(getSum(3, 8));
      print(data.result); // prints "11" .
      print('${data.inSeconds} seconds'); // prints "2.5 seconds" .
    }

    Future<int> getSum(int a, int b) async {
      await Future.delayed(Duration(milliseconds: 2500));
      return a + b;
    }
  ```

<hr>

## Future\<void\>
- Both futures with return types and plain `void` is supported by this library.
- This time the `Future` is mocked with 3 seconds delay.

  ```dart
    import 'package:elapsed/elapsed.dart';

    void main() async {
      var data = await elapsed(divide(10, 2));
      print('${data.inSeconds} seconds'); // prints "3.0 seconds" .
    }

    Future<void> divide(int a, int b) async {
      await Future.delayed(Duration(milliseconds: 3000));
      print(a / b); // prints "5.0"
      // no return value...
    }
  ```
  
<hr>

## HTTP Request->Response
- Of course, this works too!
- This example will actually call an HTTP api resource.
- Using [jsonplaceholder](https://jsonplaceholder.typicode.com).
- The code wraps it inside `elapsed(...)` instead of directly awaiting `http.get(...)`.

  ```dart
    import 'package:elapsed/elapsed.dart';
    import 'package:http/http.dart' as http;

    void main() async {
      var response = await getSampleREST('https://jsonplaceholder.typicode.com/posts/1');
      print(response.body); // prints JSON data from the api.
    }

    Future<http.Response> getSampleREST(String url) async {
      var data = await elapsed(http.get(url)); // HTTP REST example.
      print('${data.inSeconds} seconds'); // seconds printed depends on internet speed.
      print(data.result.statusCode); // prints "200" .
      return data.result;
    }
  ```