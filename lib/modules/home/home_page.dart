import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/core/domain/entities/login.dart';

class HomePage extends StatelessWidget {
  final Bloc<UserEvent, UserState> userBloc;

  const HomePage({
    Key? key,
    required this.userBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder(
            bloc: userBloc,
            builder: (context, state) {
              if (state is Loading) {
                return CircularProgressIndicator();
              }

              if (state is Logged) {
                return Text(state.user.email);
              }

              return Text('ERROR');
            },
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              userBloc.add(LoginEvent(Login(email: 'g', password: '')));
            },
            child: const Text('clica'),
          ),
        ],
      ),
    );
  }
}
