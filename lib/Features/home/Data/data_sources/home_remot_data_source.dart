import 'package:booklyapp/Features/home/Data/models/book_model/book_modle.dart';
import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/core/utils/api_services.dart';

abstract class Homeremotdatasource {
  Future<List<BookEntites>> featchBooks();
  Future<List<BookEntites>> searchBook({required String bookName});
  Future<List<BookEntites>> relatedBook({required String categories});
}

class implamentHomeremotdata extends Homeremotdatasource {
  final Apiservices apiservices;
  implamentHomeremotdata(this.apiservices);
  @override
  Future<List<BookEntites>> featchBooks() async {
    var respons = await apiservices.get('volumes?q=programming');
    List<BookEntites> books = parsingdata(respons);
    return books;
  }

  @override
  Future<List<BookEntites>> relatedBook({required String categories}) {
    var respons = apiservices
        .get('volumes?q=$categories&filtering=free-ebooks&Sorting=relevance');
    List<BookEntites> books = parsingdata(respons as Map<String, dynamic>);
    return Future.value(books);
  }

  @override
  Future<List<BookEntites>> searchBook({required String bookName}) {
    var respons = apiservices
        .get('volumes?q=$bookName|"title"=$bookName&filtering=free-ebooks');
    List<BookEntites> books = parsingdata(respons as Map<String, dynamic>);
    return Future.value(books);
  }

  List<BookEntites> parsingdata(Map<String, dynamic> respons) {
    List<BookEntites> books = [];
    for (var item in respons['items']) {
      books.add(BookModle.fromJson(item));
    }
    return books;
  }
}
