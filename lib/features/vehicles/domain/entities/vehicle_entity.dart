import 'package:equatable/equatable.dart';

/// Entité métier représentant un véhicule de la flotte VIP AutoLoc.
class VehicleEntity extends Equatable {
  final String id;
  final String brand;
  final String model;
  final String fullName;
  final String category;
  final String seriesTag;
  final int modelYear;
  final double dailyPriceTnd;
  final double totalPriceTnd;
  final int rentalDays;
  final String transmission;
  final int seats;
  final String fuelType;
  final String keyFeature;
  final String imageUrl;
  final String floatingBadgeText;
  final bool isInstantConfirmation;
  final bool isAvailable;
  final String branchAvailability;

  const VehicleEntity({
    required this.id,
    required this.brand,
    required this.model,
    required this.fullName,
    required this.category,
    required this.seriesTag,
    required this.modelYear,
    required this.dailyPriceTnd,
    required this.totalPriceTnd,
    required this.rentalDays,
    required this.transmission,
    required this.seats,
    required this.fuelType,
    required this.keyFeature,
    required this.imageUrl,
    required this.floatingBadgeText,
    this.isInstantConfirmation = true,
    this.isAvailable = true,
    this.branchAvailability = 'Airport VIP P2',
  });

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        fullName,
        category,
        seriesTag,
        modelYear,
        dailyPriceTnd,
        totalPriceTnd,
        rentalDays,
        transmission,
        seats,
        fuelType,
        keyFeature,
        imageUrl,
        floatingBadgeText,
        isInstantConfirmation,
        isAvailable,
        branchAvailability,
      ];
}
