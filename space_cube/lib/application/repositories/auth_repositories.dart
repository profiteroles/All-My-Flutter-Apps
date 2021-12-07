abstract class AuthRepository {
  Future signIn({required String email, required String password});
  // Future signUp({required String email, required String password});

}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
