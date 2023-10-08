import 'package:astra_testscase/common/common_util.dart';
import 'package:astra_testscase/models/pokemons/pokemons/result.dart';
import 'package:astra_testscase/repositories/local_storage/database_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:astra_testscase/common/enum.dart';
import 'package:astra_testscase/models/pokemons/pokemons/pokemons.dart';
import 'package:astra_testscase/repositories/pokemon.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(const DashboardInitial(
            requestState: RequestState.empty,
            pokemons: Pokemons(),
            listPokemons: [])) {
    on(_getPokemons);
    on(_searchPokemons);
  }

  _getPokemons(GetPokemons event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      Pokemons data = await PokemonRepository().getPokemon();
      await DatabaseProvider.dbProvider.insertLocalPokemon(data.results!);
      List<Result> local = await DatabaseProvider.dbProvider.getLocalPokemons();
      emit(state.copyWith(
          pokemons: data,
          listPokemons: local,
          requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  _searchPokemons(SearchPokemons event, emit) {
    emit(state.copyWith(requestState: RequestState.loading));

    if (!CommonUtil.falsyChecker(event.search)) {
      List<Result> data = List.from(state.pokemons.results!);
      List<Result> filteredList =
          data.where((model) => model.name!.contains(event.search!)).toList();
      emit(state.copyWith(
          listPokemons: filteredList, requestState: RequestState.success));
    }
    if (CommonUtil.falsyChecker(event.search)) {
      emit(state.copyWith(
          listPokemons: state.pokemons.results,
          requestState: RequestState.success));
    }
  }
}
