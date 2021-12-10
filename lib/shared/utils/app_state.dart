typedef Empty = Function();
typedef Loading = Function();
typedef Success<T> = Function(T data);
typedef Error = Function(String message, Exception? e);
typedef OrElse = Function();

abstract class AppState {
  dynamic when({
    Empty? empty,
    Loading? loading,
    Success? success,
    Error? error,
    required OrElse orElse,
  });

  static empty() => StateEmpty();
  static loading() => StateLoading();
  static success<T>(T data) => StateSuccess(data);
  static error(String message, {Exception? e}) => StateError(message, e: e);
}

class StateEmpty extends AppState {
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    return empty != null ? empty() : orElse();
  }
}

class StateLoading extends AppState {
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    return loading != null ? loading() : orElse();
  }
}

class StateSuccess<T> extends AppState {
  final T data;
  StateSuccess(this.data);
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    return success != null ? success(data) : orElse();
  }
}

class StateError extends AppState {
  final String message;
  final Exception? e;

  StateError(this.message, {this.e});
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Success? success,
      Error? error,
      required OrElse orElse}) {
    return error != null ? error(message, e) : orElse();
  }
}
