import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:img_picker_app/App.dart';
import 'package:img_picker_app/Pages/Services/ImagePickerService/IImagePickerService.dart';
import 'package:img_picker_app/Pages/Services/ImagePickerService/ImagePickerService.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<IImagePickerService>(ImagePickerService());
}

void main() {
  setupLocator();
  runApp(const App());
}
