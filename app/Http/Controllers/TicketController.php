<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\History;
use App\Models\Ticket;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TicketController extends Controller
{
    public function index()
    {
        $tickets = Ticket::orderBy('created_at', 'desc')->paginate(10);
        $categories = Category::all();

        return view('home', ['tickets' => $tickets, 'categories' => $categories]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'category_id' => 'required',
        ]);
        $validated['user_id'] = Auth::id();

        $ticket = Ticket::create($validated);
        $date = date('H:i:s');

        History::create([
            'action' => "[Created] [$date] ticket: $ticket->name ($ticket->id) | category: {$ticket->category->name}",
            'user_id' => Auth::id()
        ]);

        return redirect()->route('ticket.filterByStatusDateCategory');
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

        // Fill the model with new data (but don't save yet)
        $ticket->fill($validated);

        // Check which attributes have changed
        $changes = $ticket->getDirty();

        // If there are changes, save them
        if (!empty($changes)) {
            $ticket->save();
        }

        $changesSummary = [];
        foreach ($changes as $field => $newValue) {
            $changesSummary[$field] = [
                'old' => $ticket->getOriginal($field),
                'new' => $newValue,
            ];
        }

        $strChangesSummary = json_encode($changesSummary);
        $date = date('H:i:s');

        History::create([
            'action' => "[Updated] [$date] ticket: $strChangesSummary",
            'user_id' => Auth::id()
        ]);

        return redirect()->route('home')->with('success', 'Ticket updated successfully!');
    }

    public function filterByStatusDateCategory(Request $request)
    {
        $validated = $request->validate([
            'status' => 'nullable',
            'category' => 'nullable',
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
        ]);

        $filters = [
            'status' => [
                'column' => 'status',
                'ignore' => ['Status ticket', null, ''],
                'type' => 'exact',
            ],
            'category' => [
                'column' => 'category_id',
                'ignore' => ['Categories', null],
                'type' => 'exact',
            ],
            'start_date' => [
                'column' => 'created_at',
                'ignore' => [null],
                'type' => 'date_start',
            ],
            'end_date' => [
                'column' => 'created_at',
                'ignore' => [null],
                'type' => 'date_end',
            ],
        ];

        $query = Ticket::query();

        foreach ($filters as $inputKey => $config) {
            $value   = $validated[$inputKey] ?? null;
            $type    = $config['type'] ?? 'exact';
            $column  = $config['column'];
            $ignore  = $config['ignore'] ?? [null];

            if (in_array($value, $ignore, true)) continue;

            match ($type) {
                'exact'       => $query->where($column, $value),
                'like'        => $query->where($column, 'like', '%' . $value . '%'),
                'date_start' => $query->where($column, '>=', $value),
                'date_end'   => $query->where($column, '<=', $value),
                default       => null,
            };
        }

        $tickets = $query->paginate(10);
        $categories = Category::all();

        return view('home', ['tickets' => $tickets, 'categories' => $categories]);
    }
}
