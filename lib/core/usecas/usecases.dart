import 'package:booklyapp/core/error/error.dart';
import 'package:dartz/dartz.dart';

abstract class usecase<type, param> {
  Future<Either<failuer, type>> call(param pragma);
}

abstract class usecasenoparam<type, Noparam> {
  Future<Either<failuer, type>> call([Noparam pragma]);
}

class Noparam {}
