extension TF<T, R> on T {
  R let(R Function(T it) func) {
    return func(this);
  }

  T also(void Function(T it) func) {
    func(this);
    return this;
  }
}
