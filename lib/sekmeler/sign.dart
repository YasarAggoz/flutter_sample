
import 'package:dizi_takip/sekmeler/login.dart';
import 'package:flutter/material.dart';

class signpage extends StatefulWidget {

  const signpage({Key? key}) : super(key: key);

  @override
  State<signpage> createState() => _signpageState();
}

class _signpageState extends State<signpage> {
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {



    return  Scaffold (
      appBar: AppBar(title: const Text("Üye Ol"),) ,
      body: SafeArea(
        child: Stack(
            children:[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Center(child: Text("Üye Ol" , style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 20),
                      TextField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: "Mail adresi",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),
                      TextField(
                        controller: passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: "Parola",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),
                      ElevatedButton(
                          style:  ElevatedButton.styleFrom( primary: Colors.blue), child: null,


                          onPressed:() async {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) {
                              return
                                const loginpage();
                            }
                            )
                            );
                          }
                      ),

                      const SizedBox(height: 20),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(width: 15),
                          Padding(
                            padding: EdgeInsets.all(12.0),

                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}




Widget textekle (String text , TextEditingController controller) {
  return
    TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          )
      ),
    );
}

