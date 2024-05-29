part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class ApiFetchEvent extends NewsEvent {}
