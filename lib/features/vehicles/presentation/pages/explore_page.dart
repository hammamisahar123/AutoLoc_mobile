import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';
import '../widgets/widgets.dart';

/// Page principale de découverte de la flotte et réservation conciergerie AutoLoc.
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          final cubit = context.read<ExploreCubit>();

          return Stack(
            children: [
              // Contenu défilable
              RefreshIndicator(
                color: AppColors.secondary,
                onRefresh: () => cubit.loadVehicles(),
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    // Barre d'en-tête collante / principale
                    SliverToBoxAdapter(
                      child: ExploreHeaderBar(
                        onLocationTap: () => _showLocationSnackbar(context),
                        onNotificationsTap: () => _showNotificationSnackbar(context),
                        onProfileTap: () => _showProfileSnackbar(context),
                      ),
                    ),

                    // Carte de Réservation Conciergerie
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
                        child: ConciergeBookingCard(
                          pickupLocation: state.pickupLocation,
                          returnSameLocation: state.returnSameLocation,
                          startDate: state.startDate,
                          endDate: state.endDate,
                          rentalDays: state.rentalDays,
                          selectedBranch: state.selectedBranch,
                          onToggleReturnSameLocation: () =>
                              cubit.toggleReturnSameLocation(),
                          onSelectBranch: (branch) => cubit.selectBranch(branch),
                          onSearchPressed: () => cubit.loadVehicles(),
                        ),
                      ),
                    ),

                    // Défilement horizontal des Catégories
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: CategoryFilterScroller(
                          selectedCategory: state.selectedCategory,
                          onSelectCategory: (category) =>
                              cubit.selectCategory(category),
                        ),
                      ),
                    ),

                    // Bannière Garantie Conciergerie VIP
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                        child: const ConciergeGuaranteeCard(),
                      ),
                    ),

                    // Titre d'inventaire et Tri
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                        child: FleetInventoryHeader(
                          count: state.displayedVehicles.length,
                          sortOption: state.sortOption,
                          onSortChanged: (sort) => cubit.updateSortOption(sort),
                        ),
                      ),
                    ),

                    // Liste des Véhicules
                    if (state.status == ExploreStatus.loading &&
                        state.displayedVehicles.isEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      )
                    else if (state.displayedVehicles.isEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Center(
                            child: Text(
                              'Aucun véhicule disponible dans cette catégorie.',
                              style: AppTypography.bodyMd,
                            ),
                          ),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final vehicle = state.displayedVehicles[index];
                              final isFav = state.favoriteIds.contains(vehicle.id);
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: VehicleCard(
                                  vehicle: vehicle,
                                  isFavorite: isFav,
                                  onToggleFavorite: () =>
                                      cubit.toggleFavorite(vehicle.id),
                                  onReservePressed: () =>
                                      _onReserveVehicle(context, vehicle.fullName),
                                ),
                              );
                            },
                            childCount: state.displayedVehicles.length,
                          ),
                        ),
                      ),

                    // Coussin d'espacement pour la barre flottante inférieure
                    SliverToBoxAdapter(
                      child: SizedBox(height: 90.h),
                    ),
                  ],
                ),
              ),

              // Barre de navigation inférieure flottante
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SafeArea(
                  top: false,
                  child: VipFloatingBottomNav(
                    activeIndex: state.activeBottomNavIndex,
                    onTabSelected: (index) => cubit.changeBottomNav(index),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onReserveVehicle(BuildContext context, String vehicleName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Réservation sélectionnée pour : $vehicleName'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showLocationSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Aéroport Tunis-Carthage (TUN) - Terminal 1 sélectionné'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showNotificationSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Aucune nouvelle notification de conciergerie.'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showProfileSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil VIP Karim Ben Salem actif.'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
