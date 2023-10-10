import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_operating_system_usecase.dart';

class DeviceInformation {
  Future<void> initPlatformState() async {
    if (Platform.isAndroid) {
      _getDeviceAndroidInformation();
    } else if (Platform.isIOS) {
      _getDeviceIosInformation();
    }
  }

  Future<void> _getDeviceAndroidInformation() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    SaveDeviceOperatingSystemUseCase(sharedPreferences: injector())(
        androidInfo.version.release);
  }

  Future<void> _getDeviceIosInformation() async {
    DeviceInfoPlugin deviceInformation = DeviceInfoPlugin();
    IosDeviceInfo iosInformation = await deviceInformation.iosInfo;
    SaveDeviceOperatingSystemUseCase(sharedPreferences: injector())(
        iosInformation.systemVersion ?? "");
  }
}
