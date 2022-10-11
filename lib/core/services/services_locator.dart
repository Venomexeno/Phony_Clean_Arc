import 'package:clean_arc_phony/Latest_devices/data/datasource/latest_devices_remote_data_source.dart';
import 'package:clean_arc_phony/Latest_devices/data/repository/latest_devices_repostiory.dart';
import 'package:clean_arc_phony/Latest_devices/domain/repository/base_latest_devices_repository.dart';
import 'package:clean_arc_phony/Latest_devices/domain/usecase/get_latest_devices_usecase.dart';
import 'package:clean_arc_phony/Latest_devices/presentation/controller/latest_devices_bloc.dart';
import 'package:clean_arc_phony/brand_devices/data/datasource/brand_devices_data_source.dart';
import 'package:clean_arc_phony/brand_devices/data/repository/brand_devices_repository.dart';
import 'package:clean_arc_phony/brand_devices/domain/repository/base_brand_devices_repository.dart';
import 'package:clean_arc_phony/brand_devices/domain/usecase/get_brand_devices_usecase.dart';
import 'package:clean_arc_phony/brand_devices/presentation/controller/brand_devices_bloc.dart';
import 'package:clean_arc_phony/device_spec/data/datasource/device_spec_data_source.dart';
import 'package:clean_arc_phony/device_spec/data/repository/device_spec_repository.dart';
import 'package:clean_arc_phony/device_spec/domain/repository/base_device_spec_repository.dart';
import 'package:clean_arc_phony/device_spec/domain/usecase/get_device_spec_usecase.dart';
import 'package:clean_arc_phony/home/data/datasource/brands_data_source.dart';
import 'package:clean_arc_phony/home/data/repository/brands_repository.dart';
import 'package:clean_arc_phony/home/domain/repository/base_brands_repository.dart';
import 'package:clean_arc_phony/home/domain/usecase/get_brands_usecase.dart';
import 'package:clean_arc_phony/home/presentation/controller/brands_bloc.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/datasource/top_by_fans_devices_remote_data_source.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/repository/top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/get_top_by_fans_devices_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/presentation/controller/top_by_fans_devices_bloc.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/datasource/top_by_interest_devices_data_source.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/repository/top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/get_top_by_interest_devices_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => BrandsBloc(sl()));
    sl.registerFactory(() => BrandDevicesBloc(sl()));
    sl.registerFactory(() => LatestDevicesBloc(sl()));
    sl.registerFactory(() => TopByFansDevicesBloc(sl(), sl()));

    /// UseCase
    sl.registerLazySingleton(() => GetBrandsUseCase(sl()));
    sl.registerLazySingleton(() => GetBrandDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetLatestDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopByFansDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopByInterestDevicesUseCase(sl()));
    sl.registerLazySingleton(() => GetDeviceSpecUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseBrandsRepository>(
        () => BrandsRepository(sl()));
    sl.registerLazySingleton<BaseBrandDevicesRepository>(
        () => BrandDevicesRepository(sl()));
    sl.registerLazySingleton<BaseLatestDevicesRepository>(
        () => LatestDevicesRepository(sl()));
    sl.registerLazySingleton<BaseTopByFansDevicesRepository>(
        () => TopByFansDevicesRepository(sl()));
    sl.registerLazySingleton<BaseTopByInterestDevicesRepository>(
        () => TopByInterestDevicesRepository(sl()));
    sl.registerLazySingleton<BaseDeviceSpecRepository>(
        () => DeviceSpecRepository(sl()));

    /// DataSource
    sl.registerLazySingleton<BaseBrandsDataSource>(() => BrandsDataSource());
    sl.registerLazySingleton<BaseBrandDevicesDataSource>(
        () => BrandDevicesDataSource());
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
