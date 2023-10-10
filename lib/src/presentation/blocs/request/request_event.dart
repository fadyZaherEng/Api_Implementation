part of 'request_bloc.dart';

@immutable
abstract class RequestEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetRequestsEvent extends RequestEvent {}

class NavigateToRequestsDetailsScreen extends RequestEvent {
  final Request request;

  NavigateToRequestsDetailsScreen({
    required this.request,
  });
}
