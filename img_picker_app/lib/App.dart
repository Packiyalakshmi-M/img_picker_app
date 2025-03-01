import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:img_picker_app/Bloc/ImagePickerBloc/ImagePickerBloc.dart';
import 'package:img_picker_app/Pages/ImagePickerScreen/ImagePickerScreen.dart';
import 'package:img_picker_app/Pages/Services/ImagePickerService/IImagePickerService.dart';
import 'package:img_picker_app/main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePickerBloc(getIt<IImagePickerService>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Image Picker',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
