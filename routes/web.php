<?php

use Illuminate\Support\Facades\Route;

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::post('/', [App\Http\Controllers\TicketController::class, 'store'])->name('ticket.store');

Auth::routes();

Route::get('/ticket/{id}', [App\Http\Controllers\TicketController::class, 'edit'])->name('ticket.edit');
Route::put('/ticket/{id}', [App\Http\Controllers\TicketController::class, 'editAction'])->name('ticket.editAction');
