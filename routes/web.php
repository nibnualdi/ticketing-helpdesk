<?php

use Illuminate\Support\Facades\Route;

Route::get('/', [App\Http\Controllers\TicketController::class, 'index'])->name('ticket.index')->middleware('auth');
Route::post('/', [App\Http\Controllers\TicketController::class, 'store'])->name('ticket.store')->middleware('auth');

Auth::routes();

Route::get('/tickets/{id}', [App\Http\Controllers\TicketController::class, 'edit'])->name('ticket.edit')->middleware('auth');
Route::put('/tickets/{id}', [App\Http\Controllers\TicketController::class, 'editAction'])->name('ticket.editAction')->middleware('auth');
Route::get('/', [App\Http\Controllers\TicketController::class, 'filterByStatusDateCategory'])->name('ticket.filterByStatusDateCategory')->middleware('auth');

Route::get('/histories', [App\Http\Controllers\HistoryController::class, 'index'])->name('history.index')->middleware('auth');