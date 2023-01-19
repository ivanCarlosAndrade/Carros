<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class verificarSessao
{
    
    public function handle(Request $request, Closure $next)
    {

        if(!session()->has('usuario')){
            return redirect('login');
        }
        return $next($request);
    }
}
