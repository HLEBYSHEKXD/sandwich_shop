class PricingRepository {
  // Prices in GBP (integer pounds) for simplicity
  static const int sixInchPrice = 7;
  static const int footlongPrice = 11;

  /// Returns the price per single sandwich depending on the size.
  int pricePerItem({required bool isFootlong}) {
    return isFootlong ? footlongPrice : sixInchPrice;
  }

  /// Calculates the total price for [quantity] sandwiches of the given size.
  int calculateTotal({required int quantity, required bool isFootlong}) {
    if (quantity <= 0) return 0;
    return pricePerItem(isFootlong: isFootlong) * quantity;
  }
}
