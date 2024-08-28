
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screen/profile/model/profile_model.dart';
import 'auth_helper.dart';

class FireDbHelper
{
 static FireDbHelper helper = FireDbHelper._();
  FireDbHelper._();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> setProfile(ProfileModel m1)
  async {
   await fireStore.collection('User').doc(AuthHelper.helper.user!.uid).set({
      "name": m1.name,
      "email": m1.email,
      "bio": m1.bio,
      "mobile": m1.mobile,
    });
  }

  Future<ProfileModel ?> getProfile()
  async {
  DocumentSnapshot docData = await fireStore.collection('User').doc(AuthHelper.helper.user!.uid).get();

  if(docData.exists)
    {
      // Map m1 = docData.data() as Map;
      // ProfileModel model =ProfileModel.mapToModel(m1);
      // return model;
      Map m1 = docData.data() as Map;
     ProfileModel model = ProfileModel.mapToModel(m1);
     return model;
    }
  else
    {
      return null;
    }

  }
}