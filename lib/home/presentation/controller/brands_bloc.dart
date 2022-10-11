import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/home/domain/entities/brands.dart';
import 'package:clean_arc_phony/home/domain/usecase/get_brands_usecase.dart';
import 'package:equatable/equatable.dart';

part 'brands_event.dart';

part 'brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetBrandsUseCase brandsUseCase;

  BrandsBloc(this.brandsUseCase) : super(const BrandsState()) {
    on<GetBrandsEvent>(_getBrandsEvent);
  }

  FutureOr<void> _getBrandsEvent(
      GetBrandsEvent event, Emitter<BrandsState> emit) async {
    final result = await brandsUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          brands: r,
        ),
      ),
    );
  }
}
