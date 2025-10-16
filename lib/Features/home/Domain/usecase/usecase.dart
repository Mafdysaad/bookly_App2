import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/Features/home/Domain/home_repo/home_repo.dart';
import 'package:booklyapp/core/error/error.dart';
import 'package:booklyapp/core/usecas/usecases.dart';
import 'package:dartz/dartz.dart';

class featchbookusecase extends usecasenoparam<List<BookEntites>, Noparam> {
  final repo Homrepo;
  featchbookusecase(this.Homrepo);

  @override
  Future<Either<failuer, List<BookEntites>>> call([Noparam? pram]) async {
    //implament permison
    return await Homrepo.featchBooks();
  }
}
