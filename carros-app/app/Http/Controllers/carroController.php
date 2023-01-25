<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Carros;
class carroController extends Controller
{
    public function index (){
        $carros = Carros::all();
        return ['carros'=>$carros];

    }

    public function store (Request $request){
      $carros = new Carros;   
      $carros->marca = $request->marca;  
      $carros->ilha = $request->ilha;
      $carros->Descricao = $request->description; 
      $carros->valor = $request->valor;
       
      $carros->kilometragem = $request->kilometragem;
      
     
      
      if($request->File('image') && $request->file('image')->isValid()) {

        $requestImage = $request->image;

        $extension = $requestImage->extension();

        $imageName = md5($requestImage->getClientOriginalName() . strtotime("now")) . "." . $extension;

        $requestImage->move(public_path('images/carros'), $imageName);

        $carros->imagem = $imageName;
      
    }

    
      
      $carros->save();
      return redirect ('/');
    }
    public function show($id){

      $carro = Carros::findOrfail ($id);

      return view('detalhe',['carros'=>$carro]);

    }

    public function update(Request $request, $id ){
      
      $carros = Carros::find($id);
      
      $carros->save();
      
    }
    public function delete( $id ){
      
      $carros = Carros::find($id);
      
      $carros->delete();
      
    }
}
