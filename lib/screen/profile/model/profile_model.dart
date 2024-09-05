class ProfileModel
{
  String? name,email,bio,mobile,uid;

  ProfileModel({this.name, this.email, this.bio, this.mobile,this.uid});

  factory ProfileModel.mapToModel(Map m1)
  {
    return ProfileModel(name: m1['name'],email: m1['email'],bio: m1['bio'],mobile: m1['mobile'],uid: m1['uid']);
  }
}