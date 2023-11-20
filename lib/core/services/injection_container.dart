import 'package:SmaTrackX/core.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initFirebaseInstances();
  await _initAuth();
  await _initAttendance();
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

Future<void> _initAttendance() async {
  sl
    ..registerLazySingleton<AttendanceRemoteDataSource>(
        () => AttendanceRemoteDataSource())
    ..registerLazySingleton<AttendanceRepository>(
        () => AttendanceRepositoryImpl(sl<AttendanceRemoteDataSource>()));
}
