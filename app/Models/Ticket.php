<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Ticket extends Model
{
    protected $fillable = ['name', 'status', "note"];
    protected $keyType = 'string';
    public $incrementing = false;
    /** @use HasFactory<\Database\Factories\TicketFactory> */
    use HasFactory;

    public static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->id = Str::uuid();
        });
    }
}
