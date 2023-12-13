import 'package:smatrackx/core.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initFirebaseInstances();
  await _initAuth();
  await _initAttendance();
  await _initChat();
}

Future<void> _initFirebaseInstances() async {
  sl
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
      ),
    );
}

Future<void> _initChat() async {
  sl
    ..registerFactory(
      () => ChatCubit(
        getGroups: sl(),
        getMessages: sl(),
        getUserById: sl(),
        joinGroup: sl(),
        leaveGroup: sl(),
        sendMessage: sl(),
      ),
    )
    ..registerLazySingleton(() => GetGroups(sl()))
    ..registerLazySingleton(() => GetMessages(sl()))
    ..registerLazySingleton(() => GetUserById(sl()))
    ..registerLazySingleton(() => JoinGroup(sl()))
    ..registerLazySingleton(() => LeaveGroup(sl()))
    ..registerLazySingleton(() => SendMessage(sl()))
    ..registerLazySingleton<ChatRepo>(() => ChatRepoImpl(sl()))
    ..registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(firestore: sl(), auth: sl()),
    );
}

Future<void> _initAttendance() async {
  sl
    ..registerLazySingleton<AttendanceRemoteDataSource>(
        () => AttendanceRemoteDataSource())
    ..registerLazySingleton<AttendanceRepository>(
        () => AttendanceRepositoryImpl(sl<AttendanceRemoteDataSource>()));
}
