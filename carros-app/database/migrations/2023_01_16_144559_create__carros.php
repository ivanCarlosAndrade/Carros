<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuario', function (Blueprint $table) {
            $table->increments('id_usuario');
            $table->string('nome');
            $table->string('email');
            $table->string('contacto');
            $table->string('password');
            $table->timestamps();
        });

        Schema::create('carro', function (Blueprint $table) {
            $table->increments('id_carro');
            $table->unsignedInteger('id_usuario');
            $table->string('marca');
            $table->string('ilha');
            $table->string('imagem');
            $table->string('kilometragem');
            $table->integer('valor');
            $table->text('descricao');
            $table->timestamps();

            $table->foreign('id_usuario')->references('id_usuario')->on('usuario')->ondelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuario');
        Schema::dropIfExists('carros');
    }
};
