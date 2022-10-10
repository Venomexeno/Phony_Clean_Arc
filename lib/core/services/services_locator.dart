import 'package:clean_arc_phony/Latest_devices/data/datasource/latest_devices_remote_data_source.dart';
import 'package:clean_arc_phony/Latest_devices/data/repository/latest_devices_repostiory.dart';
import 'package:clean_arc_phony/Latest_devices/domain/repository/base_latest_devices_repository.dart';
import 'package:clean_arc_phony/Latest_devices/domain/usecase/get_latest_devices_usecase.dart';
import 'package:clean_arc_phony/Latest_devices/presentation/controller/latest_devices_bloc.dart';
import 'package:clean_arc_phony/device_spec/data/datasource/device_spec_data_source.dart';
import 'package:clean_arc_phony/device_spec/data/repository/device_spec_repository.dart';
import 'package:clean_arc_phony/device_spec/domain/repository/base_device_spec_repository.dart';
import 'package:clean_arc_phony/device_spec/domain/usecase/get_device_spec_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/datasource/top_by_fans_devices_remote_data_source.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/repository/top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/get_top_by_fans_devices_usecase.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/datasource/top_by_interest_devices_data_source.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/repository/top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/get_top_by_interest_devices_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => LatestDevicesBloc(sl()));

    /// UseCase
    sl.registerLazySingleton(() => GetLatestDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopByFansDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopByInterestDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetDeviceSpecUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseLatestDevicesRepository>(
        () => LatestDevicesRepository(sl()));
    sl.registerLazySingleton<BaseTopByFansDevicesRepository>(
        () => TopByFansDevicesRepository(sl()));
    sl.registerLazySingleton<BaseTopByInterestDevicesRepository>(
        () => TopByInterestDevicesRepository(sl()));
    sl.registerLazySingleton<BaseDeviceSpecRepository>(
        () => DeviceSpecRepository(sl()));

    /// DataSource
    sl.registerLazySingleton<BaseLatestDevicesRemoteDataSource>(
        () => LatestDevicesRemoteDataSource());
    sl.registerLazySingleton<BaseTopByFansDevicesRemoteDataSource>(
        () => TopByFansDevicesRemoteDataSource());
    sl.registerLazySingleton<BaseTopByInterestDevicesDataSource>(
        () => TopByInterestDevicesDataSource());
    sl.registerLazySingleton<BaseDeviceSpecRemoteDataSource>(
        () => DeviceRemoteDataSource());
  }
}
