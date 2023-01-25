<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\usuarios;
class usuarioController extends Controller
{
    public function index(){
        if(session()->has('usuario')){
            return view ('dashboard');
        }else{
            return view ('login');
        }
    }


   public function inserir_usuario(Request $request){

    $novo = new usuarios;

    $novo->email = $request->email;
    $novo->nome = $request->nome;
    $novo->password = Hash::make($request->pass);
    $novo->contacto = $request->contacto;
    $novo->save();
   }

   public function login (){
    $dados = usuarios::where ('email','admin@gmail.com')->first();
        if(Hash::check('12345678',$dados->password)){

            session()->put('usuario',$dados->nome);
            return ('Login com sucesso');
        }else{
            return('user ou palavra passe errado');
        }
    
   }
   public function logout(){
    session()->forget('usuario');
    return redirect('index');
   }
}

/*
nome Ivan Goncalves
email admin@gmail.com
contacto 9759796
password 12345678

*/