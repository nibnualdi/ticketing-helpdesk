<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\History;
use App\Models\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TicketController extends Controller
{
    public function index()
    {
        $tickets = Ticket::orderBy('created_at', 'desc')->paginate(10);

        return view('ticket.index', ['tickets' => $tickets]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'category_id' => 'required',
        ]);
        $validated['user_id'] = Auth::id();
        
        $ticket = Ticket::create($validated);

        History::create([
            'action' => "[Created] $ticket->name ($ticket->id)",
            'user_id' => Auth::id()
        ]);

        return redirect()->route('home');
    }

    public function edit($id)
    {
        $ticket = Ticket::find($id);
        $categories = Category::all();
        $status = [
            'open',
            'on progress',
            'resolved',
            'closed'
        ];

        return view('edit', ['ticket' => $ticket, 'categories' => $categories, 'status' => $status]);
    }

    public function editAction(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'category_id' => 'required',
            'status' => 'required',
            'note' => 'nullable'
        ]);


        $ticket = Ticket::findOrFail($id);
        $ticket->update($validated);
        History::create([
            'action' => "[Updated] $ticket->name ($ticket->id)",
            'user_id' => Auth::id()
        ]);

        return redirect()->route('home')->with('success', 'Ticket updated successfully!');
    }
}
