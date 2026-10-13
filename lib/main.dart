import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale currentLocale = const Locale('en');

  @override
  void initState() {
    super.initState();
    loadLanguage();
  }

  // Saved language load করবে
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString('languageCode');

    if (languageCode != null) {
      setState(() {
        currentLocale = Locale(languageCode);
      });
    }
  }

  // Language change + save
  Future<void> changeLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('languageCode', locale.languageCode);

    setState(() {
      currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      locale: currentLocale,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: AppLocalizations.supportedLocales,

      home: HomePage(
        currentLocale: currentLocale,
        onChangeLanguage: changeLanguage,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Locale currentLocale;
  final Function(Locale) onChangeLanguage;

  const HomePage({
    super.key,
    required this.currentLocale,
    required this.onChangeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.home),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    currentLocale: currentLocale,
                    onChangeLanguage: onChangeLanguage,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        localizations.welcome,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 25),

      Text(
        localizations.pending,
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 15),

      Text(
        localizations.done,
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 25),

      ElevatedButton(
        onPressed: () {},
        child: Text(localizations.addTask),
      ),
    ],
  ),
),

    );
  }
}
