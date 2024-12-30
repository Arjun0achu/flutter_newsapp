import 'package:flutter/material.dart';
import 'package:flutter_newsapp/view/bottom_navigationbar/bottom_navigation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
     
          Container(
           
            height: double.infinity,
            child: Image.network(
              'https://images.pexels.com/photos/15141515/pexels-photo-15141515/free-photo-of-a-man-in-glasses-sitting-at-a-table-with-a-laptop.jpeg?auto=compress&cs=tinysrgb&w=600',
              fit: BoxFit.cover,
            ),
          ),
          
          Positioned(
            bottom: 30, 
            left: 20, 
            right: 20,  
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),border: Border.all(width: 2),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavigation()),
                      );
                    },
                    child: const Text(
                      'SignUp With Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
