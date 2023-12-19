import 'package:smatrackx/core.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String? profilePicture;
  final String? role;
  final String? bio;
  final String? workStart;
  final String? workEnd;
  final String? created;
  final String? companyId;
  final List<String> groupIds;

  bool get isAdmin => email == 'admin@gmail.com';

  const UserEntity({
    required this.uid,
    required this.email,
    required this.username,
    this.profilePicture,
    this.role,
    this.bio,
    this.workStart,
    this.workEnd,
    this.created,
    this.companyId,
    this.groupIds = const [],
  });

  const UserEntity.empty()
      : this(
          uid: '',
          email: '',
          username: '',
          profilePicture: '',
          role: '',
          bio: '',
          workStart: '',
          workEnd: '',
          created: '',
          companyId: '',
          groupIds: const [],
        );

  @override
  List<Object?> get props => [
        uid,
        email,
        username,
        profilePicture,
        bio,
        workStart,
        workEnd,
        created,
        companyId,
        groupIds.length,
      ];

  @override
  String toString() {
    return '\n UserEntity{'
        '\n uid: $uid, '
        '\n email: $email, '
        '\n username: $username, '
        '\n profile_picture: $profilePicture, '
        '\n role: $role '
        '\n bio: $bio'
        '\n work_start: $workStart, '
        '\n work_end: $workEnd, '
        '\n created: $created, '
        '\n company_id: $companyId, '
        '\n group_ids: $groupIds'
        '\n }';
  }
}
