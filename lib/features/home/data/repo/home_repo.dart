import 'package:dartz/dartz.dart';
import 'package:khwater/core/api/handlig_errors.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/data/model/messages_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MessagesModel>>> getMessagesOnline();

  Future<Either<Failure, List<CustomMessgesModel>>> getNewMessages();

  Future<Either<Failure, List<CustomMessgesModel>>> getSpicalMessages();




}
