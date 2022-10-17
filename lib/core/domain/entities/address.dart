class Address {
  final String _street;
  final String _zipCode;

  String get zipCode => _zipCode;
  String get street => _street;

  Address({required String street, required String zipCode})
      : _street = street,
        _zipCode = zipCode;
}
