class Validator {
  emptyString() => (String v) {
        if (v.isEmpty || v == null) {
          return 'Valor inválido';
        }
      };

  email() => (String v) {
        if (!v.contains('@')) {
          return 'Email inválido';
        }
      };
}
