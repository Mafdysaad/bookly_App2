import 'package:booklyapp/Features/home/Domain/home_repo/home_repo.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homerpo) : super(HomeCubitInitial());
  final repo homerpo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeatchLodingState());
    var respons = await homerpo.featchBooks();
    respons.fold((error) => emit(FeatchFailureState(error.toString())),
        (books) => emit(FeatchSuccesState(books)));
  }

  Future<void> searchbook(String bookName) async {
    emit(FeatchLodingState());
    var respons = await homerpo.searchBook(bookName: bookName);
    respons.fold((error) => emit(FeatchFailureState(error.toString())),
        (books) => emit(FeatchSuccesState(books)));
  }
}
