import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/api.dart';

import '../model/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial()) {
    getAlbumApi();
  }

  final Api _api = Api();

  Future<void> getAlbumApi() async {
    try {
      emit(NewsLoading());
      final response = await _api.fetchNews();
      print(response);
      if (response != null) {
        emit(NewsSuccessState(response));
      }
    } catch (e) {
      {
        emit(NewsError());
      }
    }
  }

  void buttonPress(bool buttonClicked) {
    if (buttonClicked) {
      emit(ButtonPress("yahooo button pressed"));
    } else {
      emit(ButtonNotPressed("Opps you forgot to press the button"));
    }
  }

  @override
  void onChange(Change<NewsState> change) {
    super.onChange(change);
    print(change);
  }
}
