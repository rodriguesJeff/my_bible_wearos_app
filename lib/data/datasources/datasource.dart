import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_first_wear_os_app/data/models/verse_model.dart';

class DataSourceAPI {
  final Dio dio = Dio();

  Future<Either<String, VerseModel>> getRandomVerse() async {
    try {
      final response = await dio.get(
        "https://www.abibliadigital.com.br/api/verses/acf/random",
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
