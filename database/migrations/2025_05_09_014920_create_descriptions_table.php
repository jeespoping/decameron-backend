<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('descriptions', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('hotel_id');
            $table->integer('amount');
            $table->enum('type', ['ESTANDAR', 'JUNIOR', 'SUITE']);
            $table->enum('accommodation', ['SENCILLA', 'DOBLE', 'TRIPLE', 'CUADRUPLE']);

            $table->foreign('hotel_id')->references('id')->on('hotels')->onDelete('cascade');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('descriptions');
    }
};
