class UnitModel {
  String unitName;
  int unitLevel;
  double damageAmount;
  double maxHp;
  double currentHp;

  UnitModel({
    required this.unitName,
    required this.unitLevel,
    required this.damageAmount,
    required this.maxHp,
    required this.currentHp,
  });

  // Takes a damageAmount to update [currentHp] of the unit
  void takeDamage(double damageDone) {
    currentHp = currentHp - damageDone;
  }
}
