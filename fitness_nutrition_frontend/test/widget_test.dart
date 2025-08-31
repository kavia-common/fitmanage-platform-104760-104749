import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_nutrition_frontend/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:fitness_nutrition_frontend/state/app_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App boots and shows FitManage title or splash elements', (WidgetTester tester) async {
    dotenv.testLoad(fileInput: 'API_BASE_URL=http://localhost:8000\nWS_BASE_URL=ws://localhost:8000\n');

    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AppState())],
        child: const MyApp(),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));
    // We either see title from AppBar (if routed quickly) or splash elements
    expect(find.text('FitManage'), findsWidgets);
  });
}
