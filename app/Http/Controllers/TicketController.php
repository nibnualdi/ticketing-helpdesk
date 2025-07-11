<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Ticket;
use Illuminate\Http\Request;

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
            'category_id' => 'required'
        ]);
        Ticket::create($validated);
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

        Ticket::where('id', $id)->update($validated);

        return redirect()->route('home')->with('success', 'Ticket updated successfully!');
    }
}
