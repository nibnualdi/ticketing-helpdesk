<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Category extends Model
{
    protected $fillable = ['name'];
    protected $keyType = 'string';
    public $incrementing = false;

    /** @use HasFactory<\Database\Factories\CategoryFactory> */
    use HasFactory;

    public static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->id = Str::uuid();
        });
    }

    public function tickets() {
        return $this->hasMany(Ticket::class);
    }
}
