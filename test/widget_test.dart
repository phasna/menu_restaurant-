import 'package:flutter_test/flutter_test.dart';

import 'package:restaurant/main.dart';

void main() {
  testWidgets('les categories et les plats s\'affichent', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApp());

    expect(find.text('Menu du Restaurant X'), findsOneWidget);
    expect(find.text('Formule Burger'), findsOneWidget);

    // on clique sur Desserts
    await tester.tap(find.text('Desserts'));
    await tester.pumpAndSettle();

    expect(find.text('Tiramisu'), findsOneWidget);
    expect(find.text('Formule Burger'), findsNothing);
  });
}
