// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final DetailPokemons detailPokemons;
  final RequestState requestState;
  const DetailsState({
    required this.detailPokemons,
    required this.requestState,
  });

  @override
  List<Object> get props => [detailPokemons, requestState];
}

class DetailsInitial extends DetailsState {
  const DetailsInitial(
      {required super.detailPokemons, required super.requestState});
}
