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
