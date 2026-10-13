// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome to Flutter';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get pending => 'Pending';

  @override
  String get done => 'Done';

  @override
  String get addTask => 'Add Task';

  @override
  String taskCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tasks',
      one: '1 task',
      zero: 'No tasks',
    );
    return '$_temp0';
  }
}
