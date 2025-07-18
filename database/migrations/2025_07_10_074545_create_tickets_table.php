<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tickets', function (Blueprint $table) {
            $status = ['open', 'on progress', 'resolved', 'closed'];

            $table->uuid('id')->primary();
            $table->string('name');
            $table->enum('status', $status)->default($status[0]);
            $table->text('note')->nullable();
            $table->foreignUuid('user_id')->constrained()->onDelete('cascade');
            $table->foreignUuid('category_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tickets');
    }
};
