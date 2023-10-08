import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:astra_testscase/common/enum.dart';
import 'package:astra_testscase/models/pokemons/detail_pokemons/detail_pokemons.dart';
import 'package:astra_testscase/repositories/pokemon.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc()
      : super(DetailsInitial(
            detailPokemons: DetailPokemons(),
            requestState: RequestState.empty)) {
    on(_getDetails);
  }

  _getDetails(GetDetails event, emit) async {
    emit(DetailsState(
        detailPokemons: DetailPokemons(), requestState: RequestState.loading));
    DetailPokemons data = await PokemonRepository().getDetailPokemon(event.id!);
    emit(
        DetailsState(detailPokemons: data, requestState: RequestState.success));
  }
}
