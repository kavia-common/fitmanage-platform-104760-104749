# Fitness & Nutrition Frontend Core

What was added:
- Env loading via flutter_dotenv (.env is referenced in pubspec -> assets)
- Global theme using colors:
  - primary: #2346D6
  - secondary: #23C667
  - accent: #F47C1F
- Provider-based AppState with WebSocket connection placeholder
- Simple Router (Navigator 2.0) with routes:
  /dashboard, /workouts, /diet, /clients, /notifications, /settings
- Responsive BaseScaffold:
  - Top bar (title, ws status, notifications icon, profile menu)
  - Side nav on wide screens, bottom nav on mobile
- Placeholder pages per module

How to run:
1) Provide an .env file at project root (see .env.example)
2) flutter pub get
3) flutter run

Notes:
- http and web_socket_channel dependencies are added for REST/WS integrations.
- Integrate API calls in the respective module pages and wire to AppState for auth.
