import 'package:SmaTrackX/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: context.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Consumer<UserProvider>(
        builder: (_, provider, __) {
          final user = provider.user;
          final image = user?.profilePic == null || user!.profilePic!.isEmpty
              ? null
              : user.profilePic;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: image != null
                      ? NetworkImage(image)
                      : const AssetImage(MediaRes.user) as ImageProvider,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Akhmad Nur Alamsyah',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17.0),
                      ),
                      RoundedContainer(
                        containerColor: AppColors.secondaryColor,
                        borderColor: AppColors.secondaryColor,
                        radius: 10.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          child: Text(
                            'Mobile Developer',
                            style: TextStyle(
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
          );
        },
      ),
    );
  }
}
