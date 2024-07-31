import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This is a utility class that provides static methods to interact with
/// SharedPreferences and FlutterSecureStorage.
class SharedPreferencesfHelper {
  // private constructor as I don't want to allow creating an instance of this
  // class itself.
  SharedPreferencesfHelper._();

  // A private constructor prevents the creation of instances of this class,
  // as it is designed to provide only static methods.

// SharedPreferences Methods:
// These methods interact with SharedPreferences for storing and retrieving
// simple data types.

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    // Removes a value associated with the given key from SharedPreferences.
    // await SharedPreferencesfHelper.removeData('username');

    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    // Clears all data from SharedPreferences.
    // await SharedPreferencesfHelper.clearAllData();

    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    // Saves a value with a specified key in SharedPreferences. It handles
    // different data types (String, int, bool, double) by checking the
    // runtime type of the value.
    // await SharedPreferencesfHelper.setData('username', 'JohnDoe');

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    // Retrieves a boolean value associated with the given key. If the key
    // doesn't exist, it returns false.
    // bool isLoggedIn = await SharedPreferencesfHelper.getBool('isLoggedIn');

    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    // Retrieves a double value associated with the given key. If the key
    // doesn't exist, it returns 0.0.
    // double userBalance = await SharedPreferencesfHelper.getDouble('userBalance');

    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    // Retrieves an integer value associated with the given key. If the key
    // doesn't exist, it returns 0.
    // int userScore = await SharedPreferencesfHelper.getInt('userScore');

    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    // Retrieves a string value associated with the given key. If the key
    // doesn't exist, it returns an empty string.
    // String username = await SharedPreferencesfHelper.getString('username');
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

// FlutterSecureStorage Methods:
// These methods interact with FlutterSecureStorage for secure data storage.

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    // Stores a string value securely with the given key.
    // await SharedPreferencesfHelper.setSecuredString('apiToken', 'secureToken123');

    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    // Retrieves a securely stored string value associated with the given key.
    // String apiToken = await SharedPreferencesfHelper.getSecuredString('apiToken');
    // String password = await SharedPreferencesfHelper.getSecuredString('password');
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    // Clears all data stored in FlutterSecureStorage.
    // await SharedPreferencesfHelper.clearAllSecuredData();
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
// Data Security: Use FlutterSecureStorage for storing sensitive information
// like tokens, passwords, etc.

// Asynchronous Operations: All methods interacting with storage
// are asynchronous. Ensure you handle them appropriately, especially in UI
// code, to avoid blocking the main thread.


/// When to Use SharedPreferencesfHelper ?

// User Preferences:
// Store user preferences, such as theme settings, language, and other
// customizable options.

// User Authentication:
// Store authentication tokens, session information, or login status securely.

// App State:
// Store app state information like the last visited screen, user session data,
// or app settings.

// Caching:
// Store small amounts of data temporarily, like user profile data or API
// responses, for quick access.

// Settings and Configuration:
// Store settings and configurations, such as API base URLs, feature toggles,
// or debug options.


/// Best Practices :

// Security:
// Use FlutterSecureStorage for sensitive information such as authentication
// tokens, passwords, and user credentials. This ensures data is
// encrypted and secure.

// Data Size:
// SharedPreferences is not suitable for storing large amounts of data. It
// is designed for lightweight storage (Temp Data), like settings or
// simple key-value pairs.
// If you need to store large amounts of data, consider using
// SQLite, Hive or a database.

// Asynchronous Operations:
// Since all storage operations are asynchronous, always use await and
// handle potential delays or errors properly to avoid blocking the UI thread.

// Data Expiry and Cleanup:
// Implement a mechanism to remove outdated or unused data to avoid
// bloating the storage.

// Fallbacks and Defaults:
// Always provide default values when retrieving data to handle cases
// where data might not be present.