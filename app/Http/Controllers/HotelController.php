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
                'public_id' => $result['public_id']
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

    public function index(){
        $hotel = Hotel::get();

        if ($hotel){
            return response()->json([
                'message' => 'Se encontro con exito',
                'data' => $hotel,
                'res' => true
            ]);
        }else{
            return response()->json([
                'message' => 'No se encontro con exito',
                'res' => false
            ]);
        }
    }

     public function show($id){

        $hotel = Hotel::where('id', $id)->firstOrFail();

        if ($hotel){
            return response()->json([
                'message' => 'Se encontro con exito',
                'data' => $hotel,
                'res' => true
            ]);
        }else{
            return response()->json([
                'message' => 'No se encontro con exito',
                'res' => false
            ]);
        }
    }

    public function update(Request $request,$id){

        $hotel = Hotel::findOrFail($id);

        $data = [];

        if ($request->hasFile('image')) {
            
            $this->cloudinary->uploadApi()->destroy($hotel->public_id);

            
            $uploadedFile = $request->file('image');
            $result = $this->cloudinary->uploadApi()->upload($uploadedFile->getRealPath(), [
                'folder' => 'hotel',
            ]);

            $data['image'] = $result['url'];
            $data['public_id'] = $result['public_id'];
        }
        
        $hotel->update([
            "name" => $request->name,
            "address" => $request->address,
            "city" => $request->city,
            "nit" => $request->nit,
            "room" => $request->room,
            'image' => $data['image'] ?? $request->image,
            'public_id' => $data['public_id'] ?? $request->public_id,
        ]);

        if ($hotel){
            return response()->json([
                'message' => 'Se editaron los datos con exito',
                'data' => $hotel,
                'res' => true
            ]);
        }else{
            return response()->json([
                'message' => 'No se pudieron actualizar los datos',
                'res' => false
            ]);
        }
    }

    public function delete($id){

        $hotel = Hotel::where('id', $id)->firstOrFail();
        $hotel->delete();

        if ($hotel){
            return response()->json([
                'message' => 'Se eliminaron los datos exitosamente',
                'data' => $hotel,
                'res' => true
            ]);
        }else{
            return response()->json([
                'message' => 'No se pudieron eliminar los datos',
                'res' => false
            ]);
        }
    }
}
