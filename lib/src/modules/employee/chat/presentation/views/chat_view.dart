import 'package:SmaTrackX/core.dart';

class ChatView extends StatefulWidget {
  const ChatView({required this.group, super.key});

  final GroupEntity group;

  static const routeName = '/chat';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool showingDialog = false;

  List<Message> messages = [];
  bool showInputField = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().getMessages(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ChatAppBar(group: widget.group),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (_, state) {
          if (showingDialog) {
            Navigator.of(context).pop();
            showingDialog = false;
          }
          if (state is ChatError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is LeavingGroup) {
            showingDialog = true;
            CoreUtils.showLoadingDialog(context);
          } else if (state is LeftGroup) {
            context.pop();
          } else if (state is MessagesLoaded) {
            setState(() {
              messages = state.messages;
              showInputField = true;
            });
          }
        },
        builder: (context, state) {
          if (state is LoadingMessages) {
            return const LoadingView();
          } else if (state is MessagesLoaded ||
              showInputField ||
              messages.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    reverse: true,
                    itemBuilder: (_, index) {
                      final message = messages[index];
                      final previousMessage =
                          index > 0 ? messages[index - 1] : null;

                      final showSenderInfo = previousMessage == null ||
                          previousMessage.senderId != message.senderId;
                      return BlocProvider(
                        create: (_) => sl<ChatCubit>(),
                        child: MessageBubble(
                          message,
                          showSenderInfo: showSenderInfo,
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                BlocProvider(
                  create: (_) => sl<ChatCubit>(),
                  child: ChatInputField(groupId: widget.group.id),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
