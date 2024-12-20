import 'package:click_to_food/services/data/local_services/local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/cubits/check_user_cubit/check_user_cubit.dart';
import 'features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'features/auth/presentation/views/login_screen.dart';
import 'features/forget_password/presentation/cubits/forget_password_cubit.dart';
import 'features/otp_management/presentation/cubits/send_otp_cubit/send_otp_cubit.dart';
import 'features/user_registration/presentation/cubits/save_user_cubit/save_user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(create: (context) => CheckUserStateCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SendOTPCubit()),
        BlocProvider(create: (context) => SaveUserCubit()),
        BlocProvider(create: (context) => ForgetPasswrodCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
