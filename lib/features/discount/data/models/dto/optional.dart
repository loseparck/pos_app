class Optional<T> {
  final bool isSet;
  final T? value;

  const Optional.unset()
      : isSet = false,
        value = null;

  const Optional.value(T value)
      : isSet = true,
        value = value;

  const Optional.nullValue()
      : isSet = true,
        value = null;

  bool get isUnset => !isSet;
}