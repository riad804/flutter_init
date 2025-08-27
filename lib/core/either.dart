sealed class Either<L, R> {
  T fold<T>(T Function(L l) left, T Function(R r) right);
  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;
}


final class Left<L, R> extends Either<L, R> {
  final L value;
  Left(this.value);
  @override
  T fold<T>(T Function(L l) left, T Function(R r) right) => left(value);
}


final class Right<L, R> extends Either<L, R> {
  final R value;
  Right(this.value);
  @override
  T fold<T>(T Function(L l) left, T Function(R r) right) => right(value);
}