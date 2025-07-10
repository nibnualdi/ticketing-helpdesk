<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    public function index() {
        $tickets = Ticket::orderBy('created_at', 'desc')->paginate(10);

        return view('ticket.index', ['tickets' => $tickets]);
    }

    public function store(Request $request) {
        $validated = $request->validate([
            'name' => 'required|string',
            'category_id' => 'required'
        ]);
        Ticket::create($validated);
        return redirect()->route('home');
    }
}
