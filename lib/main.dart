import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iiitdmj/pages/auth_page.dart';
import 'package:iiitdmj/pages/home_page.dart';
import 'package:iiitdmj/pages/splash_page.dart';
import 'package:iiitdmj/themes/dark_mode.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('testBox');
  WidgetsFlutterBinding.ensureInitialized();

  const String supabaseUrl = "https://yyivbsxjptvxhmxtrqug.supabase.co";
  const String supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5aXZic3hqcHR2eGhteHRycXVnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ5NDgzMjAsImV4cCI6MjAyMDUyNDMyMH0.vnxZenLPuh9kXe2xcTYb4FMVCmTgKy7EcvE-CBexvP4";

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(ChangeNotifierProvider(
    create: (context)=>ThemeProvider(),
    child: const MyApp())
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        darkTheme: darkMode,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => const SplashPage(),
          '/login': (_) => const AuthScreen(),
          '/home': (_) => const HomePage(),
        },
      );
  }
}