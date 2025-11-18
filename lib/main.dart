import 'package:ecommerce_app/core/Helper_Functions/GenerateRoutes.dart';
import 'package:ecommerce_app/core/Helper_Functions/blocobserver.dart';
import 'package:ecommerce_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Features/Splash/presentation/Views/SplashView.dart';
import 'core/Services/Getit_Service.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
await SharedPrefernceSinglton.init();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
 setupServiceLocator();
 Bloc.observer=MyBlocObserver();

 runApp( FruitHub());
}

class FruitHub extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: AppBarTheme(color: Colors.white),
        fontFamily: 'cairo'
      ),
      localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],

      locale: Locale('ar'),
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoute,
    initialRoute: SplashView.routename,
      debugShowCheckedModeBanner: false,
    );
  }
}

