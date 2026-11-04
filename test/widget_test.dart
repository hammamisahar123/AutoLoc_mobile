import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_theme.dart';
import 'package:mobileautoloc/features/vehicles/data/repositories/mock_vehicle_repository.dart';
import 'package:mobileautoloc/features/vehicles/presentation/cubit/explore_cubit.dart';
import 'package:mobileautoloc/features/vehicles/presentation/pages/explore_page.dart';

void main() {
  testWidgets('ExplorePage renders fleet and concierge search', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      BlocProvider<ExploreCubit>(
        create: (_) => ExploreCubit(
          repository: MockVehicleRepository(),
        )..loadVehicles(),
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => MaterialApp(
            theme: AppTheme.lightTheme,
            home: const ExplorePage(),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('Flotte Disponible'), findsOneWidget);
    expect(find.text('Rechercher un véhicule VIP'), findsOneWidget);
  });
}
