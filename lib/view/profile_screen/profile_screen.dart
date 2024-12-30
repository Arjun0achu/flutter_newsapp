import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        title: Text(
          'Profile',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(Icons.edit),
              SizedBox(
                width: 5,
              ),
              Text(
                'Edit',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 14,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 14,
            left: 14,
            top: 25,
          ),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Arjun Achu',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email ID: ',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'achu@gmail.com',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 15),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  'Account Settings',
                  style: GoogleFonts.roboto(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(), 
                shrinkWrap: true, 
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Your Profile' ,style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),),
                    subtitle: Text('Edit and view profile info '),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/3574678/pexels-photo-3574678.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
