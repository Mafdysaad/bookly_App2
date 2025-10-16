import 'package:booklyapp/Features/home/Data/models/book_model/book_modle.dart';
import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/core/utils/approutes.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void transition(context) {
  Future.delayed(const Duration(seconds: 4), () {
    // Get.to(const Home(), transition: Transition.fadeIn);
    GoRouter.of(context).push(Approutes.kHomeRoute);
  });
}

List<BookEntites> parsingdata(Map<String, dynamic> respos) {
  List<BookEntites> books = [];
  for (var item in respos['items']) {
    books.add(BookModle.fromJson(item));
  }
  return books;
}

savecacheData(List<BookEntites> books, String boxname) {
  var box = Hive.box(boxname);
  box.addAll(books);
}
