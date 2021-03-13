<p align="center"><img src="https://i.imgur.com/RsPh5tA.png"></p>
<p align="center">Get time elapsed for asynchronous function in a single line of code.</p>
<p align="center">
<a href="https://pub.dev/packages/elapsed" target="_blank"><img src="https://img.shields.io/pub/v/elapsed" alt="Pub Version" /></a>
<a href="https://github.com/xamantra/elapsed/actions/workflows/CI.yaml" target="_blank"><img src="https://github.com/xamantra/elapsed/actions/workflows/CI.yaml/badge.svg?branch=master" alt="Testing Status" /></a>
<a href="https://codecov.io/gh/xamantra/elapsed"><img src="https://codecov.io/gh/xamantra/elapsed/branch/master/graph/badge.svg?token=HDPBJXQZ9Q"/></a>
</p>
<hr>


## What does this do?
- This package is written as a simplified form of [`Stopwatch`](https://api.dart.dev/stable/2.10.5/dart-core/Stopwatch-class.html) class. *And probably better*.
- Only contains one method which is `elapsed(...)` .
- Only accepts a `Future<T>` that the library will automatically await and record the time elapsed.
- Where `<T>` can be of any type including `<void>` .
- The time elapsed will be returned alongside the actual result of the future.
<hr>

## **Normal** vs `package:elapsed`
This is how you normally call an API with `http` package.
```dart
var response = await http.get(...);
print(response.body); // prints JSON data response.
```

But with this library, you can do this:
```dart
var data = await elapsed(http.get(...));
print(data.result.body); // prints JSON data response.
print(data.inMilliseconds); // prints time elapsed in milliseconds.
// Also has ".inSeconds" and ".inMinutes"
```
<hr>

## Comparison
**package:elapsed**

<img src="https://i.imgur.com/WWoVOdz.png" width="520" alt="package:elapsed">
<hr>

**Stopwatch** class

<img src="https://i.imgur.com/5bxRm5t.png" width="520" alt="manual implementation">
<hr>

**manual implementation**

<img src="https://i.imgur.com/DH6AVCq.png" width="520" alt="manual implementation">
<hr>


## Types
Of course. Types are supported. Like this:

<img src="https://i.imgur.com/7ARx37C.png" width="520" alt="typed">
<hr>

## Null-safety
```yaml
dependencies:
  # ...
  elapsed: ^1.2.0 # use this version for null-safety. Requires dart 2.12.0 or Flutter 2.0.0 for flutter.
  # OR
  elapsed: 1.0.7 # no null-safety. can be used in older version of dart and flutter.
  # ...
```

## Disclaimer
This is not an alternative to [`time_elapsed`](https://pub.dev/packages/time_elapsed). This is a very different library.

<hr>
