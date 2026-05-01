import 'package:flutter_test/flutter_test.dart';
import 'package:my_protoflue/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.byType(PortfolioApp), findsOneWidget);
  });
}
