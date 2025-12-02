part of 'Cart_cubit.dart';

@immutable
sealed class CartcubitState {}

final class AddProductInitial extends CartcubitState {}
final class ProductAdded extends CartcubitState {}
final class ProductRemoved extends CartcubitState {}
final class ProductCountDecrease extends CartcubitState {}
