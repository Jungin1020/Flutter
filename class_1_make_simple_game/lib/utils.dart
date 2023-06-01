import 'dart:math';

import 'heroes/hero.dart';

void setHeroRandomMoney() {
  Hero.money = Random().nextInt(1000);
}
