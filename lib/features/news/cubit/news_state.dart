part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccessState extends NewsState {
  List<NewsModel>? newsModel;
  NewsSuccessState(newsModel);
}

final class NewsError extends NewsState {}
