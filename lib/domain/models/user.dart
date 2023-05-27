class User {
  const User({required this.uid});

  final String uid;

  factory User.empty() => const User(uid: '');
}
