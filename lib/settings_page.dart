import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  final Locale currentLocale;
  final Function(Locale) onChangeLanguage;

  const SettingsPage({
    super.key,
    required this.currentLocale,
    required this.onChangeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.changeLanguage,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            DropdownButton<Locale>(
              value: currentLocale,

              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('bn'), child: Text('বাংলা')),
                DropdownMenuItem(value: Locale('hi'), child: Text('हिन्दी')),
              ],
              onChanged: (Locale? locale) {
                if (locale != null) {
                  onChangeLanguage(locale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
