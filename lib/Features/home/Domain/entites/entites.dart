import 'package:hive/hive.dart';
part 'entites.g.dart';

@HiveType(typeId: 0)
class BookEntites {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String authorName;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final num rate;
  @HiveField(4)
  final num price;

  BookEntites(
      {required this.authorName,
      required this.title,
      required this.rate,
      required this.image,
      required this.price});
}
