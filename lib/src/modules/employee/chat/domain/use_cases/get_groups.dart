import 'package:smatrackx/core.dart';

class GetGroups extends StreamUseCaseWithoutParams<List<GroupEntity>> {
  const GetGroups(this._repo);

  final ChatRepo _repo;

  @override
  ResultStream<List<GroupEntity>> call() => _repo.getGroups();
}
