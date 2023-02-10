import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHelpScout {
  static const MethodChannel _channel =
      const MethodChannel('kelvinforteta.dev/flutter_help_scout');

  /// This is your beacon ID
  final String beaconId;

  /// This is the user's name
  final String? name;

  /// This is the user's email address
  final String? email;

  /// This is the user's avatar/photo
  final String? avatar;

  /// This is the user's company
  final String? company;

  /// This is the user's job title
  final String? jobTitle;

  FlutterHelpScout(
      {this.email,
      this.name,
      required this.beaconId,
      this.avatar,
      this.company,
      this.jobTitle});

  /// This method will initialize the beacon.
  Future<String?> initialize() async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
      'email': email,
      'name': name,
      'avatar': avatar,
      'jobTitle': jobTitle,
      'company': company,
    };

    try {
      final String? result = await _channel.invokeMethod(
        'initialize',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to initialize beacon: ${e.toString()}');
      throw e;
    }
  }

  /// Once you’ve initialized Beacon, you’re ready to interact with it.
  /// Whenever you want to invoke Beacon, use the code below to
  /// display the Beacon user interface.

  Future<String?> open({required String beaconId}) async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
    };

    try {
      final String? result = await _channel.invokeMethod(
        'openBeacon',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<String?> openSearch({
    required String query,
    required String beaconId,
  }) async {
    var data = <String, dynamic>{
      'query': query,
      'beaconId': beaconId,
    };

    try {
      final String? result = await _channel.invokeMethod(
        'openBeaconSearch',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<String?> openArticle({
    required String articleId,
    required String beaconId,
  }) async {
    var data = <String, dynamic>{
      'articleId': articleId,
      'beaconId': beaconId,
    };

    try {
      final String? result = await _channel.invokeMethod(
        'openBeaconArticle',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<String?> openContactForm({required String beaconId}) async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
    };
    try {
      final String? result = await _channel.invokeMethod(
        'openBeaconContactForm',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<String?> openPreviousMessages({required String beaconId}) async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
    };
    try {
      final String? result = await _channel.invokeMethod(
        'openBeaconPreviousMessages',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<String?> openChat({required String beaconId}) async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
    };
    try {
      final String? result = await _channel.invokeMethod(
        'openBeaconChat',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<String?> openAsk({required String beaconId}) async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
    };
    try {
      final String? result = await _channel.invokeMethod(
        'openBeaconAsk',
        data,
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  /// Calling this method resets the current Beacon state,
  /// thereby deleting all the user data: email, name, user attributes,
  /// push token and resets the Beacon Device ID. It won’t
  /// remove the Beacon ID, or any local config overrides.

  Future<String?> logout() async {
    try {
      final String? result = await _channel.invokeMethod(
        'logoutBeacon',
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  /// This method wipes all data from the Beacon,
  /// including the Beacon ID. This may be useful if
  /// you are using different Beacons in different parts of your app.

  Future<String?> clear() async {
    try {
      final String? result = await _channel.invokeMethod(
        'clearBeacon',
      );

      return result;
    } on PlatformException catch (e) {
      print('Unable to open beacon: ${e.toString()}');
      throw e;
    }
  }

  Future<void> setCustomerPropery(
      {required String key, required String value}) async {
    var data = <String, dynamic>{
      'key': key,
      'value': value,
    };

    try {
      await _channel.invokeMethod(
        'setCustomerProperty',
        data,
      );
    } on PlatformException catch (e) {
      print('Unable to set customer property: ${e.toString()}');
      throw e;
    }
  }

  Future<void> removeCustomerProperty({required String key}) async {
    var data = <String, dynamic>{
      'key': key,
    };

    try {
      await _channel.invokeMethod(
        'removeCustomerProperty',
        data,
      );
    } on PlatformException catch (e) {
      print('Unable to remove customer property: ${e.toString()}');
      throw e;
    }
  }

  Future<void> clearCustomerProperties() async {
    try {
      await _channel.invokeMethod(
        'clearCustomerProperties',
      );
    } on PlatformException catch (e) {
      print('Unable to clear customer properties: ${e.toString()}');
      throw e;
    }
  }
}
