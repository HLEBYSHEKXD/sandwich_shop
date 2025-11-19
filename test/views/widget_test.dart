// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('Switch toggles sandwich type between six-inch and footlong',
      (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(const App());

    // The order summary includes the text 'sandwich(es):' and the item type
    // (initially 'footlong'). Find that text and verify it contains 'footlong'.
    final Finder orderSummary = find.textContaining('sandwich(es):');
    expect(orderSummary, findsOneWidget);

    Text summaryText = tester.widget<Text>(orderSummary);
    expect(summaryText.data ?? '', contains('footlong'));

    // Find the Switch and toggle it by tapping.
    final Finder switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);

    await tester.tap(switchFinder);
    await tester.pump();

    // After toggling, the order summary should update to show 'six-inch'.
    Text updatedSummaryText = tester.widget<Text>(orderSummary);
    expect(updatedSummaryText.data ?? '', contains('six-inch'));
  });
}
