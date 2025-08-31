import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_nutrition_frontend/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:fitness_nutrition_frontend/state/app_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App boots and shows FitManage title in AppBar', (WidgetTester tester) async {
    dotenv.testLoad(fileInput: 'API_BASE_URL=http://localhost:8000\nWS_BASE_URL=ws://localhost:8000\n');

    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AppState())],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('FitManage'), findsOneWidget);
  });
}
