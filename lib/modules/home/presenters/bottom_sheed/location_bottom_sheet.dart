import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/core/widgets/all_screen_text.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_home_page_use_case.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/arrow_down_widget.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/my_location_widget.dart';
import 'package:ifood_clone/modules/home/presenters/widgets/search_input.dart';

class LocationBottomSheet extends StatelessWidget {
  final IHomePageUseCase homeUseCase;
  final Size size;
  const LocationBottomSheet({
    super.key,
    required this.homeUseCase,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height - 50,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Modular.to.pop(),
              child: const ArrowDownWidget(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
              child: AllScreenText(
                size: size,
                text: 'Onde você quer receber seu pedido ?',
              ),
            ),
            Form(
              key: homeUseCase.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: SearchInput(
                onChanged: (val) => homeUseCase.searchAddress.address(val),
                validator: (_) => homeUseCase.searchAddress.address.validator(),
                onFieldSubmitted: (_) => homeUseCase.validate(),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            MyLocationWidget(
              homeUseCase: homeUseCase,
            )
          ],
        ),
      ),
    );
  }
}
