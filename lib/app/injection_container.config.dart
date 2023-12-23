// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quick_drink_app/app/injection_container.dart' as _i17;
import 'package:quick_drink_app/data_source/example_menu_remote_data_source.dart'
    as _i11;
import 'package:quick_drink_app/data_source/menu_remote_data_source.dart'
    as _i3;
import 'package:quick_drink_app/data_source/order_remote_data_source.dart'
    as _i4;
import 'package:quick_drink_app/data_source/table_remote_data_source.dart'
    as _i6;
import 'package:quick_drink_app/domain/repositories/menu_repository.dart'
    as _i13;
import 'package:quick_drink_app/domain/repositories/order_repository.dart'
    as _i5;
import 'package:quick_drink_app/domain/repositories/tables_repository.dart'
    as _i7;
import 'package:quick_drink_app/features/pages/add_page/cubit/add_page_cubit.dart'
    as _i15;
import 'package:quick_drink_app/features/pages/bar_page/cubit/bar_page_cubit.dart'
    as _i9;
import 'package:quick_drink_app/features/pages/kitchen_page/cubit/kitchen_page_cubit.dart'
    as _i12;
import 'package:quick_drink_app/features/pages/menu_page/cubit/menu_page_cubit.dart'
    as _i16;
import 'package:quick_drink_app/features/pages/order_page/cubit/order_page_cubit.dart'
    as _i14;
import 'package:quick_drink_app/features/pages/tables_page/cubit/tables_page_cubit.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.MenuRemoteDataSource>(() => _i3.MenuRemoteDataSource());
    gh.factory<_i4.OrderRemotDataSource>(() => _i4.OrderRemotDataSource());
    gh.factory<_i5.OrderRepository>(() => _i5.OrderRepository(
        orderRemoteDataSource: gh<_i4.OrderRemotDataSource>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i6.TableRemoteDataSource>(() => _i6.TableRemoteDataSource());
    gh.factory<_i7.TableRepository>(() => _i7.TableRepository(
        tableRemoteDataSource: gh<_i6.TableRemoteDataSource>()));
    gh.factory<_i8.TablesPageCubit>(
        () => _i8.TablesPageCubit(tableRepository: gh<_i7.TableRepository>()));
    gh.factory<_i9.BarPageCubit>(
        () => _i9.BarPageCubit(orderRepository: gh<_i5.OrderRepository>()));
    gh.lazySingleton<_i10.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i11.ExampleRetrofitDataSource>(
        () => _i11.ExampleRetrofitDataSource(gh<_i10.Dio>()));
    gh.factory<_i12.KitchenPageCubit>(() =>
        _i12.KitchenPageCubit(orderRepository: gh<_i5.OrderRepository>()));
    gh.factory<_i13.MenuRepository>(() => _i13.MenuRepository(
          menuRemoteDataSource: gh<_i3.MenuRemoteDataSource>(),
          exampleRetrofitDataSource: gh<_i11.ExampleRetrofitDataSource>(),
        ));
    gh.factory<_i14.OrderPageCubit>(
        () => _i14.OrderPageCubit(orderRepository: gh<_i5.OrderRepository>()));
    gh.factory<_i15.AddPageCubit>(
        () => _i15.AddPageCubit(menuRepository: gh<_i13.MenuRepository>()));
    gh.factory<_i16.MenuPageCubit>(
        () => _i16.MenuPageCubit(menuRepository: gh<_i13.MenuRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
