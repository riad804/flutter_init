extension IterableX<T> on Iterable<T> {
  T? firstOrNull(bool Function(T) test) {
    for (final e in this) { if (test(e)) return e; }
    return null;
  }
}