
import 'package:dizi_takip/Sekmeler/sign.dart';
import 'package:dizi_takip/sekmeler/userpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passawordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Future signIn() async {

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passawordController.text.trim(),


        );
        // ignore: use_build_context_synchronously
        Navigator.
        push(context,
            MaterialPageRoute(builder: (context) => userpage()));
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content : Text(e.message.toString(),)));

      }


    }
    return  Scaffold (
      appBar: AppBar(title: const Text("Giriş Yap"),) ,
      body: SafeArea(
        child: Stack(
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Center(child: Text("Giriş Yap" , style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),)),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Mail Adresi ",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextField(
                      controller: passawordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          hintText: "Şifre",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,


                              )
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(padding:
                        const EdgeInsets.all(12),
                          child: ElevatedButton(
                              style:
                              ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () async {

                                signIn().then((value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content : Text("Hoşgeldiniz")));
                                },
                                );
                              },
                              child: const Text(
                                "Giriş Yap",
                                style: TextStyle(fontSize: 25),
                              )

                          ),

                        ),
                        const SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child:  ElevatedButton(
                              style:
                              ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () async {

                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) {
                                  return
                                    const signpage();
                                }
                                ));

                              },
                              child: const Text(
                                "Üye Ol",
                                style: TextStyle(fontSize: 25),
                              )

                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
// class loginpage extends StatefulWidget {
//   const loginpage({Key? key}) : super(key: key);
//
//   @override
//   State<loginpage> createState() => _loginpageState();
// }
//
// class _loginpageState extends State<loginpage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passawordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     Future signIn() async {
//
//       try {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passawordController.text.trim(),
//
//
//         );
//         Navigator.
//         push(context,
//             MaterialPageRoute(builder: (context) => Homapage()));
//       } on FirebaseAuthException catch (e) {
//         print('Failed with error code: ${e.code}');
//         print(e.message);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content : Text(e.message.toString(),)));
//
//       }
//
//
//     }
//
//     return  Scaffold (
//       appBar: AppBar(title: Text("Giriş Yap"),) ,
//       body: SafeArea(
//         child: Stack(
//             children:[
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                   children:  [
//                     Center(child: Text("Giriş Yap" , style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),)),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: "Mail Adresi ",
//                         enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             )
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                             )
//                         ),
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                     ),
//                     TextField(
//                       controller: passawordController,
//                       keyboardType: TextInputType.visiblePassword,
//                       obscureText: true,
//                       enableSuggestions: false,
//                       autocorrect: false,
//                       decoration: InputDecoration(
//                           hintText: "Şifre",
//                           enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//
//
//                               )
//                           ),
//                           prefixIcon: Icon(Icons.vpn_key),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                               )
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//
//                       children: [
//                         Padding(padding:
//                         EdgeInsets.all(12),
//                           child: ElevatedButton(
//                               style:
//                               ElevatedButton.styleFrom(primary: Colors.blue),
//                               onPressed: ()  {
//                                 // final _auth = FirebaseAuth.instance;
//                                 // try {
//                                 // _auth.createUserWithEmailAndPassword(email: emailController.text, password: passawordController.text);
//                                 // } catch (e) { print(e);
//                                 //
//                                 // }
//                               },
//                               child: const Text(
//                                 "Giriş Yap",
//                                 style: TextStyle(fontSize: 25),
//                               )
//
//                           ),
//
//                         ),
//                         SizedBox(width: 15),
//                         Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child:  ElevatedButton(
//                               style:
//                               ElevatedButton.styleFrom(primary: Colors.blue),
//                               onPressed: () async {
//
//                                 Navigator.push(
//                                     context, MaterialPageRoute(builder: (context) {
//                                   return
//                                     signpage();
//                                 }
//                                 ));
//
//                               },
//                               child: const Text(
//                                 "Üye Ol",
//                                 style: TextStyle(fontSize: 25),
//                               )
//
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ]
//         ),
//       ),
//     );
//   }
// }