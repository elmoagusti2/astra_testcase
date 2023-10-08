part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetPokemons extends DashboardEvent {}

class SearchPokemons extends DashboardEvent {
  final String? search;

  const SearchPokemons({required this.search});
}
