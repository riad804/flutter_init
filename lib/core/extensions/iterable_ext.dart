extension IterableX<T> on Iterable<T> {
  T? firstOrNull(bool Function(T) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }

  T? lastOrNull([bool Function(T)? test]) {
    if (test == null) {
      return isEmpty ? null : last;
    }
    T? result;
    for (final e in this) {
      if (test(e)) result = e;
    }
    return result;
  }

  T? singleOrNull([bool Function(T)? test]) {
    var found = false;
    T? result;
    for (final e in this) {
      if (test == null || test(e)) {
        if (found) return null;
        found = true;
        result = e;
      }
    }
    return result;
  }

  bool none([bool Function(T)? test]) {
    if (test == null) return isEmpty;
    for (final e in this) {
      if (test(e)) return false;
    }
    return true;
  }

  Iterable<T> distinctBy<K>(K Function(T) keySelector) {
    final seen = <K>{};
    return where((element) => seen.add(keySelector(element)));
  }
}
