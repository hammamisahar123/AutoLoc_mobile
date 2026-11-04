import '../entities/vehicle_entity.dart';

/// Contrat du référentiel pour la gestion de la flotte de véhicules.
abstract class VehicleRepository {
  /// Récupère l'ensemble de la flotte de véhicules disponibles.
  Future<List<VehicleEntity>> getVehicles();

  /// Filtre les véhicules selon la catégorie et l'agence.
  Future<List<VehicleEntity>> filterVehicles({
    String? category,
    String? branch,
    String? searchQuery,
  });

  /// Recherche un véhicule par son identifiant unique.
  Future<VehicleEntity?> getVehicleById(String id);
}
