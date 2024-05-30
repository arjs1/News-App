part of 'news_cubit.dart';

@immutable
sealed class NewsState extends Equatable {}

final class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

final class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
final class NewsSuccessState extends NewsState {
  List<NewsModel>? newsModel;
  NewsSuccessState(this.newsModel);
  @override
  List<Object?> get props => [newsModel];
}

final class NewsError extends NewsState {
  @override
  List<Object?> get props => [];
}

class ButtonPress extends NewsState {
  String buttonPress;
  ButtonPress(this.buttonPress);

  @override
  List<Object?> get props => [buttonPress];
}

class ButtonNotPressed extends NewsState {
  String buttonNotPressed;
  ButtonNotPressed(this.buttonNotPressed);

  @override
  // TODO: implement props
  List<Object?> get props => [buttonNotPressed];
}
