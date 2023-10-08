part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetails extends DetailsEvent {
  final int? id;

  const GetDetails({required this.id});
}
