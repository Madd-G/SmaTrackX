import 'package:smatrackx/core.dart';

class GroupEntity extends Equatable {
  const GroupEntity({
    required this.id,
    required this.name,
    required this.groupId,
    required this.members,
    this.lastMessage,
    this.groupImageUrl,
    this.lastMessageTimestamp,
    this.lastMessageSenderName,
  });

  const GroupEntity.empty()
      : this(
          id: '',
          name: '',
          groupId: '',
          members: const [],
          lastMessage: null,
          groupImageUrl: null,
          lastMessageTimestamp: null,
          lastMessageSenderName: null,
        );

  final String id;
  final String name;
  final String groupId;
  final List<String> members;
  final String? lastMessage;
  final String? groupImageUrl;
  // final DateTime? lastMessageTimestamp;
  final String? lastMessageTimestamp;
  final String? lastMessageSenderName;

  @override
  List<Object?> get props => [id, name, groupId];
}
