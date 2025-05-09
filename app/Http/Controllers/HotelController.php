<?php

namespace App\Http\Controllers;

use App\Models\Hotel;
use Cloudinary\Cloudinary;
use Illuminate\Http\Request;

class HotelController extends Controller
{
    protected $cloudinary;

    public function __construct(Cloudinary $cloudinary)
    {
        $this->cloudinary = $cloudinary;
    }

    public function store(Request $request){

        $this->validate($request, [
            'name' => 'required|unique:hotels',
            'address' => 'required',
            'city' => 'required',
            'nit' => 'required|unique:hotels',
            'room' => 'required|integer',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048'
        ]);

        try {
            $uploadedFile = $request->file('image');
            $result = $this->cloudinary->uploadApi()->upload($uploadedFile->getRealPath(), [
                'folder' => 'hotel',
            ]);

            $hotel = Hotel::create([
                "name" => $request->name,
                "address" => $request->address,
                "city" => $request->city,
                "nit" => $request->nit,
                "room" => $request->room,
                'image' => $result['url'],
            ]);

           return response()->json([
                'message' => 'Se ha creado con exito',
                'data' => $hotel,
                'res' => true
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error ' . $e->getMessage(),
                'res' => false,
            ]);
        }

        
    }
}
