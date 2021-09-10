class PlayerUnit {
  String unitName;
  int unitLevel;
  double damageAmount;
  double maxHp;
  double currentHp;

  PlayerUnit(
    this.unitName,
    this.unitLevel,
    this.damageAmount,
    this.maxHp,
    this.currentHp,
  );

  // Takes a damageAmount to update [currentHp] of the unit
  void takeDamage(double damageDone) {
    currentHp = currentHp - damageDone;
  }
}
