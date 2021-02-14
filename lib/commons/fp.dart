class Pair<F extends dynamic, S extends dynamic> {
  F first;
  S second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return 'Pair{(${first.runtimeType}) $first, (${second.runtimeType}) $second}';
  }
}

extension TransformFuture<I> on Future<I> {
  Future<O> flatMap<O>(O Function(I data) mapper) async {
    var oldRes = await this;
    var newRes = mapper(oldRes);
    return newRes;
  }
}