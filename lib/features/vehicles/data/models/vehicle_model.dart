import '../../domain/entities/vehicle_entity.dart';

/// Modèle de données pour la sérialisation / désérialisation d'un véhicule.
class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required super.id,
    required super.brand,
    required super.model,
    required super.fullName,
    required super.category,
    required super.seriesTag,
    required super.modelYear,
    required super.dailyPriceTnd,
    required super.totalPriceTnd,
    required super.rentalDays,
    required super.transmission,
    required super.seats,
    required super.fuelType,
    required super.keyFeature,
    required super.imageUrl,
    required super.floatingBadgeText,
    super.isInstantConfirmation,
    super.isAvailable,
    super.branchAvailability,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      fullName: json['fullName'] as String,
      category: json['category'] as String,
      seriesTag: json['seriesTag'] as String,
      modelYear: json['modelYear'] as int,
      dailyPriceTnd: (json['dailyPriceTnd'] as num).toDouble(),
      totalPriceTnd: (json['totalPriceTnd'] as num).toDouble(),
      rentalDays: json['rentalDays'] as int,
      transmission: json['transmission'] as String,
      seats: json['seats'] as int,
      fuelType: json['fuelType'] as String,
      keyFeature: json['keyFeature'] as String,
      imageUrl: json['imageUrl'] as String,
      floatingBadgeText: json['floatingBadgeText'] as String,
      isInstantConfirmation: json['isInstantConfirmation'] as bool? ?? true,
      isAvailable: json['isAvailable'] as bool? ?? true,
      branchAvailability: json['branchAvailability'] as String? ?? 'Airport VIP P2',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'fullName': fullName,
      'category': category,
      'seriesTag': seriesTag,
      'modelYear': modelYear,
      'dailyPriceTnd': dailyPriceTnd,
      'totalPriceTnd': totalPriceTnd,
      'rentalDays': rentalDays,
      'transmission': transmission,
      'seats': seats,
      'fuelType': fuelType,
      'keyFeature': keyFeature,
      'imageUrl': imageUrl,
      'floatingBadgeText': floatingBadgeText,
      'isInstantConfirmation': isInstantConfirmation,
      'isAvailable': isAvailable,
      'branchAvailability': branchAvailability,
    };
  }
}
