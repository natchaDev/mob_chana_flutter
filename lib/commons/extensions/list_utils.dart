extension ListUtil on List {
  E firstOrNull<E>() {
    return this == null || this.isEmpty ? null : this.first;
  }

  bool get isNotBlank => this != null && this.isNotEmpty;
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
    <K, List<E>>{},
        (Map<K, List<E>> map, E element) =>
    map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
  );

  Iterable<K> mapIndexed<K>(K Function(E, int) mapFunction) sync* {
    var i = 0;
    for (var item in this) {
      yield mapFunction(item, i++);
    }
  }
}

