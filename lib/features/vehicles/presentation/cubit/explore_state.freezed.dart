// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreState {

 ExploreStatus get status; List<VehicleEntity> get allVehicles; List<VehicleEntity> get displayedVehicles; String get selectedCategory; String get selectedBranch; bool get returnSameLocation; String get pickupLocation; String get startDate; String get endDate; int get rentalDays; Set<String> get favoriteIds; int get activeBottomNavIndex; String get searchQuery; String get sortOption; String? get errorMessage;
/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStateCopyWith<ExploreState> get copyWith => _$ExploreStateCopyWithImpl<ExploreState>(this as ExploreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.allVehicles, allVehicles)&&const DeepCollectionEquality().equals(other.displayedVehicles, displayedVehicles)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedBranch, selectedBranch) || other.selectedBranch == selectedBranch)&&(identical(other.returnSameLocation, returnSameLocation) || other.returnSameLocation == returnSameLocation)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.rentalDays, rentalDays) || other.rentalDays == rentalDays)&&const DeepCollectionEquality().equals(other.favoriteIds, favoriteIds)&&(identical(other.activeBottomNavIndex, activeBottomNavIndex) || other.activeBottomNavIndex == activeBottomNavIndex)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(allVehicles),const DeepCollectionEquality().hash(displayedVehicles),selectedCategory,selectedBranch,returnSameLocation,pickupLocation,startDate,endDate,rentalDays,const DeepCollectionEquality().hash(favoriteIds),activeBottomNavIndex,searchQuery,sortOption,errorMessage);

@override
String toString() {
  return 'ExploreState(status: $status, allVehicles: $allVehicles, displayedVehicles: $displayedVehicles, selectedCategory: $selectedCategory, selectedBranch: $selectedBranch, returnSameLocation: $returnSameLocation, pickupLocation: $pickupLocation, startDate: $startDate, endDate: $endDate, rentalDays: $rentalDays, favoriteIds: $favoriteIds, activeBottomNavIndex: $activeBottomNavIndex, searchQuery: $searchQuery, sortOption: $sortOption, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ExploreStateCopyWith<$Res>  {
  factory $ExploreStateCopyWith(ExploreState value, $Res Function(ExploreState) _then) = _$ExploreStateCopyWithImpl;
@useResult
$Res call({
 ExploreStatus status, List<VehicleEntity> allVehicles, List<VehicleEntity> displayedVehicles, String selectedCategory, String selectedBranch, bool returnSameLocation, String pickupLocation, String startDate, String endDate, int rentalDays, Set<String> favoriteIds, int activeBottomNavIndex, String searchQuery, String sortOption, String? errorMessage
});




}
/// @nodoc
class _$ExploreStateCopyWithImpl<$Res>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._self, this._then);

  final ExploreState _self;
  final $Res Function(ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? allVehicles = null,Object? displayedVehicles = null,Object? selectedCategory = null,Object? selectedBranch = null,Object? returnSameLocation = null,Object? pickupLocation = null,Object? startDate = null,Object? endDate = null,Object? rentalDays = null,Object? favoriteIds = null,Object? activeBottomNavIndex = null,Object? searchQuery = null,Object? sortOption = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExploreStatus,allVehicles: null == allVehicles ? _self.allVehicles : allVehicles // ignore: cast_nullable_to_non_nullable
as List<VehicleEntity>,displayedVehicles: null == displayedVehicles ? _self.displayedVehicles : displayedVehicles // ignore: cast_nullable_to_non_nullable
as List<VehicleEntity>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,selectedBranch: null == selectedBranch ? _self.selectedBranch : selectedBranch // ignore: cast_nullable_to_non_nullable
as String,returnSameLocation: null == returnSameLocation ? _self.returnSameLocation : returnSameLocation // ignore: cast_nullable_to_non_nullable
as bool,pickupLocation: null == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,rentalDays: null == rentalDays ? _self.rentalDays : rentalDays // ignore: cast_nullable_to_non_nullable
as int,favoriteIds: null == favoriteIds ? _self.favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<String>,activeBottomNavIndex: null == activeBottomNavIndex ? _self.activeBottomNavIndex : activeBottomNavIndex // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,sortOption: null == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreState value)  $default,){
final _that = this;
switch (_that) {
case _ExploreState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreState value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExploreStatus status,  List<VehicleEntity> allVehicles,  List<VehicleEntity> displayedVehicles,  String selectedCategory,  String selectedBranch,  bool returnSameLocation,  String pickupLocation,  String startDate,  String endDate,  int rentalDays,  Set<String> favoriteIds,  int activeBottomNavIndex,  String searchQuery,  String sortOption,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.status,_that.allVehicles,_that.displayedVehicles,_that.selectedCategory,_that.selectedBranch,_that.returnSameLocation,_that.pickupLocation,_that.startDate,_that.endDate,_that.rentalDays,_that.favoriteIds,_that.activeBottomNavIndex,_that.searchQuery,_that.sortOption,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExploreStatus status,  List<VehicleEntity> allVehicles,  List<VehicleEntity> displayedVehicles,  String selectedCategory,  String selectedBranch,  bool returnSameLocation,  String pickupLocation,  String startDate,  String endDate,  int rentalDays,  Set<String> favoriteIds,  int activeBottomNavIndex,  String searchQuery,  String sortOption,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ExploreState():
return $default(_that.status,_that.allVehicles,_that.displayedVehicles,_that.selectedCategory,_that.selectedBranch,_that.returnSameLocation,_that.pickupLocation,_that.startDate,_that.endDate,_that.rentalDays,_that.favoriteIds,_that.activeBottomNavIndex,_that.searchQuery,_that.sortOption,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExploreStatus status,  List<VehicleEntity> allVehicles,  List<VehicleEntity> displayedVehicles,  String selectedCategory,  String selectedBranch,  bool returnSameLocation,  String pickupLocation,  String startDate,  String endDate,  int rentalDays,  Set<String> favoriteIds,  int activeBottomNavIndex,  String searchQuery,  String sortOption,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.status,_that.allVehicles,_that.displayedVehicles,_that.selectedCategory,_that.selectedBranch,_that.returnSameLocation,_that.pickupLocation,_that.startDate,_that.endDate,_that.rentalDays,_that.favoriteIds,_that.activeBottomNavIndex,_that.searchQuery,_that.sortOption,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ExploreState implements ExploreState {
  const _ExploreState({this.status = ExploreStatus.initial, final  List<VehicleEntity> allVehicles = const [], final  List<VehicleEntity> displayedVehicles = const [], this.selectedCategory = 'Tous les véhicules', this.selectedBranch = 'Airport VIP P2', this.returnSameLocation = true, this.pickupLocation = 'Aéroport Tunis-Carthage (Terminal 1)', this.startDate = '14 Oct, 10:00', this.endDate = '18 Oct, 18:00', this.rentalDays = 4, final  Set<String> favoriteIds = const <String>{}, this.activeBottomNavIndex = 0, this.searchQuery = '', this.sortOption = 'Popularité', this.errorMessage}): _allVehicles = allVehicles,_displayedVehicles = displayedVehicles,_favoriteIds = favoriteIds;
  

@override@JsonKey() final  ExploreStatus status;
 final  List<VehicleEntity> _allVehicles;
@override@JsonKey() List<VehicleEntity> get allVehicles {
  if (_allVehicles is EqualUnmodifiableListView) return _allVehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allVehicles);
}

 final  List<VehicleEntity> _displayedVehicles;
@override@JsonKey() List<VehicleEntity> get displayedVehicles {
  if (_displayedVehicles is EqualUnmodifiableListView) return _displayedVehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_displayedVehicles);
}

@override@JsonKey() final  String selectedCategory;
@override@JsonKey() final  String selectedBranch;
@override@JsonKey() final  bool returnSameLocation;
@override@JsonKey() final  String pickupLocation;
@override@JsonKey() final  String startDate;
@override@JsonKey() final  String endDate;
@override@JsonKey() final  int rentalDays;
 final  Set<String> _favoriteIds;
@override@JsonKey() Set<String> get favoriteIds {
  if (_favoriteIds is EqualUnmodifiableSetView) return _favoriteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteIds);
}

@override@JsonKey() final  int activeBottomNavIndex;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  String sortOption;
@override final  String? errorMessage;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreStateCopyWith<_ExploreState> get copyWith => __$ExploreStateCopyWithImpl<_ExploreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._allVehicles, _allVehicles)&&const DeepCollectionEquality().equals(other._displayedVehicles, _displayedVehicles)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedBranch, selectedBranch) || other.selectedBranch == selectedBranch)&&(identical(other.returnSameLocation, returnSameLocation) || other.returnSameLocation == returnSameLocation)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.rentalDays, rentalDays) || other.rentalDays == rentalDays)&&const DeepCollectionEquality().equals(other._favoriteIds, _favoriteIds)&&(identical(other.activeBottomNavIndex, activeBottomNavIndex) || other.activeBottomNavIndex == activeBottomNavIndex)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_allVehicles),const DeepCollectionEquality().hash(_displayedVehicles),selectedCategory,selectedBranch,returnSameLocation,pickupLocation,startDate,endDate,rentalDays,const DeepCollectionEquality().hash(_favoriteIds),activeBottomNavIndex,searchQuery,sortOption,errorMessage);

@override
String toString() {
  return 'ExploreState(status: $status, allVehicles: $allVehicles, displayedVehicles: $displayedVehicles, selectedCategory: $selectedCategory, selectedBranch: $selectedBranch, returnSameLocation: $returnSameLocation, pickupLocation: $pickupLocation, startDate: $startDate, endDate: $endDate, rentalDays: $rentalDays, favoriteIds: $favoriteIds, activeBottomNavIndex: $activeBottomNavIndex, searchQuery: $searchQuery, sortOption: $sortOption, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ExploreStateCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory _$ExploreStateCopyWith(_ExploreState value, $Res Function(_ExploreState) _then) = __$ExploreStateCopyWithImpl;
@override @useResult
$Res call({
 ExploreStatus status, List<VehicleEntity> allVehicles, List<VehicleEntity> displayedVehicles, String selectedCategory, String selectedBranch, bool returnSameLocation, String pickupLocation, String startDate, String endDate, int rentalDays, Set<String> favoriteIds, int activeBottomNavIndex, String searchQuery, String sortOption, String? errorMessage
});




}
/// @nodoc
class __$ExploreStateCopyWithImpl<$Res>
    implements _$ExploreStateCopyWith<$Res> {
  __$ExploreStateCopyWithImpl(this._self, this._then);

  final _ExploreState _self;
  final $Res Function(_ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? allVehicles = null,Object? displayedVehicles = null,Object? selectedCategory = null,Object? selectedBranch = null,Object? returnSameLocation = null,Object? pickupLocation = null,Object? startDate = null,Object? endDate = null,Object? rentalDays = null,Object? favoriteIds = null,Object? activeBottomNavIndex = null,Object? searchQuery = null,Object? sortOption = null,Object? errorMessage = freezed,}) {
  return _then(_ExploreState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExploreStatus,allVehicles: null == allVehicles ? _self._allVehicles : allVehicles // ignore: cast_nullable_to_non_nullable
as List<VehicleEntity>,displayedVehicles: null == displayedVehicles ? _self._displayedVehicles : displayedVehicles // ignore: cast_nullable_to_non_nullable
as List<VehicleEntity>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,selectedBranch: null == selectedBranch ? _self.selectedBranch : selectedBranch // ignore: cast_nullable_to_non_nullable
as String,returnSameLocation: null == returnSameLocation ? _self.returnSameLocation : returnSameLocation // ignore: cast_nullable_to_non_nullable
as bool,pickupLocation: null == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,rentalDays: null == rentalDays ? _self.rentalDays : rentalDays // ignore: cast_nullable_to_non_nullable
as int,favoriteIds: null == favoriteIds ? _self._favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<String>,activeBottomNavIndex: null == activeBottomNavIndex ? _self.activeBottomNavIndex : activeBottomNavIndex // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,sortOption: null == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
