<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function register(Request $request){
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'password' => 'required',
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return response()->json([
            'user' => [
                'email' => $request->email,
                'name' => $request->name
            ],
            'message' => 'Usuario registrado exitosamente!',
            'res' => true
        ], 200);
    }

    public function login(Request $request){

        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (! $user || ! Hash::check($request->password, $user->password)){
            return response()->json([
                'message' => 'Usuario y/o contraseña es invalido.',
                'res' => false
            ], 401);
        }

        $user->api_token = Str::random(150);
        $user->save();

        return response()->json([
            'user' => [
                'email' => $user->email,
                'name' => $user->name
            ],
            'token' => $user->api_token,
            'res' => true
        ], 200);
    }
}
