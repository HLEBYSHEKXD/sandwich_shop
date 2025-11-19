import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    final PricingRepository pricing = PricingRepository();

    test('pricePerItem returns correct price for six-inch', () {
      expect(pricing.pricePerItem(isFootlong: false), equals(7));
    });

    test('pricePerItem returns correct price for footlong', () {
      expect(pricing.pricePerItem(isFootlong: true), equals(11));
    });

    test('calculateTotal returns 0 for zero quantity', () {
      expect(pricing.calculateTotal(quantity: 0, isFootlong: true), equals(0));
    });

    test('calculateTotal computes total correctly for six-inch', () {
      expect(pricing.calculateTotal(quantity: 3, isFootlong: false), equals(21));
    });

    test('calculateTotal computes total correctly for footlong', () {
      expect(pricing.calculateTotal(quantity: 2, isFootlong: true), equals(22));
    });
  });
}
