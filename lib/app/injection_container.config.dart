// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quick_drink_app/app/injection_container.dart' as _i21;
import 'package:quick_drink_app/app/root_page/cubit/root_page_cubit.dart'
    as _i8;
import 'package:quick_drink_app/data_source/authentication_data_source.dart'
    as _i3;
import 'package:quick_drink_app/data_source/example_menu_remote_data_source.dart'
    as _i15;
import 'package:quick_drink_app/data_source/menu_remote_data_source.dart'
    as _i5;
import 'package:quick_drink_app/data_source/order_remote_data_source.dart'
    as _i6;
import 'package:quick_drink_app/data_source/table_remote_data_source.dart'
    as _i9;
import 'package:quick_drink_app/domain/repositories/menu_repository.dart'
    as _i17;
import 'package:quick_drink_app/domain/repositories/order_repository.dart'
    as _i7;
import 'package:quick_drink_app/domain/repositories/tables_repository.dart'
    as _i10;
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/bar_page/cubit/bar_page_cubit.dart'
    as _i13;
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/kitchen_page/cubit/kitchen_page_cubit.dart'
    as _i16;
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/tables_page/cubit/tables_page_cubit.dart'
    as _i11;
import 'package:quick_drink_app/features/pages/login_user_pages/log_in/cubit/log_in_page_cubit.dart'
    as _i4;
import 'package:quick_drink_app/features/pages/login_user_pages/user_page/cubit/user_page_cubit.dart'
    as _i12;
import 'package:quick_drink_app/features/pages/menu_order_add_pages/add_page/cubit/add_page_cubit.dart'
    as _i19;
import 'package:quick_drink_app/features/pages/menu_order_add_pages/menu_page/cubit/menu_page_cubit.dart'
    as _i20;
import 'package:quick_drink_app/features/pages/menu_order_add_pages/order_page/cubit/order_page_cubit.dart'
    as _i18;

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
    gh.factory<_i3.AuthenticationRepository>(
        () => _i3.AuthenticationRepository());
    gh.factory<_i4.LogInPageCubit>(() => _i4.LogInPageCubit());
    gh.factory<_i5.MenuRemoteDataSource>(() => _i5.MenuRemoteDataSource());
    gh.factory<_i6.OrderRemotDataSource>(() => _i6.OrderRemotDataSource());
    gh.factory<_i7.OrderRepository>(() => _i7.OrderRepository(
        orderRemoteDataSource: gh<_i6.OrderRemotDataSource>()));
    gh.factory<_i8.RootPageCubit>(() => _i8.RootPageCubit());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i9.TableRemoteDataSource>(() => _i9.TableRemoteDataSource());
    gh.factory<_i10.TableRepository>(() => _i10.TableRepository(
        tableRemoteDataSource: gh<_i9.TableRemoteDataSource>()));
    gh.factory<_i11.TablesPageCubit>(() =>
        _i11.TablesPageCubit(tableRepository: gh<_i10.TableRepository>()));
    gh.factory<_i12.UserPageCubit>(() => _i12.UserPageCubit());
    gh.factory<_i13.BarPageCubit>(
        () => _i13.BarPageCubit(orderRepository: gh<_i7.OrderRepository>()));
    gh.lazySingleton<_i14.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i15.ExampleRetrofitDataSource>(
        () => _i15.ExampleRetrofitDataSource(gh<_i14.Dio>()));
    gh.factory<_i16.KitchenPageCubit>(() =>
        _i16.KitchenPageCubit(orderRepository: gh<_i7.OrderRepository>()));
    gh.factory<_i17.MenuRepository>(() => _i17.MenuRepository(
          menuRemoteDataSource: gh<_i5.MenuRemoteDataSource>(),
          exampleRetrofitDataSource: gh<_i15.ExampleRetrofitDataSource>(),
        ));
    gh.factory<_i18.OrderPageCubit>(
        () => _i18.OrderPageCubit(orderRepository: gh<_i7.OrderRepository>()));
    gh.factory<_i19.AddPageCubit>(
        () => _i19.AddPageCubit(menuRepository: gh<_i17.MenuRepository>()));
    gh.factory<_i20.MenuPageCubit>(
        () => _i20.MenuPageCubit(menuRepository: gh<_i17.MenuRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
