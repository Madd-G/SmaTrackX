import 'package:SmaTrackX/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) {
        final user = provider.user!;
        final image =
            user.profilePicture == null || user.profilePicture!.isEmpty
                ? null
                : user.profilePicture;
        return Container(
          height: 120.0,
          width: context.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: image != null
                      ? NetworkImage(image)
                      : const AssetImage(AppMedia.user) as ImageProvider,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.username,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17.0),
                      ),
                      RoundedContainer(
                        containerColor: AppColors.secondaryColor,
                        borderColor: AppColors.secondaryColor,
                        radius: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          child: Text(
                             user.role!,
                            // "Mobile Developer",
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
