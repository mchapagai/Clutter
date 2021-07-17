import 'package:clutter/core/preferences_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group(
    'Test PreferencesHelper',
    () {
      PreferencesHelper? sharedPreferences = PreferencesHelper();

      setUp(
        () async {
          SharedPreferences.setMockInitialValues({});
          await sharedPreferences.initPreferences();
        },
      );

      test(
        'Set a value and get a value back from SharedPreferences',
        () {
          sharedPreferences.setValue<int>(key: 'testKey', value: 4);

          expect(
            sharedPreferences.getValue<int>(
              key: "testKey",
              defaultValue: -1,
            ),
            equals(4),
          );

          sharedPreferences.setValue<String>(
            key: 'theme',
            value: "clutter",
          );

          expect(
            sharedPreferences.getValue<String>(
              key: 'theme',
              defaultValue: "nope",
            ),
            equals("clutter"),
          );

          sharedPreferences.setValue<bool>(key: 'testKey', value: true);

          expect(
            sharedPreferences.getValue<bool>(
              key: 'testKey',
              defaultValue: false,
            ),
            equals(true),
          );

          sharedPreferences.setValue<double>(
            key: "testDouble",
            value: 1.5,
          );

          expect(
            sharedPreferences.getValue<double>(
              key: "testDouble",
              defaultValue: 0,
            ),
            equals(1.5),
          );
        },
      );

      test(
        'Removing a value should return null or a default value',
        () {
          sharedPreferences.removeValue(
            key: 'theme',
          );

          expect(
            sharedPreferences.getValue<int>(
              key: 'theme',
              defaultValue: 0,
            ),
            equals(0),
          );

          expect(
            sharedPreferences.getValue<int>(
              key: 'theme',
              defaultValue: -1,
            ),
            equals(-1),
          );
        },
      );

      test(
        'SharedPreferencesException: Setting value for  unknown type',
        () {
          expect(
            () => sharedPreferences.setValue<List>(
              key: '',
              value: [],
            ),
            throwsException,
          );
        },
      );
    },
  );
}
