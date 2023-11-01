// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import 'core/api/api_consumer.dart' as _i7;
import 'core/api/dio_consumer.dart' as _i8;
import 'core/api/logging_interceptor.dart' as _i5;
import 'core/network/network_info.dart' as _i6;
import 'core/third_party_injection.dart' as _i19;
import 'features/evolution_pokemon/data/data_source/remote_data_source.dart'
    as _i9;
import 'features/evolution_pokemon/data/repository/repository_impl.dart'
    as _i14;
import 'features/evolution_pokemon/domain/respository/base_repository.dart'
    as _i13;
import 'features/evolution_pokemon/domain/use_case/pokemon_evolution_use_case.dart'
    as _i16;
import 'features/evolution_pokemon/presentation/manager/cubit/pokemons_evolution_cubit.dart'
    as _i17;
import 'features/pokemon/data/data_source/remote_data_source/remote_data_source.dart'
    as _i10;
import 'features/pokemon/data/repository/repository_impl.dart' as _i12;
import 'features/pokemon/domain/repository/base_repository.dart' as _i11;
import 'features/pokemon/domain/use_case/pokemon_use_case.dart' as _i15;
import 'features/pokemon/presentation/manager/get_pokemons_cubit.dart' as _i18;

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
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.singleton<_i3.Dio>(thirdPartyInjection.dio);
    gh.singleton<_i4.InternetConnectionChecker>(
        thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i5.LoggingInterceptor>(_i5.LoggingInterceptor());
    gh.lazySingleton<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl(
        connectionChecker: gh<_i4.InternetConnectionChecker>()));
    gh.singleton<_i7.ApiConsumer>(_i8.DioConsumer(gh<_i3.Dio>()));
    gh.singleton<_i9.EvolutionPokemonBaseRemoteDataSource>(
        _i9.EvolutionPokemonRemoteDataSourceImpl(gh<_i7.ApiConsumer>()));
    gh.singleton<_i10.HomeBaseRemoteDataSource>(
        _i10.HomeRemoteDataSource(gh<_i7.ApiConsumer>()));
    gh.singleton<_i11.HomeBaseRepository>(_i12.HomeRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i10.HomeBaseRemoteDataSource>(),
    ));
    gh.singleton<_i13.BasePokemonEvolutionRepository>(
        _i14.PokemonEvolutionRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i9.EvolutionPokemonBaseRemoteDataSource>(),
    ));
    gh.singleton<_i15.GetPokemonsPaginatedUseCase>(
        _i15.GetPokemonsPaginatedUseCase(gh<_i11.HomeBaseRepository>()));
    gh.singleton<_i16.PokemonEvolutionUseCase>(_i16.PokemonEvolutionUseCase(
        gh<_i13.BasePokemonEvolutionRepository>()));
    gh.factory<_i17.PokemonsEvolutionCubit>(
        () => _i17.PokemonsEvolutionCubit(gh<_i16.PokemonEvolutionUseCase>()));
    gh.factory<_i18.GetPokemonsCubit>(
        () => _i18.GetPokemonsCubit(gh<_i15.GetPokemonsPaginatedUseCase>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i19.ThirdPartyInjection {}
