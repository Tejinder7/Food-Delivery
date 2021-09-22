class AppUser{

  String? uid;
  String? name;
  String? email;
  String? imageURL;


  AppUser({this.uid, this.name, this.email});


  AppUser.name({this.uid, this.name, this.email,
      this.imageURL}); // it will be executed whenever we will print reference of User Object

  @override
  String toString() {
    return 'User{uid: $uid, name: $name, email: $email, imageURL: $imageURL}';
  }

  Map<String, dynamic> toMap(){
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "imageURL": "",
    };

  }
}