// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 AuthStatus get status; UserEntity? get user; String? get errorMessage;// États d'interface & navigation (gérés par le Cubit)
 AuthTab get selectedTab; AppLanguage get language; bool get isBusinessProfile; bool get obscurePassword; bool get rememberDevice; bool get agreeTerms;// Champs du formulaire de Connexion
 String get loginIdentifier; String get loginPassword;// Champs du formulaire d'Inscription
 String get registerFullName; String get registerPhone; String get registerEmail; String get registerPassword; String get registerLicense;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.language, language) || other.language == language)&&(identical(other.isBusinessProfile, isBusinessProfile) || other.isBusinessProfile == isBusinessProfile)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword)&&(identical(other.rememberDevice, rememberDevice) || other.rememberDevice == rememberDevice)&&(identical(other.agreeTerms, agreeTerms) || other.agreeTerms == agreeTerms)&&(identical(other.loginIdentifier, loginIdentifier) || other.loginIdentifier == loginIdentifier)&&(identical(other.loginPassword, loginPassword) || other.loginPassword == loginPassword)&&(identical(other.registerFullName, registerFullName) || other.registerFullName == registerFullName)&&(identical(other.registerPhone, registerPhone) || other.registerPhone == registerPhone)&&(identical(other.registerEmail, registerEmail) || other.registerEmail == registerEmail)&&(identical(other.registerPassword, registerPassword) || other.registerPassword == registerPassword)&&(identical(other.registerLicense, registerLicense) || other.registerLicense == registerLicense));
}


@override
int get hashCode => Object.hash(runtimeType,status,user,errorMessage,selectedTab,language,isBusinessProfile,obscurePassword,rememberDevice,agreeTerms,loginIdentifier,loginPassword,registerFullName,registerPhone,registerEmail,registerPassword,registerLicense);

@override
String toString() {
  return 'AuthState(status: $status, user: $user, errorMessage: $errorMessage, selectedTab: $selectedTab, language: $language, isBusinessProfile: $isBusinessProfile, obscurePassword: $obscurePassword, rememberDevice: $rememberDevice, agreeTerms: $agreeTerms, loginIdentifier: $loginIdentifier, loginPassword: $loginPassword, registerFullName: $registerFullName, registerPhone: $registerPhone, registerEmail: $registerEmail, registerPassword: $registerPassword, registerLicense: $registerLicense)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AuthStatus status, UserEntity? user, String? errorMessage, AuthTab selectedTab, AppLanguage language, bool isBusinessProfile, bool obscurePassword, bool rememberDevice, bool agreeTerms, String loginIdentifier, String loginPassword, String registerFullName, String registerPhone, String registerEmail, String registerPassword, String registerLicense
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? user = freezed,Object? errorMessage = freezed,Object? selectedTab = null,Object? language = null,Object? isBusinessProfile = null,Object? obscurePassword = null,Object? rememberDevice = null,Object? agreeTerms = null,Object? loginIdentifier = null,Object? loginPassword = null,Object? registerFullName = null,Object? registerPhone = null,Object? registerEmail = null,Object? registerPassword = null,Object? registerLicense = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AuthTab,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,isBusinessProfile: null == isBusinessProfile ? _self.isBusinessProfile : isBusinessProfile // ignore: cast_nullable_to_non_nullable
as bool,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,rememberDevice: null == rememberDevice ? _self.rememberDevice : rememberDevice // ignore: cast_nullable_to_non_nullable
as bool,agreeTerms: null == agreeTerms ? _self.agreeTerms : agreeTerms // ignore: cast_nullable_to_non_nullable
as bool,loginIdentifier: null == loginIdentifier ? _self.loginIdentifier : loginIdentifier // ignore: cast_nullable_to_non_nullable
as String,loginPassword: null == loginPassword ? _self.loginPassword : loginPassword // ignore: cast_nullable_to_non_nullable
as String,registerFullName: null == registerFullName ? _self.registerFullName : registerFullName // ignore: cast_nullable_to_non_nullable
as String,registerPhone: null == registerPhone ? _self.registerPhone : registerPhone // ignore: cast_nullable_to_non_nullable
as String,registerEmail: null == registerEmail ? _self.registerEmail : registerEmail // ignore: cast_nullable_to_non_nullable
as String,registerPassword: null == registerPassword ? _self.registerPassword : registerPassword // ignore: cast_nullable_to_non_nullable
as String,registerLicense: null == registerLicense ? _self.registerLicense : registerLicense // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthStatus status,  UserEntity? user,  String? errorMessage,  AuthTab selectedTab,  AppLanguage language,  bool isBusinessProfile,  bool obscurePassword,  bool rememberDevice,  bool agreeTerms,  String loginIdentifier,  String loginPassword,  String registerFullName,  String registerPhone,  String registerEmail,  String registerPassword,  String registerLicense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.user,_that.errorMessage,_that.selectedTab,_that.language,_that.isBusinessProfile,_that.obscurePassword,_that.rememberDevice,_that.agreeTerms,_that.loginIdentifier,_that.loginPassword,_that.registerFullName,_that.registerPhone,_that.registerEmail,_that.registerPassword,_that.registerLicense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthStatus status,  UserEntity? user,  String? errorMessage,  AuthTab selectedTab,  AppLanguage language,  bool isBusinessProfile,  bool obscurePassword,  bool rememberDevice,  bool agreeTerms,  String loginIdentifier,  String loginPassword,  String registerFullName,  String registerPhone,  String registerEmail,  String registerPassword,  String registerLicense)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.status,_that.user,_that.errorMessage,_that.selectedTab,_that.language,_that.isBusinessProfile,_that.obscurePassword,_that.rememberDevice,_that.agreeTerms,_that.loginIdentifier,_that.loginPassword,_that.registerFullName,_that.registerPhone,_that.registerEmail,_that.registerPassword,_that.registerLicense);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthStatus status,  UserEntity? user,  String? errorMessage,  AuthTab selectedTab,  AppLanguage language,  bool isBusinessProfile,  bool obscurePassword,  bool rememberDevice,  bool agreeTerms,  String loginIdentifier,  String loginPassword,  String registerFullName,  String registerPhone,  String registerEmail,  String registerPassword,  String registerLicense)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.user,_that.errorMessage,_that.selectedTab,_that.language,_that.isBusinessProfile,_that.obscurePassword,_that.rememberDevice,_that.agreeTerms,_that.loginIdentifier,_that.loginPassword,_that.registerFullName,_that.registerPhone,_that.registerEmail,_that.registerPassword,_that.registerLicense);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.status = AuthStatus.initial, this.user, this.errorMessage, this.selectedTab = AuthTab.login, this.language = AppLanguage.fr, this.isBusinessProfile = false, this.obscurePassword = true, this.rememberDevice = true, this.agreeTerms = true, this.loginIdentifier = 'contact@ambassade.tn', this.loginPassword = 'secret123', this.registerFullName = 'Karim Ben Salem', this.registerPhone = '98 123 456', this.registerEmail = 'karim.bensalem@ambassade-vip.tn', this.registerPassword = 'Monaco2026#', this.registerLicense = ''});
  

@override@JsonKey() final  AuthStatus status;
@override final  UserEntity? user;
@override final  String? errorMessage;
// États d'interface & navigation (gérés par le Cubit)
@override@JsonKey() final  AuthTab selectedTab;
@override@JsonKey() final  AppLanguage language;
@override@JsonKey() final  bool isBusinessProfile;
@override@JsonKey() final  bool obscurePassword;
@override@JsonKey() final  bool rememberDevice;
@override@JsonKey() final  bool agreeTerms;
// Champs du formulaire de Connexion
@override@JsonKey() final  String loginIdentifier;
@override@JsonKey() final  String loginPassword;
// Champs du formulaire d'Inscription
@override@JsonKey() final  String registerFullName;
@override@JsonKey() final  String registerPhone;
@override@JsonKey() final  String registerEmail;
@override@JsonKey() final  String registerPassword;
@override@JsonKey() final  String registerLicense;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.language, language) || other.language == language)&&(identical(other.isBusinessProfile, isBusinessProfile) || other.isBusinessProfile == isBusinessProfile)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword)&&(identical(other.rememberDevice, rememberDevice) || other.rememberDevice == rememberDevice)&&(identical(other.agreeTerms, agreeTerms) || other.agreeTerms == agreeTerms)&&(identical(other.loginIdentifier, loginIdentifier) || other.loginIdentifier == loginIdentifier)&&(identical(other.loginPassword, loginPassword) || other.loginPassword == loginPassword)&&(identical(other.registerFullName, registerFullName) || other.registerFullName == registerFullName)&&(identical(other.registerPhone, registerPhone) || other.registerPhone == registerPhone)&&(identical(other.registerEmail, registerEmail) || other.registerEmail == registerEmail)&&(identical(other.registerPassword, registerPassword) || other.registerPassword == registerPassword)&&(identical(other.registerLicense, registerLicense) || other.registerLicense == registerLicense));
}


@override
int get hashCode => Object.hash(runtimeType,status,user,errorMessage,selectedTab,language,isBusinessProfile,obscurePassword,rememberDevice,agreeTerms,loginIdentifier,loginPassword,registerFullName,registerPhone,registerEmail,registerPassword,registerLicense);

@override
String toString() {
  return 'AuthState(status: $status, user: $user, errorMessage: $errorMessage, selectedTab: $selectedTab, language: $language, isBusinessProfile: $isBusinessProfile, obscurePassword: $obscurePassword, rememberDevice: $rememberDevice, agreeTerms: $agreeTerms, loginIdentifier: $loginIdentifier, loginPassword: $loginPassword, registerFullName: $registerFullName, registerPhone: $registerPhone, registerEmail: $registerEmail, registerPassword: $registerPassword, registerLicense: $registerLicense)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthStatus status, UserEntity? user, String? errorMessage, AuthTab selectedTab, AppLanguage language, bool isBusinessProfile, bool obscurePassword, bool rememberDevice, bool agreeTerms, String loginIdentifier, String loginPassword, String registerFullName, String registerPhone, String registerEmail, String registerPassword, String registerLicense
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? user = freezed,Object? errorMessage = freezed,Object? selectedTab = null,Object? language = null,Object? isBusinessProfile = null,Object? obscurePassword = null,Object? rememberDevice = null,Object? agreeTerms = null,Object? loginIdentifier = null,Object? loginPassword = null,Object? registerFullName = null,Object? registerPhone = null,Object? registerEmail = null,Object? registerPassword = null,Object? registerLicense = null,}) {
  return _then(_AuthState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AuthTab,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,isBusinessProfile: null == isBusinessProfile ? _self.isBusinessProfile : isBusinessProfile // ignore: cast_nullable_to_non_nullable
as bool,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,rememberDevice: null == rememberDevice ? _self.rememberDevice : rememberDevice // ignore: cast_nullable_to_non_nullable
as bool,agreeTerms: null == agreeTerms ? _self.agreeTerms : agreeTerms // ignore: cast_nullable_to_non_nullable
as bool,loginIdentifier: null == loginIdentifier ? _self.loginIdentifier : loginIdentifier // ignore: cast_nullable_to_non_nullable
as String,loginPassword: null == loginPassword ? _self.loginPassword : loginPassword // ignore: cast_nullable_to_non_nullable
as String,registerFullName: null == registerFullName ? _self.registerFullName : registerFullName // ignore: cast_nullable_to_non_nullable
as String,registerPhone: null == registerPhone ? _self.registerPhone : registerPhone // ignore: cast_nullable_to_non_nullable
as String,registerEmail: null == registerEmail ? _self.registerEmail : registerEmail // ignore: cast_nullable_to_non_nullable
as String,registerPassword: null == registerPassword ? _self.registerPassword : registerPassword // ignore: cast_nullable_to_non_nullable
as String,registerLicense: null == registerLicense ? _self.registerLicense : registerLicense // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
