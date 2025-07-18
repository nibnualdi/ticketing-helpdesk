<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Ticket extends Model
{
    protected $fillable = ['name', 'status', 'note', 'user_id', 'category_id'];
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

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function user() {
        return $this->belongsTo(User::class);
    }
}
