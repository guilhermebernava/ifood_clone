import 'package:ifood_clone/core/domain/entities/address.dart';
import 'package:ifood_clone/core/domain/entities/credit_card.dart';

class UserFinnancialInformation {
  final FinnancialCard finnancialCard;
  final Address finnancialAddress;

  UserFinnancialInformation({
    required this.finnancialAddress,
    required this.finnancialCard,
  });
}
