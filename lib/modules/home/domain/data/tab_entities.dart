import 'package:flutter/material.dart';
import 'package:ifood_clone/modules/home/domain/entities/tab_entity.dart';

class TabEntities {
  static final tabEntities = [
    TabEntity(
      text: 'Início',
      view: const Center(child: Text('INICIO')),
    ),
    TabEntity(
      text: 'Restaurantes',
      view: const Center(child: Text('RESTAURANTES')),
    ),
    TabEntity(
      text: 'Mercados',
      view: const Center(child: Text('MERCADOS')),
    ),
    TabEntity(
      text: 'Bebidas',
      view: const Center(child: Text('BEBDIAS')),
    ),
    TabEntity(
      text: 'Farmácias',
      view: const Center(child: Text('FARMACIAS')),
    ),
    TabEntity(
      text: 'Pets',
      view: const Center(child: Text('PETS')),
    ),
  ];
}
