# Fitness & Nutrition Frontend Core

What was added:
- Env loading via flutter_dotenv (.env is referenced in pubspec -> assets)
- Global theme using colors:
  - primary: #2346D6
  - secondary: #23C667
  - accent: #F47C1F
- Provider-based AppState with WebSocket connection placeholder
- Auth flow:
  - Splash (/splash) attempts auto-login via shared_preferences token
  - Login (/login) and Register (/register) screens
  - AuthRepository for /api/auth/login, /api/auth/register, /api/users/me
  - AuthProvider to manage token, user profile, persistent storage
  - Role-based landing: professional -> /clients, user/gym -> /dashboard
  - Logout from profile menu
- Simple Router (Navigator 2.0) with routes:
  /splash, /login, /register, /dashboard, /workouts, /diet, /clients, /notifications, /settings, /subscriptions, /reports
- Responsive BaseScaffold:
  - Top bar (title, role badge, ws status, notifications icon, profile menu)
  - Side nav on wide screens, bottom nav on mobile
  - Role-aware menu entries: Clients appears for Professional/Gym; all roles see Workouts, Diet, Reports, Subscriptions, Settings
- Role-aware Dashboard:
  - Quick info cards and action tiles tailored for User, Professional, and Gym personas
- Placeholder pages per module (Workouts, Diet, Clients, Subscriptions, Reports, Notifications, Settings)

How to run:
1) Provide an .env file at project root (see .env.example)
2) flutter pub get
3) flutter run

Notes:
- http and web_socket_channel dependencies are added for REST/WS/notifications integrations.
- Required .env variables:
  - API_BASE_URL (e.g., https://your-backend-host)
  - WS_BASE_URL (e.g., wss://your-backend-host)
- The token is stored locally using shared_preferences.
- After successful login, app connects to WebSocket: /api/notifications/ws?token=<JWT>.
