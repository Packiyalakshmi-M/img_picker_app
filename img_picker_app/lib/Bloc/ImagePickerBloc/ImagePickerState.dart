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
