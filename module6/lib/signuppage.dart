import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget
{
  @override
  SignUpState createState() => SignUpState();


}

class SignUpState extends State<SignUpPage>
{
  final _formkey = GlobalKey<FormState>();

  String name = '';
  String mobileno = '';
  String email = '';
  String password = '';
  String confirmpassword = '';


  final nameController = TextEditingController();
  final mobilenoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  _clearText() {
    emailController.clear();
    passwordController.clear();
  }

  CollectionReference addUser =
  FirebaseFirestore.instance.collection('Students');
  Future<void> _registerUser() {
    return addUser
        .add({'Email': email, 'Password': password})
        .then((value) => print('User Added'))
        .catchError((_) => print('Something Error In registering User'));
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 150,),
                Icon(Icons.chat, color: Colors.indigoAccent, size: 70.0,),

                SizedBox(height: 20,),
                Text("Chatter", style: TextStyle(color: Colors.indigoAccent, fontSize: 20, fontWeight: FontWeight.bold),),

                SizedBox(height: 30,),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),

                  width: 300,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      icon: Icon(Icons.person, color: Colors.indigoAccent,),
                      hintText: "Full Name",
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),

                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {

                    },
                    validator: (value) {
                      name = value!;
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter Name';
                      }

                      return null;
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),

                  width: 300,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: mobilenoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      icon: Icon(Icons.phone, color: Colors.indigoAccent,),
                      hintText: "Mobile No",
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),

                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (value) {

                    },
                    validator: (value) {
                      mobileno = value!;
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter Mobile No';
                      }

                      return null;
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),

                  width: 300,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      icon: Icon(Icons.email, color: Colors.indigoAccent,),
                      hintText: "Email",
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),

                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {

                    },
                    validator: (value) {
                      email = value!;
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter Email';
                      }

                      return null;
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),

                  width: 300,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      icon: Icon(Icons.lock, color: Colors.indigoAccent,),
                      hintText: "Password",
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),

                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onFieldSubmitted: (value) {

                    },
                    validator: (value) {
                      password = value!;
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter Password';
                      }

                      return null;
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),

                  width: 300,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: confirmpasswordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      icon: Icon(Icons.email, color: Colors.indigoAccent,),
                      hintText: "Confirm Password",
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),

                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value) {

                    },
                    validator: (value) {
                      confirmpassword = value!;
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter Confirm Password';
                      }

                      return null;
                    },
                  ),
                ),

                SizedBox(height: 20,),

                SizedBox(
                  height: 50,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          mobileno = mobilenoController.text;
                          email = emailController.text;
                          password = passwordController.text;
                          confirmpassword = confirmpassword.toString();

                          _registerUser();
                          _clearText();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        });
                      }
                    }, child: Text("Sign Up", style: TextStyle(fontSize: 18),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?", style: TextStyle(fontSize: 15, color: Colors.indigoAccent),),

                    TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Text("Login", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.indigoAccent),),),
                  ],
                ),
                SizedBox(height: 70,),

                Text("Made with ❤️ By keval")
              ],
            ),
          ),
        ),
      ),
    );
  }

}