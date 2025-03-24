import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/service/account_service.dart';
import 'data/repository/account_repository.dart';
import 'data/repository/camera_repository.dart';
import 'ui/home/home_screen.dart';
import 'ui/login/login_page.dart';
import 'ui/_core/themes/themes.dart';
import 'ui/home/view_model/home_viewmodel.dart';
import 'ui/registration/registration_screen.dart';
import 'ui/registration/view_model/registration_viewmodel.dart';

class BancoDouroApp extends StatelessWidget {
  const BancoDouroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(
              AccountRepository(AccountService()),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => RegistrationViewModel(CameraRepository()),
          ),
        ],
    child: MaterialApp(
      title: 'Banco Douro',
      theme: appThemeLight,
      routes: {
        "login": (context) => const LoginScreen(),
        "registration": (context) => const RegistrationScreen(),
        "home": (context) => const HomeScreen(),
      },
      initialRoute: "login",
      //home: const LoginPage(title: 'Banco Douro App'),
    ));
  }
}