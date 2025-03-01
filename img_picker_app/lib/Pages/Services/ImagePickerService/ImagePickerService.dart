import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:img_picker_app/Pages/Services/ImagePickerService/IImagePickerService.dart';

class ImagePickerService implements IImagePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<File?> pickImage({required ImageSource imageSource}) async {
    final pickedFile = await _imagePicker.pickImage(source: imageSource);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
