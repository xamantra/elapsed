import 'package:elapsed/elapsed.dart';
import 'package:test/test.dart';

void main() {
  test('should be 3.1 seconds without value', () async {
    var data = await elapsed(Future.delayed(Duration(milliseconds: 3100)));
    expect(data.result, null);
    expect(data.inSeconds, 3.1);
  });

  test('should be 2 seconds with value', () async {
    var future = Future.delayed(Duration(milliseconds: 2000), () {
      return 'package:elapsed';
    });
    var data = await elapsed(future);
    expect(data.result, 'package:elapsed');
    expect(data.inSeconds, 2);
  });

  test('should be 0.08 minutes', () async {
    var data = await elapsed(Future.delayed(Duration(seconds: 5)));
    expect(data.result, null);
    expect(data.inMinutes, 0.08);
  });
}
