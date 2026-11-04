import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../../domain/repositories/vehicle_repository.dart';
import 'explore_state.dart';

/// Cubit gérant l'état réactif de l'écran d'exploration et découverte de véhicules.
class ExploreCubit extends Cubit<ExploreState> {
  final VehicleRepository _repository;

  ExploreCubit({required VehicleRepository repository})
      : _repository = repository,
        super(const ExploreState());

  /// Initialise et charge les véhicules disponibles.
  Future<void> loadVehicles() async {
    emit(state.copyWith(status: ExploreStatus.loading));
    try {
      final vehicles = await _repository.getVehicles();
      emit(state.copyWith(
        status: ExploreStatus.loaded,
        allVehicles: vehicles,
        displayedVehicles: _applyFilters(
          vehicles: vehicles,
          category: state.selectedCategory,
          branch: state.selectedBranch,
          query: state.searchQuery,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ExploreStatus.error,
        errorMessage: 'Impossible de charger la flotte de véhicules: $e',
      ));
    }
  }

  /// Filtre les véhicules par catégorie sélectionnée.
  void selectCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(
      selectedCategory: category,
      displayedVehicles: _applyFilters(
        vehicles: state.allVehicles,
        category: category,
        branch: state.selectedBranch,
        query: state.searchQuery,
      ),
    ));
  }

  /// Change l'agence de retrait sélectionnée (Aéroport VIP vs Berges du Lac).
  void selectBranch(String branch) {
    if (state.selectedBranch == branch) return;
    emit(state.copyWith(
      selectedBranch: branch,
      displayedVehicles: _applyFilters(
        vehicles: state.allVehicles,
        category: state.selectedCategory,
        branch: branch,
        query: state.searchQuery,
      ),
    ));
  }

  /// Active/Désactive le retour au même point de départ.
  void toggleReturnSameLocation() {
    emit(state.copyWith(returnSameLocation: !state.returnSameLocation));
  }

  /// Ajoute ou retire un véhicule des favoris.
  void toggleFavorite(String vehicleId) {
    final updatedFavorites = Set<String>.from(state.favoriteIds);
    if (updatedFavorites.contains(vehicleId)) {
      updatedFavorites.remove(vehicleId);
    } else {
      updatedFavorites.add(vehicleId);
    }
    emit(state.copyWith(favoriteIds: updatedFavorites));
  }

  /// Met à jour l'onglet actif dans la barre de navigation inférieure.
  void changeBottomNav(int index) {
    if (state.activeBottomNavIndex == index) return;
    emit(state.copyWith(activeBottomNavIndex: index));
  }

  /// Recherche textuelle dynamique par marque ou modèle.
  void updateSearchQuery(String query) {
    emit(state.copyWith(
      searchQuery: query,
      displayedVehicles: _applyFilters(
        vehicles: state.allVehicles,
        category: state.selectedCategory,
        branch: state.selectedBranch,
        query: query,
      ),
    ));
  }

  /// Trie la liste des véhicules (Prix croissant, décroissant, popularité).
  void updateSortOption(String sort) {
    final sortedList = List<VehicleEntity>.from(state.displayedVehicles);
    if (sort == 'Prix croissant') {
      sortedList.sort((a, b) => a.dailyPriceTnd.compareTo(b.dailyPriceTnd));
    } else if (sort == 'Prix décroissant') {
      sortedList.sort((a, b) => b.dailyPriceTnd.compareTo(a.dailyPriceTnd));
    } else {
      // Re-appliquer l'ordre par défaut
      emit(state.copyWith(
        sortOption: sort,
        displayedVehicles: _applyFilters(
          vehicles: state.allVehicles,
          category: state.selectedCategory,
          branch: state.selectedBranch,
          query: state.searchQuery,
        ),
      ));
      return;
    }
    emit(state.copyWith(sortOption: sort, displayedVehicles: sortedList));
  }

  List<VehicleEntity> _applyFilters({
    required List<VehicleEntity> vehicles,
    required String category,
    required String branch,
    required String query,
  }) {
    return vehicles.where((v) {
      final matchesCategory = category == 'Tous les véhicules' ||
          category == 'All Vehicles' ||
          v.category.toLowerCase().contains(category.toLowerCase());

      final matchesBranch =
          v.branchAvailability.toLowerCase().contains(branch.toLowerCase());

      final matchesQuery = query.isEmpty ||
          v.fullName.toLowerCase().contains(query.toLowerCase()) ||
          v.category.toLowerCase().contains(query.toLowerCase());

      return matchesCategory && matchesBranch && matchesQuery;
    }).toList();
  }
}
