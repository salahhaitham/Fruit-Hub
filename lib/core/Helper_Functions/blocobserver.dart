import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1, // عدد الأسطر اللي بتوضح منين جاي الـ log
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );


  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('🔄 ${bloc.runtimeType} changed: ${change}');
  }


}
