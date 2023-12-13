import 'package:smatrackx/core.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble(this.message, {required this.showSenderInfo, super.key});

  final Message message;
  final bool showSenderInfo;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  UserEntity? user;

  late bool isCurrentUser;

  @override
  void initState() {
    if (widget.message.senderId == context.currentUser!.companyId) {
      user = context.currentUser;
      isCurrentUser = true;
    } else {
      isCurrentUser = false;
      context.read<ChatCubit>().getUser(widget.message.senderId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listener: (_, state) {
        if (state is UserFound && user == null) {
          setState(() {
            user = state.user;
          });
        }
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width - 45),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (widget.showSenderInfo && !isCurrentUser)
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      user == null || (user!.profilePicture == null)
                          ? kDefaultAvatar
                          : user!.profilePicture!,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    user == null ? 'Unknown User' : user!.uid,
                  ),
                ],
              ),
            Container(
              margin: EdgeInsets.only(top: 4, left: isCurrentUser ? 0 : 20),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    isCurrentUser ? AppColors.blueColor : AppColors.whiteColor,
              ),
              child: Text(
                widget.message.message,
                style: TextStyle(
                  color: isCurrentUser ? AppColors.whiteColor : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
