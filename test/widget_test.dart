import 'package:flutter_test/flutter_test.dart';
import 'package:mobileautoloc/main.dart';

void main() {
  testWidgets('AutoLocApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AutoLocApp());
    expect(find.text('AutoLoc Core Ready'), findsOneWidget);
  });
}
