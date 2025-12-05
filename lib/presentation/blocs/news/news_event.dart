import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  final String countryCode;

  const LoadNewsEvent({this.countryCode = 'us'});

  @override
  List<Object> get props => [countryCode];
}

class LoadMoreNewsEvent extends NewsEvent {}