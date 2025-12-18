part of 'storeprofile_img_cubit.dart';

@immutable
sealed class StoreprofileImgState {}

final class StoreProfileImageInitial extends StoreprofileImgState {}
final class StoreProfileImageLoading extends StoreprofileImgState {}
final class StoreProfileImageSuccess extends StoreprofileImgState {}
final class StoreProfileImageFailure extends StoreprofileImgState {
final String message;
StoreProfileImageFailure(this.message);
}