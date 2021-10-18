class UserModel {
  UserModel(this.image, this.name, this.surname, this.bio, this.email,
      this.parcs, this.rank);

  String image;
  String name;
  String surname;
  String bio;
  String email;
  String parcs;
  int rank;
}

UserModel tmpUser =
    UserModel("image", "name", "surname", "bio", "email", "parcs", 1);
