import 'dart:convert';
import 'package:http/http.dart' as http;



class Api {
  //SEND TO EXTERNAL
  Future<dynamic> sendRequest(memberid,name,amount) async {
    var url = "http://10.0.2.2/githubprojects/githubprojectone/api/testing";
    Map < String, dynamic > ? responseObject;
    try {
      var map = Map<String, dynamic>();
      map['memberid'] = memberid.toString();
      map['name'] = memberid.toString();
      map['amount'] = amount;
      final response = await http.post(Uri.parse(url), body: map);
      print('API Response: ${response.body}');
      responseObject=jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return responseObject;
  }


  
//end of api srvice
}