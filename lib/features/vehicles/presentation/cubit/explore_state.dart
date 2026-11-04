import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_entity.dart';

part 'explore_state.freezed.dart';

enum ExploreStatus { initial, loading, loaded, error }

@freezed
abstract class ExploreState with _$ExploreState {
  const factory ExploreState({
    @Default(ExploreStatus.initial) ExploreStatus status,
    @Default([]) List<VehicleEntity> allVehicles,
    @Default([]) List<VehicleEntity> displayedVehicles,
    @Default('Tous les véhicules') String selectedCategory,
    @Default('Airport VIP P2') String selectedBranch,
    @Default(true) bool returnSameLocation,
    @Default('Aéroport Tunis-Carthage (Terminal 1)') String pickupLocation,
    @Default('14 Oct, 10:00') String startDate,
    @Default('18 Oct, 18:00') String endDate,
    @Default(4) int rentalDays,
    @Default(<String>{}) Set<String> favoriteIds,
    @Default(0) int activeBottomNavIndex,
    @Default('') String searchQuery,
    @Default('Popularité') String sortOption,
    String? errorMessage,
  }) = _ExploreState;
}
