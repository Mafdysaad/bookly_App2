import 'package:booklyapp/Features/home/Data/models/book_model/book_modle.dart';
import 'package:booklyapp/Features/home/Domain/entites/entites.dart';

abstract class Localdatatsource {
  List<BookEntites> featchBooks();
  List<BookEntites> searchBook({required String bookName});
  List<BookEntites> relatedBook({required String categories});
}

class ImplamentLocalHomeData extends Localdatatsource {
  @override
  List<BookEntites> featchBooks() {
    // TODO: implement featchBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntites> relatedBook({required String categories}) {
    // TODO: implement relatedBook
    throw UnimplementedError();
  }

  @override
  List<BookEntites> searchBook({required String bookName}) {
    // TODO: implement searchBook
    throw UnimplementedError();
  }

  List<BookEntites> parsingdata(Map<String, dynamic> respons) {
    List<BookEntites> books = [];
    for (var item in respons['items']) {
      books.add(BookModle.fromJson(item));
    }
    return books;
  }
}
