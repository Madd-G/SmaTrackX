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
    return 'LocalUser{uid: $uid, email: $email, username: $username, profile_picture: $profilePicture}, role: $role bio: '
        '$bio, work_start: $workStart, work_end: $workEnd, created: $created, company_id: $companyId, group_ids: $groupIds}';
  }
}
