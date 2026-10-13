// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get welcome => 'ফ্লাটারে স্বাগতম';

  @override
  String get home => 'হোম';

  @override
  String get settings => 'সেটিংস';

  @override
  String get changeLanguage => 'ভাষা পরিবর্তন করুন';

  @override
  String get pending => 'বাকি আছে';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get addTask => 'কাজ যোগ করুন';

  @override
  String taskCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি কাজ',
      one: '১টি কাজ',
      zero: 'কোনো কাজ নেই',
    );
    return '$_temp0';
  }
}
