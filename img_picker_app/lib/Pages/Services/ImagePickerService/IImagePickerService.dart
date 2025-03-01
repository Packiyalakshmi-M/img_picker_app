import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class IImagePickerService {
  Future<File?> pickImage({required ImageSource imageSource});
}
