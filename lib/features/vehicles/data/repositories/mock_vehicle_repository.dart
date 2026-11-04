import '../../domain/entities/vehicle_entity.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../models/vehicle_model.dart';

/// Implémentation fictive haute-fidélité pour la découverte de véhicules AutoLoc.
class MockVehicleRepository implements VehicleRepository {
  static const List<VehicleModel> _mockFleet = [
    VehicleModel(
      id: 'veh_01',
      brand: 'Mercedes-Benz',
      model: 'CLA Coupé',
      fullName: 'Mercedes-Benz CLA Coupé',
      category: 'Luxury / VIP',
      seriesTag: 'Model 2024',
      modelYear: 2024,
      dailyPriceTnd: 240.0,
      totalPriceTnd: 960.0,
      rentalDays: 4,
      transmission: 'Automatique',
      seats: 5,
      fuelType: 'Diesel',
      keyFeature: 'KM Illimité',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDJS-dVPa-ysaWIhWBwXwzjSvIVmkd0DYw9Oek6GuEcprwHIIiPd8xAaTdIDGswkgdhD_6cFQ5kJIWwInqQr9lPpmfN4RJhr9awYdtQmnmYHk-0Educ7el4QZkrRpmTJpNRjkTBt7zXjMTaJn34hlf0bDj2J5VtRXJ0aF3ssDit6dixyEPnD_DE2_JsF4jn5id22FxrlzVWQXG6DTrUrzd3FCzHktxlGAgT4D4QbxHD',
      floatingBadgeText: 'Confirmation Immédiate',
      isInstantConfirmation: true,
      isAvailable: true,
      branchAvailability: 'Airport VIP P2',
    ),
    VehicleModel(
      id: 'veh_02',
      brand: 'Peugeot',
      model: '3008 GT Line',
      fullName: 'Peugeot 3008 GT Line',
      category: 'SUV & 4x4',
      seriesTag: 'GT Line',
      modelYear: 2024,
      dailyPriceTnd: 185.0,
      totalPriceTnd: 740.0,
      rentalDays: 4,
      transmission: 'Automatique',
      seats: 5,
      fuelType: 'Diesel',
      keyFeature: 'Coffre 520L',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuByWp0lyUrRgU3rj3k-JM9fDcjaGMqBlQ497-3pyFm9KB2-3v9e-qzJiEgqfKnBVwElXUh9PZA6mxolrWCIYotSGsLRxXuiqk1c_gt9qKJagIgN2Mq9xBxOkyo4pjD5lt1lCM2AebnMD6wTDf5ibNTCeWHIwtW7VDDRnSyNbOYHi5MPPdzC_lf4Ua8yafsomszmsGRxDHFHywg2j9vyHc2n3szO9XnyWfF5TfkWyO_c',
      floatingBadgeText: 'GPS & i-Cockpit',
      isInstantConfirmation: true,
      isAvailable: true,
      branchAvailability: 'Airport VIP P2',
    ),
    VehicleModel(
      id: 'veh_03',
      brand: 'Volkswagen',
      model: 'Golf 8 R-Line',
      fullName: 'Volkswagen Golf 8 R-Line',
      category: 'Citadine',
      seriesTag: 'R-Line Series',
      modelYear: 2024,
      dailyPriceTnd: 140.0,
      totalPriceTnd: 560.0,
      rentalDays: 4,
      transmission: 'Automatique',
      seats: 5,
      fuelType: 'Essence',
      keyFeature: 'Apple CarPlay',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBCndhw5xQdVzFL5rZiXydtoMz0FkD7rrouldSvVE7ZDdFhhOE0fiGCvDla1ldFgFEP4AkIvwt7JLxuf98lfgrtpKBmHaPxPrvSKzVhRR7_HZIRCZGwaS7shV4H0ZZIhzeIRfVPDlbyifR83Y2Z5O55YzgiXLHJxYV83TL50NocQxHqEvzQ2etavt8pADwbMTrmogU4A4fFWOK-il_n60854MG70CJQIQtx25ju6vaX',
      floatingBadgeText: 'Virtual Cockpit',
      isInstantConfirmation: true,
      isAvailable: true,
      branchAvailability: 'Berges du Lac 2',
    ),
    VehicleModel(
      id: 'veh_04',
      brand: 'Porsche',
      model: 'Cayenne Coupé',
      fullName: 'Porsche Cayenne Coupé',
      category: 'Luxury / VIP',
      seriesTag: 'Édition Platinum',
      modelYear: 2024,
      dailyPriceTnd: 450.0,
      totalPriceTnd: 1800.0,
      rentalDays: 4,
      transmission: 'PDK 8-Vit.',
      seats: 5,
      fuelType: 'Hybride V6',
      keyFeature: 'Tarmac VIP',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDJS-dVPa-ysaWIhWBwXwzjSvIVmkd0DYw9Oek6GuEcprwHIIiPd8xAaTdIDGswkgdhD_6cFQ5kJIWwInqQr9lPpmfN4RJhr9awYdtQmnmYHk-0Educ7el4QZkrRpmTJpNRjkTBt7zXjMTaJn34hlf0bDj2J5VtRXJ0aF3ssDit6dixyEPnD_DE2_JsF4jn5id22FxrlzVWQXG6DTrUrzd3FCzHktxlGAgT4D4QbxHD',
      floatingBadgeText: 'Accès Tarmac VIP',
      isInstantConfirmation: true,
      isAvailable: true,
      branchAvailability: 'Airport VIP P2',
    ),
    VehicleModel(
      id: 'veh_05',
      brand: 'BMW',
      model: 'Série 5 M-Sport',
      fullName: 'BMW Série 5 M-Sport',
      category: 'Berline',
      seriesTag: 'M-Sport Executive',
      modelYear: 2024,
      dailyPriceTnd: 260.0,
      totalPriceTnd: 1040.0,
      rentalDays: 4,
      transmission: 'Automatique',
      seats: 5,
      fuelType: 'Diesel',
      keyFeature: 'Affichage Tête Haute',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuByWp0lyUrRgU3rj3k-JM9fDcjaGMqBlQ497-3pyFm9KB2-3v9e-qzJiEgqfKnBVwElXUh9PZA6mxolrWCIYotSGsLRxXuiqk1c_gt9qKJagIgN2Mq9xBxOkyo4pjD5lt1lCM2AebnMD6wTDf5ibNTCeWHIwtW7VDDRnSyNbOYHi5MPPdzC_lf4Ua8yafsomszmsGRxDHFHywg2j9vyHc2n3szO9XnyWfF5TfkWyO_c',
      floatingBadgeText: 'Service Chauffeur',
      isInstantConfirmation: true,
      isAvailable: true,
      branchAvailability: 'Berges du Lac 2',
    ),
  ];

  @override
  Future<List<VehicleEntity>> getVehicles() async {
    // Simule une faible latence réseau de 250ms
    await Future.delayed(const Duration(milliseconds: 250));
    return _mockFleet;
  }

  @override
  Future<List<VehicleEntity>> filterVehicles({
    String? category,
    String? branch,
    String? searchQuery,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return _mockFleet.where((v) {
      final matchesCategory = category == null ||
          category == 'Tous les véhicules' ||
          category == 'All Vehicles' ||
          v.category.toLowerCase().contains(category.toLowerCase());

      final matchesBranch = branch == null ||
          v.branchAvailability.toLowerCase().contains(branch.toLowerCase());

      final matchesQuery = searchQuery == null ||
          searchQuery.isEmpty ||
          v.fullName.toLowerCase().contains(searchQuery.toLowerCase());

      return matchesCategory && matchesBranch && matchesQuery;
    }).toList();
  }

  @override
  Future<VehicleEntity?> getVehicleById(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      return _mockFleet.firstWhere((v) => v.id == id);
    } catch (_) {
      return null;
    }
  }
}
