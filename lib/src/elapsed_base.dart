class _Elapsed<T> {
  _Elapsed(this.result, this.inMilliseconds);

  /// The actual result of the `Future`.
  /// If the `Future` doesn't return a value,
  /// you can ignore this property.
  final T result;

  /// The time it took for the future to complete.
  /// In `milliseconds`.
  final int inMilliseconds;

  /// The time it took for the future to complete.
  /// In `seconds`.
  double get inSeconds => double.parse((inMilliseconds / 1000).toStringAsFixed(2));

  /// The time it took for the future to complete.
  /// In `minutes`.
  double get inMinutes => double.parse((inSeconds / 60).toStringAsFixed(2));
}

/// Wrap a `Future` with this method and it will
/// return an instance of the actual result and
/// the time it took to complete the future.
/// ### Example
/// ```dart
/// var data = await elapsed(http.get('http://...'));
/// // http.get returns a `Response` object with `statusCode` property.
/// // access `data.result` to get the `Response`.
/// print(data.result.statusCode); // `data.result` is of type <Response>
/// print(data.timeElapsed); // (milliseconds) provided by `elapsed` package.
///
/// // the typical way without `elapsed` package.
/// var data = await http.get('http://...');
/// print(data.statusCode);
/// ```
Future<_Elapsed<T>> elapsed<T>(Future<T> future) async {
  var started = DateTime.now().millisecondsSinceEpoch;
  var result = await future;
  var finished = DateTime.now().millisecondsSinceEpoch;
  return _Elapsed(result, finished - started);
}
