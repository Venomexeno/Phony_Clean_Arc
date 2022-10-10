import 'package:clean_arc_phony/Latest_devices/data/datasource/latest_devices_remote_data_source.dart';
import 'package:clean_arc_phony/Latest_devices/data/repository/latest_devices_repostiory.dart';
import 'package:clean_arc_phony/Latest_devices/domain/repository/base_latest_devices_repository.dart';
import 'package:clean_arc_phony/Latest_devices/domain/usecase/latest_devices_usecase.dart';
import 'package:clean_arc_phony/phone_spec/data/datasource/phone_spec_data_source.dart';
import 'package:clean_arc_phony/phone_spec/data/repository/phone_spec_repository.dart';
import 'package:clean_arc_phony/phone_spec/domain/repository/base_phone_spec_repository.dart';
import 'package:clean_arc_phony/phone_spec/domain/usecase/phone_spec_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/datasource/top_by_fans_devices_remote_data_source.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/repository/top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/top_by_fans_devices_usecase.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/datasource/top_by_interest_devices_data_source.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/repository/top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/top_by_interest_devices_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Bloc

    /// UseCase
    sl.registerLazySingleton(() => LatestDevicesUseCase(sl()));

    sl.registerLazySingleton(() => TopByFansDevicesUseCase(sl()));

    sl.registerLazySingleton(() => TopByInterestDevicesUseCase(sl()));

    sl.registerLazySingleton(() => PhoneSpecUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseLatestDevicesRepository>(
        () => LatestDevicesRepository(sl()));

    sl.registerLazySingleton<BaseTopByFansDevicesRepository>(
        () => TopByFansDevicesRepository(sl()));

    sl.registerLazySingleton<BaseTopByInterestDevicesRepository>(
        () => TopByInterestDevicesRepository(sl()));

    sl.registerLazySingleton<BasePhoneSpecRepository>(
        () => PhoneSpecRepository(sl()));

    /// DataSource
    sl.registerLazySingleton<BaseLatestDevicesRemoteDataSource>(
        () => LatestDevicesRemoteDataSource());

    sl.registerLazySingleton<BaseTopByFansDevicesRemoteDataSource>(
        () => TopByFansDevicesRemoteDataSource());

    sl.registerLazySingleton<BaseTopByInterestDevicesDataSource>(
        () => TopByInterestDevicesDataSource());

    sl.registerLazySingleton<BasePhoneSpecRemoteDataSource>(
        () => PhoneSpecRemoteDataSource());
  }
}
