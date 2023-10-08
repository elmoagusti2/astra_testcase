part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final RequestState requestState;
  final Pokemons pokemons;
  final List<Result> listPokemons;
  const DashboardState(
      {required this.requestState,
      required this.pokemons,
      required this.listPokemons});

  DashboardState copyWith(
      {RequestState? requestState,
      Pokemons? pokemons,
      List<Result>? listPokemons}) {
    return DashboardState(
        pokemons: pokemons ?? this.pokemons,
        requestState: requestState ?? this.requestState,
        listPokemons: listPokemons ?? this.listPokemons);
  }

  @override
  List<Object> get props => [requestState, pokemons, listPokemons];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial(
      {required super.requestState,
      required super.pokemons,
      required super.listPokemons});
}
