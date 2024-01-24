part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductBlocLoading extends ProductState {}

class ProductBlocLoaded extends ProductState {}

class ProductBlocError extends ProductState {}
