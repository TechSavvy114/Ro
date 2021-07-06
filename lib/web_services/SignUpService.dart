import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_ro_test/User/OfferScreen.dart';
import 'package:flutter_ro_test/model/AddToCartModel.dart';
import 'package:flutter_ro_test/model/BrandModel.dart';
import 'package:flutter_ro_test/model/CItyModel.dart';
import 'package:flutter_ro_test/model/CategoryModel.dart';
import 'package:flutter_ro_test/model/ClearAllModel.dart';
import 'package:flutter_ro_test/model/ComplaintModel.dart';
import 'package:flutter_ro_test/model/IssueModel.dart';
import 'package:flutter_ro_test/model/LeadAcceptModel.dart';
import 'package:flutter_ro_test/model/LeadModel.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/model/LoginModel.dart';
import 'package:flutter_ro_test/model/NotificationModel.dart';
import 'package:flutter_ro_test/model/OfferScreenModel.dart';
import 'package:flutter_ro_test/model/OrderHistoryModel.dart';
import 'package:flutter_ro_test/model/OrderModel.dart';
import 'package:flutter_ro_test/model/PartsModel.dart';
import 'package:flutter_ro_test/model/ProductModel.dart';
import 'package:flutter_ro_test/model/RechargeModel.dart';
import 'package:flutter_ro_test/model/ServiceModel.dart';
import 'package:flutter_ro_test/model/StateModel.dart';
import 'package:flutter_ro_test/model/VendorSignLogin.dart';
import 'package:flutter_ro_test/model/VendorSignUpData.dart';
import 'package:flutter_ro_test/model/VerifyModel.dart';
import 'package:flutter_ro_test/model/WalletUpdateModel.dart';

class SignUpService {

  Future<VendorSignUpData> createUser(String username, String useremail, String usernumber, String useraddress,
      String cid, String sid, String pincode, String password) async {
    final http.Response response = await http.post('https://just24you.com/ro_app/users/index.php?action=insert',
      headers: <String, String>{
        //'Content-Type': 'application/json; charset=UTF-8',
        'authentication-key': 'fsgassdfgsdgrwfg'
      },
      body:{
        'username': username,
        'useremail': useremail,
        'usernumber': usernumber,
        'useraddress': useraddress,
        'cid': cid,
        'sid': sid,
        'pincode': pincode,
        'password': password
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return VendorSignUpData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }


  Future<VendorSignUpData> createVendor(String username, String useremail, String usernumber, String useraddress,
      String cid, String sid, String pincode, String password,String gstin,String idprooftype,String idproofno) async {
    final http.Response response = await http.post('https://just24you.com/ro_app/vendor/index.php?action=insert',
      headers: <String, String>{
        //'Content-Type': 'application/json; charset=UTF-8',
        'authentication-key': 'fsgassdfgsdgrwfg'
      },
      body:{
        'name': username,
        'email': useremail,
        'phone': usernumber,
        'address': useraddress,
        'cid': cid,
        'sid': sid,
        'pincode': pincode,
        'password': password,
        'gstin':gstin,
        'idprooftype':idprooftype,
        'idproofno':idproofno
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return VendorSignUpData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create vendor');
    }
  }


  Future<LoginModel> getLoginData(String uid,String password) async{
    final http.Response response = await http.post('https://just24you.com/ro_app/users/index.php?action=login_user',
        headers: <String,String>{
        //'Content-Type': 'application/json; charset=UTF-8',
        'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:{
          'uid' : uid,
          'password' : password

    });
    if(response.statusCode==200){
      print(response.body);
      return LoginModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('login failed');
    }
  }

  Future<VendorSignLogin> getLoginDataForVendor(String uid,String password) async{
    final http.Response response = await http.post('https://just24you.com/ro_app/vendor/index.php?action=login_vendor',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:{
          'uid' : uid,
          'password' : password

        });
    if(response.statusCode==200){
      print(response.body);
      return VendorSignLogin.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('login failed');
    }
  }

  Future<StateDataModel> getStateIds() async {
    final http.Response response=await http.post('https://just24you.com/ro_app/state/index.php?action=view',
    headers: <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authentication-key': 'fsgassdfgsdgrwfg'
    });
    if(response.statusCode==200){
      //print(response.body);
      return StateDataModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch state');
    }
  }

  Future<CategoryModel> getCategories() async{
    final http.Response response=await http.get('https://just24you.com/ro_app/category/index.php?action=view',
    headers: <String,String>{
      'authentication-key': 'fsgassdfgsdgrwfg'
    });

    if(response.statusCode==200){
      print(response.body);
      return CategoryModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch data');
    }
  }

  Future<ProductModel> getProductById(String id) async{
    final http.Response response=await http.post('https://just24you.com/ro_app/products/index.php?action=view_by_category',
        headers: <String,String>{
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
    body:json.encode({
      'cat_id': id
    })
    );

    if(response.statusCode==200){
      print(response.body);
      return ProductModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch data');
    }
  }

  Future<CityModel> getCities(String sid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/city/index.php?action=view',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
    body:{
        'sid':sid,
    });
    if(response.statusCode==200){
      print(response.body);
      return CityModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch cities');
    }
  }

  Future<PartsModel> getPart() async {
    final http.Response response=await http.get('https://just24you.com/ro_app/parts/index.php?action=view',
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
       );
    if(response.statusCode==200){
      print('here is parts     ===  ${response.body}');

      return PartsModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch parts');
    }
  }

  Future<LeadModel> postLead(String uid,String name,String email,int number,
                            String cid,String sid,int pincode,String address,
                            int service_id,int brand_id,int issue_id, String detail) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/lead/index.php?action=insert',
      headers: <String,String>{
        'authentication-key': 'fsgassdfgsdgrwfg'
      },
      body: jsonEncode({
        'uid':uid,
        'username':name,
        'useremail':email,
        'usernumber':number,
        'cid':cid,
        'sid':sid,
        'userpincode':pincode.toString(),
        'useraddress':address,
        'service_id':service_id.toString(),
        'brand_id':brand_id.toString(),
        'issue_id':issue_id.toString(),
        'details' : detail
      }));
    if(response.statusCode==200){
      print(response.body);
      return LeadModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to post lead');
    }
  }


  Future<IssueModel> getIssue() async{
    final http.Response response=await http.get('https://just24you.com/ro_app/issues/index.php?action=view',
        headers: <String,String>{
          'authentication-key': 'fsgassdfgsdgrwfg'
        });

    if(response.statusCode==200){
      print(response.body);
      return IssueModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch issue');
    }
  }

  Future<ServiceModel> getService() async{
    final http.Response response=await http.get('https://just24you.com/ro_app/services/index.php?action=view',
        headers: <String,String>{
          'authentication-key': 'fsgassdfgsdgrwfg'
        });

    if(response.statusCode==200){
      print(response.body);
      return ServiceModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch service');
    }
  }

  Future<BrandModel> getBrand() async{
    final http.Response response=await http.get('https://just24you.com/ro_app/brands/index.php?action=view',
        headers: <String,String>{
          'authentication-key': 'fsgassdfgsdgrwfg'
        });
    if(response.statusCode==200){
      print(response.body);
      return BrandModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch brand');
    }
  }

  Future<LeadShowModel> getLeads(String cid,String sid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/get_lead.php?action=get_lead',
        headers: <String,String>{
        // 'Content-Type': 'application/x-www-form-urlencoded',
          'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'cid':cid,
          'sid':sid
        }));
    if(response.statusCode==200){
      print(response.body);
      return LeadShowModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch Leads');
    }
  }

  Future<LeadShowModel> getAcceptedLeads(String vid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/get_lead.php?action=get_accepted_lead',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'vid':vid
        }));
    if(response.statusCode==200){
      print(response.body);
      return LeadShowModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch Leads');
    }
  }

  Future<LeadShowModel> getDeniedLeads(String vid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/get_lead.php?action=get_denied_lead',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'vid':vid
        }));
    if(response.statusCode==200){
      print(response.body);
      return LeadShowModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch Leads');
    }
  }

  Future<LeadShowModel> getOngoingLeads(String vid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/get_lead.php?action=get_ongoing_lead',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'vid':vid
        })); 
    if(response.statusCode==200){
      print(response.body);
      return LeadShowModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch Leads');
    }
  }

  Future<LeadShowModel> getCompletedLeads(String vid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/get_lead.php?action=get_completed_lead',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'vid':vid
        }));
    if(response.statusCode==200){
      print(response.body);
      return LeadShowModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch Leads');
    }
  }

  Future<LeadAcceptModel> getLeadAcceptResponse(String lid,String vid,String vendor_status,String lead_cost) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/update_leads.php?action=update_leads',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:json.encode({
          'lid':lid,
          'vid':vid,
          'vendor_status':vendor_status,
          'lead_cost':lead_cost
        }));
    /*if(response.statusCode==200){*/
      // print(response.body);
      return LeadAcceptModel.fromJson(jsonDecode(response.body));
    /*}else{
      throw Exception('failed to fetch Leads Accept response');
    }*/
  }

  Future<LeadAcceptModel> getLeadCompletedResponse(String lid,String vid,String vendor_status,String remark) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/update_leads.php?action=update_leads',
        headers: <String,String>{
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:json.encode({
          'lid':lid,
          'vid':vid,
          'vendor_status':vendor_status,
          'remark':remark
        }));
    if(response.statusCode==200){
      print(response.body);
      return LeadAcceptModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch Leads complete response');
    }
  }




  Future<VerifyModel> getVerified(String code,String lid,String vid,String vendor_status,) async{
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/update_leads.php?action=verify_code',
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
      body: json.encode({
        'verification_code':code,
        'lid':lid,
        'vid':vid,
        'vendor_status':vendor_status
      })
    );
    if(response.statusCode==200){
      print(response.body);
      return VerifyModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch data');
    }
  }

  Future<AddToCartModel> getCartResponse(String user_id,String session_id,String item_id, String item_type, String item_quality,
      String item_price, String item_discount, String discount_amount, String total_price) async {

    print("$user_id + $session_id + $item_type + $item_id + $item_quality + $item_price + $item_discount + $discount_amount + $total_price");
    final http.Response response=await http.post('https://just24you.com/ro_app/cart/index.php?action=add_to_cart',
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'vid':user_id,
          'session_id': session_id,
          'item_id': item_id,
          'item_type': item_type,
          'item_quantity': item_quality,
          'item_price': item_price,
          'item_discount': item_discount,
          'discount_amount': discount_amount,
          'total_price': total_price,
          'user_type':'vendor'
        }));
    if(response.statusCode==200){
      //print(response.body);
      return AddToCartModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to Add product in cart');
    }
  }


  Future<AddToCartModel> getCart(String session_id) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/cart/get_cart_details.php?action=get_details',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:json.encode({
          'session_id': session_id,
        }));
    if(response.statusCode==200){
      print(response.body);
      return AddToCartModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to Add product in cart');
    }
  }

  Future<AddToCartModel> deleteItem(String session_id,String cart_detail_id) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/cart/index.php?action=delete_from_cart',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          'session_id': session_id,
          'cart_detail_id' : cart_detail_id,
        }));
    if(response.statusCode==200){
      print(response.body);
      return AddToCartModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to Delete product in cart');
    }
  }




  Future<void> raiseComplaint(String uid,String vid,String lead_id,String number,String reason, String detail) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/users/raise_complaint.php?action=insert',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          "uid":uid,
          "vid":vid,
          "lid":lead_id,
          "number": number,
          "reason" : reason,
          "complaint_details" : detail
        }));
    if(response.statusCode==200){
      print(response.body);
    }else{
      throw Exception('Failed to raise complaint');
    }
  }

  Future<OfferScreenModel> getOffer() async {
    final http.Response response=await http.get('https://just24you.com/ro_app/offers/index.php?action=view',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        );
    if(response.statusCode==200){
      print(response.body);
      return OfferScreenModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('No new offer');
    }
  }

  Future<NotificationModel> getNotification(String session_id) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/notification/index.php?action=view',
      headers: <String,String>{
        //'Content-Type': 'application/json; charset=UTF-8',
        'authentication-key': 'fsgassdfgsdgrwfg'
      },
        body:jsonEncode({
          "session_id" : session_id,
        })
    );
    if(response.statusCode==200){
      print(response.body);
      return NotificationModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to fetch notification');
    }
  }


  Future<WalletUpdateModel> getUpdateWallet(String id) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/wallet_balance.php?action=get_balance',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          "id" : id,
        })
    );
    if(response.statusCode==200){
      print(response.body);
      return WalletUpdateModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to update wallet');
    }
  }


  Future<ClearAllModel> getClearNotification(String session_id) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/notification/index.php?action=clear_all',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          "session_id" : session_id,
        })
    );
    if(response.statusCode==200){
      print(response.body);
      return ClearAllModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to clear notification');
    }
  }

  Future<GetComplaintModel> getComplaint(String session_id) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/vendor/complaints.php?action=get_complaint',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:jsonEncode({
          "session_id" : session_id,
        })
    );
    if(response.statusCode==200){
      print(response.body);
      return GetComplaintModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to get complaint data');
    }
  }

  Future<RechargeModel> getRechargeStatus(String vid, String session_id, String amount, String payment_id) async{
    final http.Response response= await http.post('https://just24you.com/ro_app/vendor/wallet_recharge.php?action=recharge',
    headers: <String,String>{
      'authentication-key': 'fsgassdfgsdgrwfg'
    },
      body: json.encode({
        'vid' : vid,
        'session_id': session_id,
        'amount':amount,
        'payment_id':payment_id,
        "payment_status" : "success"
      })
    );
    if(response.statusCode==200){
      print(response.body);
      return RechargeModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to update Recharge');
    }
  }

  Future<OrderHistoryModel> getOrderHistory(String session_id) async{
    final http.Response response= await http.post('https://just24you.com/ro_app/vendor/get_order_history.php?action=get_details',
        headers: <String,String>{
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body: json.encode({
          'session_id': session_id,

        })
    );
    if(response.statusCode==200){
      print(response.body);
      return OrderHistoryModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to fetch result');
    }
  }


  Future<OrderModel> getOrder(String session_id,String amount,String paymentID,String vid) async {
    final http.Response response=await http.post('https://just24you.com/ro_app/order/index.php?action=add_order',
        headers: <String,String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'authentication-key': 'fsgassdfgsdgrwfg'
        },
        body:json.encode({
          'vid':vid,
          "user_type": "vendor",
          'session_id': session_id,
          'amount':amount,
          'payment_id':paymentID,
          "payment_status": "success"
        }));
    if(response.statusCode==200){
      print(response.body);
      return OrderModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to Add product in cart');
    }
  }

}
