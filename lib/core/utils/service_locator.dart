import 'package:booklyapp/Features/home/Data/repo/homerepoimplmantion.dart';
import 'package:booklyapp/Features/home/Domain/entites/entites.dart';
import 'package:booklyapp/constants/constdata.dart';
import 'package:booklyapp/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getit = GetIt.instance;

void setup() async {
  getit.registerSingleton<Apiservices>(Apiservices(Dio()));
  getit.registerSingleton<Homerepoimplmantion>(
      Homerepoimplmantion(getit.get<Apiservices>()));
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitesAdapter());
  await Hive.openBox(kayfeatchdat);
  await Hive.openBox(kayrelativedata);
  await Hive.openBox(kaysearchdata);
}
