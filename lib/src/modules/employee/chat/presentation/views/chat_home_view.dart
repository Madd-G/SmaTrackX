import 'package:SmaTrackX/core.dart';

class ChatHomeView extends StatefulWidget {
  const ChatHomeView({super.key});

  static const routeName = '/chat-home';

  @override
  State<ChatHomeView> createState() => _ChatHomeViewState();
}

class _ChatHomeViewState extends State<ChatHomeView> {
  List<GroupEntity> yourDepartments = [];
  List<GroupEntity> otherDepartments = [];

  bool showingDialog = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (_, state) {
          if (showingDialog) {
            Navigator.of(context).pop();
            showingDialog = false;
          }
          if (state is ChatError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is JoiningGroup) {
            showingDialog = true;
            CoreUtils.showLoadingDialog(context);
          } else if (state is JoinedGroup) {
            CoreUtils.showSnackBar(context, 'Joined group successfully');
          } else if (state is GroupLoaded) {
            yourDepartments = state.groups
                .where(
                  (group) =>
                      // group.members.contains(context.currentUser!.companyId),
                      group.members.contains(context.userProvider.user?.uid),
                )
                .toList();
            otherDepartments = state.groups
                .where(
                  (group) =>
                      !group.members.contains(context.userProvider.user?.uid),
                )
                .toList();
          }
        },
        builder: (context, state) {
          print('state: $state');
          print('data: $yourDepartments');
          if (state is LoadingGroups) {
            return const LoadingView();
          } else if (state is GroupLoaded && state.groups.isEmpty) {
            return const NotFoundText(
              'No group found\nPlease contact admin or if you are admin, '
              'add group',
            );
          } else if ((state is GroupLoaded) ||
              (yourDepartments.isNotEmpty) ||
              (otherDepartments.isNotEmpty)) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                if (yourDepartments.isNotEmpty) ...[
                  Text(
                    'Your Group',
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Divider(color: Colors.grey.shade300),
                  ...yourDepartments.map(YourGroupTile.new),
                ],
                if (otherDepartments.isNotEmpty) ...[
                  Text(
                    'Department',
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Divider(color: Colors.grey.shade300),
                  ...otherDepartments.map(OtherGroupTile.new),
                ],
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
