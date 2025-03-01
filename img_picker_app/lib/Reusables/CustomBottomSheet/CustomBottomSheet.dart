import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerBloc.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerEvent.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              context.read<ImagePickerBloc>().add(PickImageFromGallery());
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Camera'),
            onTap: () {
              context.read<ImagePickerBloc>().add(PickImageFromCamera());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
