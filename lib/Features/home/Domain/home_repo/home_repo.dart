import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/core/error/error.dart';
import 'package:dartz/dartz.dart';

abstract class repo {
  Future<Either<failuer, List<BookEntites>>> featchBooks();
  Future<Either<failuer, List<BookEntites>>> searchBook(
      {required String bookName});
  Future<Either<failuer, List<BookEntites>>> relatedBook(
      {required String categories});
}
