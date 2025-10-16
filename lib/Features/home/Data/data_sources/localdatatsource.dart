import 'package:booklyapp/Features/home/Data/models/book_model/book_modle.dart';
import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/constants/constdata.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class Localdatatsource {
  List<BookEntites> featchBooks();
  List<BookEntites> searchBook({required String bookName});
  List<BookEntites> relatedBook({required String categories});
}

class ImplamentLocalHomeData extends Localdatatsource {
  @override
  List<BookEntites> featchBooks() {
    var box = Hive.box<BookEntites>(kayfeatchdat);
    return box.values.toList();
  }

  @override
  List<BookEntites> relatedBook({required String categories}) {
    Box<BookEntites> box = Hive.box<BookEntites>(kayrelativedata);
    return box.values.toList();
  }

  @override
  List<BookEntites> searchBook({required String bookName}) {
    Box<BookEntites> box = Hive.box(kaysearchdata);
    return box.values.toList();
  }
}
