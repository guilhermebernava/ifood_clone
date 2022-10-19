import 'package:flutter/material.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/search_input.dart';

class HomePage extends StatelessWidget {
  final IHomePageUseCase homeUseCase;

  const HomePage({
    Key? key,
    required this.homeUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // StreetWidget(
          //   size: size,
          //   locationBloc: locationBloc,
          //   onTap: () {
          //     BottomSheetServices.showAllScreenBottomSheet(
          //       Container(
          //         height: size.height - 50,
          //         color: Colors.white,
          //         child: Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               const ArrowDownWidget(),
          //               SizedBox(
          //                 width: size.width,
          //                 child: const Text(
          //                   'Onde você quer receber seu pedido ?',
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       context,
          //     );
          //   },
          // ),
          const SizedBox(
            height: 200,
          ),
          Form(
            key: homeUseCase.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: SearchInput(
              onChanged: (val) => homeUseCase.searchAddress.address(val),
              validator: (_) => homeUseCase.searchAddress.address.validator(),
              onFieldSubmitted: (_) => homeUseCase.validate(),
            ),
          )
        ],
      ),
    );
  }
}
