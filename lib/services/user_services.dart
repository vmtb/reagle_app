import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:tp_uber/constant.dart';
import 'package:tp_uber/models/user.dart';


//login
Future <ApiResponse> login (String phoneNumber, String passWord) async{
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
      },
      body: jsonEncode({
        'phoneNumber': phoneNumber,
        'password': passWord,
      })
    );
    print(response.statusCode);
    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        apiResponse.uid= data['user'];
        break;
      case 422:
        const error = 'invalid';
        apiResponse.error = error;
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch(e){
    apiResponse.error = serverError;
  }
  return apiResponse;
}


//register

Future <ApiResponse> register (String firstName, String lastName, String phoneNumber, bool active, String password, int gender) async{
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(registerUrl),
        headers: {
          'Content-type' : 'application/ld+json',
          'Accept' : 'application/ld+json',
        },
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber": phoneNumber,
          "active": active,
          "password": password,
          "gender": 0
        })
    );
    print(jsonDecode(response.body));
    switch(response.statusCode){
      case 201:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        apiResponse.uid= data['@id'];
        break;
      case 422:
        const error = 'phone number already exist';
        apiResponse.error = error;
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch(e){
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//create user profile

Future<bool> createClientPofile() async{
  String uid = await getUid();
  print('\n\n\n\n');
  print(uid);
  print('\n\n\n\n');
  bool success = false;
  try{
    final response = await http.post(
        Uri.parse("http://tpuberensgmm.repetiteursdunet.com/api/client_profiles"),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json',
        },
        body: jsonEncode({
          "owner": uid,
          "active": true
        })
    );
    print(jsonDecode(response.body));
    switch(response.statusCode){
      case 201:
        success=true;
        print(success);
        break;
      case 400:
        print('***************************************************************error creating client profile');
        break;
      case 422:
        print('***************************************************************unprocessable entity');
        break;
      default:
        print('**************************************unknown*************************error creating client profile');
        break;
    }
  } catch(e){
    print('exception caught');
  }

  return success;
}

//create driver profile
Future<bool> createDriverPofile(String licensePlateNumber, int vehiculeType) async{
  String uid = await getUid();
  bool success = false;
  try{
    final response = await http.post(
        Uri.parse("http://tpuberensgmm.repetiteursdunet.com/api/driver_profiles"),
        headers: {
          'Content-type' : 'application/ld+json',
          'Accept' : 'application/ld+json',
        },
        body: jsonEncode({
            "owner": uid,
            "licencePlateNumber": licensePlateNumber,
            "active": true,
            "vehicleType": vehiculeType
        })
    );
    print(jsonDecode(response.body));
    switch(response.statusCode){
      case 201:
        success=true;
        print(success);
        SharedPreferences pref = await SharedPreferences.getInstance();
        var data = jsonDecode(response.body);
        String driverId = data['@id'];
        print('*\n*\n*\n*${driverId}\n*\n*');
        await pref.setString('driverId', driverId ?? '');
        break;
      case 400:
        print('***************************************************************error creating client profile');
        break;
      case 422:
        print('***************************************************************unprocessable entity');
        break;
      default:
        print('**************************************unknown*************************error creating client profile');
        break;
    }
  } catch(e){
    print(e);
  }

  return success;
}
//user

Future<ApiResponse> getUserDetails() async{
  ApiResponse apiResponse = ApiResponse();
  try{
    String uid = await getUid();
    final response = await http.get(
        Uri.parse('http://tpuberensgmm.repetiteursdunet.com'+uid),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json',
        },
    );
    switch(response.statusCode){
      case 200:

        break;
      case 401:
        const error = unauthorized;
        apiResponse.error = error;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch(e){
    apiResponse.error = serverError;
  }
  return apiResponse;

}


// user informations

Future getUser() async{

  var data;
  try{
    String uid = await getUid();
    final response = await http.get(
      Uri.parse('http://tpuberensgmm.repetiteursdunet.com'+uid),
      headers: {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
      },
    );
    switch(response.statusCode){
      case 200:
        data= jsonDecode(response.body);
        break;
      case 401:
        const error = unauthorized;
        data = error;
        break;
      default:
        data = somethingWentWrong;
        break;
    }
  } catch(e){
    data = serverError;
  }
  return data;

}

Future<String> getUid() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('uid')?? '';
}

//get driver id
Future<String> getDriverid() async {
  String uid = await getUid();
  bool hasDriverProfile= false;
  String driverId = '';
  try{
    final response = await http.get(
        Uri.parse("http://tpuberensgmm.repetiteursdunet.com"+uid),
        headers: {
          'Content-type' : 'application/ld+json',
          'Accept' : 'application/ld+json',
        },

    );
    print(jsonDecode(response.body));
    switch(response.statusCode){
      case 200:
        hasDriverProfile=true;
        var data = jsonDecode(response.body);
        if(data['driverProfile']!=null){
          driverId=data['driverProfile'];
        }
        break;
      case 404:
        print('***************************************************************ressource not found');
        break;
      default:
        print('**************************************unknown*************************error');
        break;
    }
  } catch(e){
    print(e);
  }
  return driverId;
}

getbalance() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int initialValue = await prefs.getInt('balance')?? 0;
  return initialValue;

}

actualisebalance(int value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setInt('balance',value);

}

//logout

Future<bool> logout() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('uid');
}

