import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: Container(
        child: Form(
          child:ListView(
            
            padding: EdgeInsets.symmetric(horizontal: 500,vertical: 210),
            
            children: <Widget>[
              Text('Login', style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
               SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'exemplo@email.com',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Palavra Passe',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16,),
            ElevatedButton(
              onPressed: (){},
              
              child: Text('Entrar',
               style: TextStyle(fontSize: 18),)
              ),
              TextButton(onPressed: (){}, child: Text('Criar uma conta'))  
            ],
            ),
          
          ),
      ),
    );
  }
}
