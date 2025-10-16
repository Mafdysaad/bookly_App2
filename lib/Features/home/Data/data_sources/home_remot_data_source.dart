import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/constants/constdata.dart';
import 'package:booklyapp/core/functions/functions.dart';
import 'package:booklyapp/core/utils/api_services.dart';

abstract class Homeremotdatasource {
  Future<List<BookEntites>> featchBooks();
  Future<List<BookEntites>> searchBook({required String bookName});
  Future<List<BookEntites>> relatedBook({required String categories});
}

class ImplamentHomeremotdata extends Homeremotdatasource {
  final Apiservices apiservices;
  ImplamentHomeremotdata(this.apiservices);
  @override
  Future<List<BookEntites>> featchBooks() async {
    var respons = await apiservices.get('volumes?q=programming');
    List<BookEntites> books = parsingdata(respons);
    savecacheData(books, kayfeatchdat);
    return books;
  }

  @override
  Future<List<BookEntites>> relatedBook({required String categories}) {
    var respons = apiservices
        .get('volumes?q=$categories&filtering=free-ebooks&Sorting=relevance');
    List<BookEntites> books = parsingdata(respons as Map<String, dynamic>);
    savecacheData(books, kayrelativedata);
    return Future.value(books);
  }

  @override
  Future<List<BookEntites>> searchBook({required String bookName}) {
    var respons = apiservices
        .get('volumes?q=$bookName|"title"=$bookName&filtering=free-ebooks');
    List<BookEntites> books = parsingdata(respons as Map<String, dynamic>);
    savecacheData(books, kaysearchdata);
    return Future.value(books);
  }
}
