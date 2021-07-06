
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  String name, address, phone, email,wallet;
  Profile(this.name, this.address, this.phone, this.email, this.wallet);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController walletController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text='Name: '+widget.name;
    phoneController.text='Contact No: '+widget.phone.toString();
    addressController.text='Address: '+widget.address;
    emailController.text='Email: '+widget.email;
    walletController.text='Wallet Amount: Rs '+widget.wallet;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    Padding(
                     padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new TextFormField(
                              controller: nameController,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                               ),
                              style: TextStyle(color: Colors.white70),
                            )
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 1.0, color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                controller: phoneController,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    ),
                                style: TextStyle(color: Colors.white70),
                              )
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 1.0, color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                controller: addressController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.white70),
                              )
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 1.0, color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                controller: emailController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.white70),
                              )
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 1.0, color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                controller: walletController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.white70),
                              )
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 1.0, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}




/*



class Profile extends StatefulWidget {

  String name, address, phone, email,wallet;
  Profile(this.name, this.address, this.phone, this.email, this.wallet);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController walletController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text='Name: '+widget.name;
    phoneController.text='Contact No: '+widget.phone.toString();
    addressController.text='Address: '+widget.address;
    emailController.text='Email: '+widget.email;
    walletController.text='Wallet Amount: Rs '+widget.wallet;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      debugShowCheckedModeBanner: false,
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
 */
/* final String _fullName = ;
  final String _status = "Software Developer";
  final String _bio =
      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";*//*


  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ro.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nickfrost.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return TextFormField(
      controller: ,
    );

    */
/*Text(,

      style: _nameTextStyle,
    );*//*

  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Total Lead", _followers),
          _buildStatItem("Completed", _posts),
          _buildStatItem("Denied", _scores),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "FOLLOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () => print("Message"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "MESSAGE",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  _buildStatContainer(),
                  _buildBio(context),
                  _buildSeparator(screenSize),
                  SizedBox(height: 10.0),
                  _buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
