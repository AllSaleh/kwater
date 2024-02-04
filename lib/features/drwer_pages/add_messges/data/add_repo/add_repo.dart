import 'package:dartz/dartz.dart';

import 'package:khwater/core/api/handlig_errors.dart';

abstract class AddRepo{

  Future<Either<Failure,dynamic>> addMessage({required int id,required String message});
  Future<Either<Failure,dynamic>> addCategorie({required String categorie});

 
}