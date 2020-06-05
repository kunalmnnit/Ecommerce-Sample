import 'package:cart/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone, verificationId, smsCode;
  TextEditingController phoneController = TextEditingController(),
      codeController = TextEditingController();
  bool codeSent = false, loading = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepOrange.shade300,
                Colors.deepOrange.shade400,
                Colors.deepOrange.shade500,
                Colors.deepOrange.shade600,
              ],
            ),
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: mediaQuery.size.height * 0.3,
                ),
                Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: mediaQuery.size.width * 0.4,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).primaryColorDark,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: (!codeSent)
                        ? TextField(
                            controller: phoneController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                )),
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            onChanged: (text) {
                              setState(() {
                                phone = text;
                              });
                            },
                          )
                        : TextField(
                            controller: codeController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter OTP",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                )),
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            onChanged: (text) {
                              setState(() {
                                smsCode = text;
                              });
                            },
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                !loading
                    ? MaterialButton(
                        elevation: 10,
                        minWidth: mediaQuery.size.width * 0.5,
                        height: mediaQuery.size.height * 0.06,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.deepOrange.shade800,
                        onPressed: () {
                          if (codeSent) {
                            if (smsCode.length != 6) {
                              final snackbar = SnackBar(
                                  content: Text('Invalid Code'),
                                  backgroundColor: Colors.deepOrange[900]);
                              Scaffold.of(context).showSnackBar(snackbar);
                            } else {
                              setState(() {
                                loading = true;
                              });
                              AuthService()
                                  .signInWithOTP(smsCode, verificationId);
                            }
                          } else {
                            _signIn(context, phone);
                          }
                        },
                        child: Text(
                          !codeSent ? 'Login' : 'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.deepOrange[900])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signIn(BuildContext context, String phoneNo) {
    if (phone.isEmpty || phone.length != 10) {
      final snackbar = SnackBar(
        content: Text(
          'Invalid Phone Number',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange[900],
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      setState(() {
        loading = true;
      });
      verifyPhone('+91$phone');
      phoneController.text = '';
    }
  }

  //TODO: To be moved to service/authservice

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
        this.loading = false;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
