import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_first_wear_os_app/data/models/verse_model.dart';

class DataSourceAPI {
  final Dio dio = Dio();

  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkZyaSBKdWwgMTQgMjAyMyAxNzoxMzo1MCBHTVQrMDAwMC5yb2RyaWd1ZXNqZWZmLmRldkBlbWFpbC5jb20iLCJpYXQiOjE2ODkzNTQ4MzB9.bFC8gCO0XuIBYexLetFH8VJiHwTjSs-4ehVti00JIUE";

  Future<Either<String, VerseModel>> getRandomVerse() async {
    try {
      final response = await dio.get(
        "https://www.abibliadigital.com.br/api/verses/acf/random",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if (response.data != null) {
        return Right(VerseModel.fromJson(response.data));
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      return Left(e.message ?? "");
    }
  }
}
