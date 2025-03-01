import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerBloc.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerState.dart';
import 'package:img_picker_app/Reusables/CustomBottomSheet/CustomBottomSheet.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery and Camera Access'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
              child: const Text('Select Image from Gallery or Camera'),
              onPressed: () => _showPicker(context),
            ),
            const SizedBox(height: 20),
            BlocConsumer<ImagePickerBloc, ImagePickerState>(
              listener: (context, state) {
                if (state is ImagePickerFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is ImagePickerLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ImagePickerSuccess) {
                  return Image.file(state.imageFile, height: 200, width: 300);
                } else {
                  return const Text('No Image Selected');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
