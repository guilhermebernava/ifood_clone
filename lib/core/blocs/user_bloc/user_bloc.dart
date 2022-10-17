import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/core/domain/entities/address.dart';
import 'package:ifood_clone/core/domain/entities/credit_card.dart';
import 'package:ifood_clone/core/domain/entities/user.dart';
import 'package:ifood_clone/core/domain/entities/user_finnancial_information.dart';

//primeiro parametro é os eventos que vão ser enviados para o bloc
//segundo é o que ele vai mandar para fora
class UserBloc extends Bloc<UserEvent, UserState> {
  //precisamos passar o STATE inicial pelo construtor
  UserBloc() : super(NotLogged()) {
    //depois precisamos criar os ON com cada EVENTO que queremos utilizar.
    on<LoginEvent>((event, emit) async {
      emit(Loading());
      if (event.login.email != 'g') {
        emit(ErrorState('E-mail ou Senha inválida'));
      } else {
        await Future.delayed(const Duration(seconds: 10));
        emit(
          Logged(
            User(
              email: 'teste',
              name: '',
              profileImage: '',
              userFinnancialInformation: UserFinnancialInformation(
                  finnancialAddress: Address(
                    street: '',
                    zipCode: '',
                  ),
                  finnancialCard: FinnancialCard(
                    cardNumber: '',
                    cvv: '',
                    expirationDate: '',
                  )),
            ),
          ),
        );
      }
    });

    //outro evento
    on<LogoutEvent>((_, emit) {
      emit(NotLogged());
    });
  }
}
