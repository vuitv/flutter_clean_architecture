import 'package:equatable/equatable.dart';

import '../../common/result.dart';

abstract class UseCase {
  call();
}

abstract class UseCaseResult<Type, Params> extends UseCase {
  Future<Result<Type>> call({Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
