// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get welcome => 'फ़्लटर में आपका स्वागत है';

  @override
  String get home => 'होम';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get pending => 'बाकी है';

  @override
  String get done => 'पूरा हुआ';

  @override
  String get addTask => 'कार्य जोड़ें';

  @override
  String taskCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कार्य',
      one: '1 कार्य',
      zero: 'कोई कार्य नहीं',
    );
    return '$_temp0';
  }
}
