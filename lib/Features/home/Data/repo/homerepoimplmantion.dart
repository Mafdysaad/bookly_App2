import 'package:booklyapp/Features/home/Data/data_sources/home_remot_data_source.dart';
import 'package:booklyapp/Features/home/Data/data_sources/localdatatsource.dart';

import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/Features/home/Domain/home_repo/home_repo.dart';

import 'package:booklyapp/core/error/error.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Homerepoimplmantion extends repo {
  final Remotdatasource remotdatasource;
  final Localdatatsource localdatatsource;

  Homerepoimplmantion(this.localdatatsource, this.remotdatasource);
  @override
  Future<Either<failuer, List<BookEntites>>> featchBooks() async {
    try {
      List<BookEntites> books;
      books = localdatatsource.featchBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await remotdatasource.featchBooks();
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverfailuer.ForDioExcption(e));
      } else {
        return left(serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<failuer, List<BookEntites>>> searchBook(
      {required String bookName}) async {
    try {
      List<BookEntites> books;
      books = localdatatsource.searchBook(bookName: bookName);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await remotdatasource.searchBook(bookName: bookName);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverfailuer.ForDioExcption(e));
      } else {
        return left(serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<failuer, List<BookEntites>>> relatedBook(
      {required String categories}) async {
    try {
      List<BookEntites> books;
      books = localdatatsource.relatedBook(categories: categories);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await remotdatasource.relatedBook(categories: categories);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverfailuer.ForDioExcption(e));
      } else {
        return left(serverfailuer(e.toString()));
      }
    }
  }
}
