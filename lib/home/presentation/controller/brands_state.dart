part of 'brands_bloc.dart';

class BrandsState extends Equatable {
  final List<Brands> brands;
  final RequestState requestState;
  final String errorMessage;

  const BrandsState({
    this.brands = const [],
    this.requestState = RequestState.loading,
    this.errorMessage = '',
  });

  BrandsState copyWith({
    List<Brands>? brands,
    RequestState? requestState,
    String? errorMessage,
  }) {
    return BrandsState(
      brands: brands ?? this.brands,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        brands,
        requestState,
        errorMessage,
      ];
}
