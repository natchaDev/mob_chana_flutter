extension MapUtil<K, V> on Map<K, V> {
  Map expand<K2, V2>(List<MapEntry<K2, V2>> f(K key, V value)) {
    var newMap = <K2, V2>{};
    forEach((key, value) {
      newMap.addEntries(f(key, value));
    });
    return newMap;
  }

  Map<String, dynamic> flatten({
    String delimiter = ".",
    bool safe = false,
    int maxDepth,
  }) {
    Map<String, dynamic> target = map((key, value) => MapEntry(key.toString(), value));
    var result = <String, dynamic>{};

    void step(
      Map<String, dynamic> obj, [
      String previousKey,
      int currentDepth = 1,
    ]) {
      obj.forEach((key, value) {
        final newKey = previousKey != null ? "$previousKey$delimiter$key" : key;

        if (maxDepth != null && currentDepth >= maxDepth) {
          result[newKey] = value;
          return;
        }
        if (value is Map<String, dynamic>) {
          return step(value, newKey, currentDepth + 1);
        }
        if (value is List && !safe) {
          return step(_listToMap(value), newKey, currentDepth + 1);
        }
        result[newKey] = value;
      });
    }

    step(target);

    return result;
  }

  Map<String, T> _listToMap<T>(List<T> list) =>
      list.asMap().map((key, value) => MapEntry(key.toString(), value));
}
