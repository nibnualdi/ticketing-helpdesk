<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class History extends Model
{
    // protected $fillable = ['action', 'user_id'];
    protected $fillable = ['action', 'user_id'];
    protected $keyType = 'string';
    public $incrementing = false;

    /** @use HasFactory<\Database\Factories\HistoryFactory> */
    use HasFactory;

    public static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->id = Str::uuid();
        });
    }
}
