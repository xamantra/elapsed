<p align="center"><img src="https://i.imgur.com/RsPh5tA.png"></p>
<p align="center">Get time elapsed for asynchronous function in a single line of code.</p>
<p align="center">
<a href="https://pub.dev/packages/elapsed" target="_blank"><img src="https://img.shields.io/pub/v/elapsed" alt="Pub Version" /></a>
<a href="https://github.com/xamantra/elapsed/actions/workflows/CI.yaml" target="_blank"><img src="https://github.com/xamantra/elapsed/actions/workflows/CI.yaml/badge.svg?branch=master" alt="Testing Status" /></a>
<a href="https://codecov.io/gh/xamantra/elapsed"><img src="https://codecov.io/gh/xamantra/elapsed/branch/master/graph/badge.svg?token=HDPBJXQZ9Q"/></a>
</p>
<hr>

### What does this do?
- The library only contains one method which is `elapsed(...)` .
- It accepts a `Future<T>` that the library will automatically await and record the time elapsed.
- The time elapsed will be returned alongside the actual result of the future.
- Where `<T>` can be of any type including `<void>` .
- This package is written as a simplified form of [`Stopwatch`](https://api.dart.dev/stable/2.10.5/dart-core/Stopwatch-class.html) class. *And probably better*.

### **Normal** vs `package:elapsed`
This is how you normally call an API with `http` package.
```dart
var response = await http.get(...);
print(response.body); // prints JSON data response.
```

But with this library, you can do this:
```dart
var data = await elapsed(http.get(...));
print(data.result.body); // prints JSON data response.
```

^ These two different codes produce the same output. The difference is that you can do this with `elapsed`:
```dart
// prints time elapsed in milliseconds.
print(data.result.inMilliseconds);
//  Also has `.inSeconds` and `.inMinutes`
```

That's it! Implemented time elapsed for a future with only *1 line of code* -> `await elapsed(...)` .


Checkout the [example](https://pub.dev/packages/elapsed/example) tab for more examples.