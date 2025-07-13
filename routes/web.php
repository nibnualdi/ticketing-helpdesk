<?php

use Illuminate\Support\Facades\Route;

Route::get('/', [App\Http\Controllers\TicketController::class, 'index'])->name('ticket.index');
Route::post('/', [App\Http\Controllers\TicketController::class, 'store'])->name('ticket.store');

Auth::routes();

Route::get('/tickets/{id}', [App\Http\Controllers\TicketController::class, 'edit'])->name('ticket.edit');
Route::put('/tickets/{id}', [App\Http\Controllers\TicketController::class, 'editAction'])->name('ticket.editAction');
Route::get('/', [App\Http\Controllers\TicketController::class, 'filterByStatusDateCategory'])->name('ticket.filterByStatusDateCategory');
