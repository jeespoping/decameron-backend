<?php

namespace App\Http\Controllers;

use App\Models\Description;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DescriptionController extends Controller
{
    public function store(Request $request){

        $this->validate($request, [
            'hotel_id' => "required|exists:hotels,id",
            'amount' => "required|integer",
            'type' => ["required", Rule::in(['ESTANDAR', 'JUNIOR', 'SUITE'])],
            'accommodation' => ["required", Rule::in(['SENCILLA', 'DOBLE', 'TRIPLE', 'CUADRUPLE'])]
        ]);

        $description = new Description();

        $diff = $description->diffValidatedroom($request->amount,$request->hotel_id);
        $validateH = $description->validateRoom($request->accommodation, $request->type, $request->hotel_id);
        $validatA = $description->validateaccommodation($request->accommodation, $request->type);

        if($diff["diff"] < 0){
            return response()->json([
                'message' => 'El numero de habitaciones es superior al permitido tienes disponible: '.$diff["disp"],
                'res' => false
            ]);
        }else if ($validateH > 0){
            return response()->json([
                'message' => 'No se puede hacer este registro debido a que las habitaciones ya existen para este hotel',
                'res' => false
            ]);
        }else if (!$validatA["res"]){
            return response()->json([
                'message' => $validatA["msg"],
                'res' => false
            ]);
        }

        $create = Description::create($request->all());

        if ($create){
            return response()->json([
                'message' => 'Se ha creado con exito',
                'data' => $create,
                'res' => true
            ], 200);
        }

        return response()->json([
            'message' => 'No se logro crear con exito',
            'res' => false
        ]);
    }

    public function delete($id){
        $hotel = Description::where('id', $id)->firstOrFail();

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
