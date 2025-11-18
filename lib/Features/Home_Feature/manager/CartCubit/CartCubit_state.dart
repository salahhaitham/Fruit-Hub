part of 'Cart_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class ProductAdded extends AddProductState {}
final class ProductRemoved extends AddProductState {}
final class ProductCountDecrease extends AddProductState {}
