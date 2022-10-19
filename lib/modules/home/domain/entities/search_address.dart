import 'package:ifood_clone/core/domain/value_objects/not_null_string.dart';

class SearchAddress {
  NotNullString address;

  SearchAddress(this.address);

  factory SearchAddress.empty() {
    return SearchAddress(NotNullString(''));
  }
}
