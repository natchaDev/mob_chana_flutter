class ArgumentFormatter {
  static Quantifier defaultQuantifier = (num x) => x == 1 ? 'one' : 'many';

  String parseArgs(
    String s,
    List<Object> args, {
    Quantifier quantifier,
  }) {
    //`You have pushed the button {0} {0|one:time,many:times}.`
    var r = RegExp(r'\{([0-9]+)\|([A-Za-z0-9_]+\:[A-Za-z0-9_]+)((\,[A-Za-z0-9_]+\:[A-Za-z0-9_]+)+)\}');
    return s;
  }

  String parseArgsName(
    String s,
    Map<String, Object> args, {
    Quantifier quantifier,
  }) {
    //`You have pushed the button {count} {count|one:time,many:times}.`
    var r = RegExp(r'\{([A-Za-z_][A-Za-z0-9_]+)\|([A-Za-z0-9_]+\:[A-Za-z0-9_]+)((\,[A-Za-z0-9_]+\:[A-Za-z0-9_]+)+)\}');
    return s;
  }
}

typedef Quantifier = String Function(num);
