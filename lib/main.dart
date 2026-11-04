import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repositories/mock_auth_repository.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'features/vehicles/data/repositories/mock_vehicle_repository.dart';
import 'features/vehicles/presentation/cubit/explore_cubit.dart';

void main() {
  runApp(const AutoLocApp());
}

class AutoLocApp extends StatelessWidget {
  const AutoLocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            authRepository: MockAuthRepository(),
          ),
        ),
        BlocProvider<ExploreCubit>(
          create: (context) => ExploreCubit(
            repository: MockVehicleRepository(),
          )..loadVehicles(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
