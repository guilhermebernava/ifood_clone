import 'package:ifood_clone/core/domain/value_objects/interfaces/value_object.dart';

class NotNullString implements ValueObject<String> {
  String _value;

  NotNullString(this._value);

  String get value => _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Valor não pode ser nulo!';
    }
    return null;
  }

  @override
  void call(String value) {
    _value = value;
  }
}
