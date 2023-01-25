<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class usuarios extends Model
{
    protected $primaryKey ='id_usuario';
    protected $table = 'usuario';

    public function carros(){
        return $this->hasMany('App\carros', 'id_cliente');
    }
}


