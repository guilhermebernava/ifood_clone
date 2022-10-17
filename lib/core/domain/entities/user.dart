import 'package:ifood_clone/core/domain/entities/user_finnancial_information.dart';

class User {
  final String name;
  final String email;
  final String profileImage;
  final UserFinnancialInformation userFinnancialInformation;

  User({
    required this.email,
    required this.name,
    required this.profileImage,
    required this.userFinnancialInformation,
  });
}
