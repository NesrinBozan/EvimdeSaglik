import 'package:firebase_auth/firebase_auth.dart';
import 'package:users_app/models/user_model.dart';

final FirebaseAuth fAuth= FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; // driversKeys Info List
String choosenDriverId="";
String cloudMessagingServerToken = "key=AAAAMuUtspE:APA91bHwCXCgjGrk79Ck-2b1kGS-XHcHAWBL3cwEZB5ccpFn49rhhamoi-E92YKQh_Im80ptBdU25N3ugcm5OHa1hyu5iQWJBIgMEj_HTi2tfwGv-dXELrZP_I0YNEndNICIHbveig36";
String driverCarDetails= "";
String driverName= "";
String driverPhone= "";
double countRatingStarts = 0.0;
String titleStarsRating= "";