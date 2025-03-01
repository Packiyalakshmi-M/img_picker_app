# Flutter - Image Picker App

This project is a Flutter application that demonstrates how to pick images from the gallery or camera using the image_picker package. It includes functionality for selecting, displaying, and managing images efficiently. The app follows the BLoC state management pattern to handle UI updates and state changes effectively.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Author](#author)

## Features

- **Pick Images from Gallery or Camera:** Allows users to choose images from their device's gallery or take a new picture using the camera.
- **State Management with BLoC:** Uses BLoC pattern for efficient state handling.
- **Dependency Injection:** Uses get_it package for dependency injection.
- **Display Picked Images:** Shows selected images dynamically on the UI.
- **Cross-platform Support:** Works seamlessly on both iOS and Android devices.

## Technologies Used

- **Programming Language:** Dart
- **Framework:** Flutter
- **State Management:** flutter_bloc
- **Image Picker Library:** image_picker
- **Dependency Injection:** get_it
- **IDE:** Android Studio / Visual Studio Code
- **Version Control:** Git

## Installation

Follow these steps to get the project up and running locally:

```bash
# Clone the repository
git clone https://github.com/Packiyalakshmi-M/img_picker_app.git

# Navigate into the project directory
cd img_picker_app

# Install dependencies
flutter pub get
```

## Usage

The following snippet demonstrates how the app picks an image using the image_picker package inside a BLoC-based state management approach:

### Image Picker Service

```

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

```

### Image Picker Bloc

```

// Image Picker Event

import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickImageFromGallery extends ImagePickerEvent {}

class PickImageFromCamera extends ImagePickerEvent {}


// Image Picker State

import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class ImagePickerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerLoading extends ImagePickerState {}

class ImagePickerSuccess extends ImagePickerState {
  final File imageFile;
  ImagePickerSuccess(this.imageFile);

  @override
  List<Object?> get props => [imageFile];
}

class ImagePickerFailure extends ImagePickerState {
  final String message;
  ImagePickerFailure(this.message);

  @override
  List<Object?> get props => [message];
}


// Image Picker Bloc

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerEvent.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerState.dart';
import 'package:img_picker_app/Pages/Services/ImagePickerService/IImagePickerService.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final IImagePickerService _imagePickerService;

  ImagePickerBloc(this._imagePickerService) : super(ImagePickerInitial()) {
    on<PickImageFromGallery>(_onPickImageFromGallery);
    on<PickImageFromCamera>(_onPickImageFromCamera);
  }

  Future<void> _onPickImageFromGallery(
      PickImageFromGallery event, Emitter<ImagePickerState> emit) async {
    emit(ImagePickerLoading());
    final image =
        await _imagePickerService.pickImage(imageSource: ImageSource.gallery);
    if (image != null) {
      emit(ImagePickerSuccess(image));
    } else {
      emit(ImagePickerFailure('No image selected.'));
    }
  }

  Future<void> _onPickImageFromCamera(
      PickImageFromCamera event, Emitter<ImagePickerState> emit) async {
    emit(ImagePickerLoading());
    final image =
        await _imagePickerService.pickImage(imageSource: ImageSource.camera);
    if (image != null) {
      emit(ImagePickerSuccess(image));
    } else {
      emit(ImagePickerFailure('No image captured.'));
    }
  }
}


```

## License

This project is open source and available under the MIT License.

## Author

- Packiyalakshmi Murugan
- [LinkedIn Link](https://www.linkedin.com/in/packiyalakshmi-m-7a9844210/)
- [Github link](https://github.com/Packiyalakshmi-M/)
