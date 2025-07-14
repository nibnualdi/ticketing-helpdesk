@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="my-3 p-3 bg-body rounded shadow-sm">
            <div class="border-bottom pb-2">
                <div class="mb-0 d-flex align-items-center justify-content-between gap-3 border-bottom py-3">
                    <h6 class="">Tickets</h6>
                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">Make A Ticket</button>


                    <!-- Modal -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Add a ticket</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <form action={{ route('ticket.store') }} method="POST">
                                    @csrf
                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="mb-3">
                                                <label for="" class="form-label">Add a name, use, or actions</label>
                                                <input class="form-control form-control-lg" type="text"
                                                    placeholder="type here..." aria-label=".form-control-lg example"
                                                    id="name" name="name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="" class="form-label">Select a category</label>
                                                <select class="form-select form-select-lg mb-3"
                                                    aria-label=".form-select-lg example" name="category_id",
                                                    id="category_id">
                                                    {{-- <option selected="">Open to select category</option> --}}
                                                    @foreach ($categories as $category)
                                                        <option value={{ $category->id }}
                                                            {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                                            {{ $category->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                @can('viewFilter', App\Models\Ticket::class)
                    <div class="container">
                        <form action={{ route('ticket.filterByStatusDateCategory') }} method="GET">
                            <div class="row mt-3">
                                <div class="col">
                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                                        name="status" id="status">
                                        <option selected>Status ticket</option>
                                        <option value="open" {{ request('status') == 'open' ? 'selected' : '' }}>Open</option>
                                        <option value="on progress" {{ request('status') == 'on progress' ? 'selected' : '' }}>
                                            On Progress</option>
                                        <option value="resolved" {{ request('status') == 'resolved' ? 'selected' : '' }}>
                                            Resolved</option>
                                        <option value="closed" {{ request('status') == 'closed' ? 'selected' : '' }}>Closed
                                        </option>
                                    </select>
                                </div>
                                <div class="col">
                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                                        name="category" id="category">
                                        <option selected>Categories</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}"
                                                {{ request('category') == $category->id ? 'selected' : '' }}>
                                                {{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div>
                                        <label for="start" class="form-label">Start Date</label>
                                        <input type="date" class="form-control" placeholder="Enter Start Date"
                                            name="start_date" id="start_date" value="{{ request('start_date') }}">
                                    </div>
                                </div>
                                <div class="col">
                                    <div>
                                        <label for="end" class="form-label">End Date</label>
                                        <input type="date" class="form-control" placeholder="Enter End Date" name="end_date"
                                            id="end_date" value="{{ request('end_date') }}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary my-3 ">Submit filter</button>
                                </div>
                            </div>
                        </form>
                    </div>
                @endcan

            </div>
            @foreach ($tickets as $ticket)
                <div class="d-flex align-items-center justify-content-between text-muted py-3">
                    <div class="container d-flex align-items-center">
                        @if ($ticket->status === 'open')
                            <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32"
                                xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32"
                                preserveAspectRatio="xMidYMid slice" focusable="false">
                                <title>Placeholder</title>
                                <rect width="100%" height="100%" fill="#255C99" />
                            </svg>
                        @elseif($ticket->status === 'closed')
                            <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32"
                                xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32"
                                preserveAspectRatio="xMidYMid slice" focusable="false">
                                <title>Placeholder</title>
                                <rect width="100%" height="100%" fill="#262626" />
                            </svg>
                        @elseif($ticket->status === 'on progress')
                            <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32"
                                xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32"
                                preserveAspectRatio="xMidYMid slice" focusable="false">
                                <title>Placeholder</title>
                                <rect width="100%" height="100%" fill="#FFC759" />
                            </svg>
                        @elseif($ticket->status === 'resolved')
                            <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32"
                                xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32"
                                preserveAspectRatio="xMidYMid slice" focusable="false">
                                <title>Placeholder</title>
                                <rect width="100%" height="100%" fill="#55D6BE" />
                            </svg>
                        @endif

                        <p class="mb-0 small lh-sm border-bottom d-flex flex-column justify-content-center">
                            <strong class="d-block text-gray-dark">{{ $ticket->name }}</strong>
                            <span>{{ '(' . $ticket->category->name . ')' }}</span>
                            @if ($ticket->note)
                                <span>{{ $ticket->note }}</span>
                            @endif
                        </p>
                    </div>

                    @if ($ticket->status === 'open')
                        <p class="border-bottom m-3" style="color: #255C99;">{{ $ticket->status }}</p>
                    @elseif($ticket->status === 'closed')
                        <p class="border-bottom m-3" style="color: #262626;">{{ $ticket->status }}</p>
                    @elseif($ticket->status === 'on progress')
                        <p class="border-bottom m-3" style="color: #FFC759;">{{ $ticket->status }}</p>
                    @elseif($ticket->status === 'resolved')
                        <p class="border-bottom m-3" style="color: #55D6BE;">{{ $ticket->status }}</p>
                    @endif

                    <a href={{ route('ticket.edit', $ticket->id) }}>
                        <button type="button" class="btn btn-outline-secondary">edit</button>
                    </a>
                </div>
            @endforeach
            <small class="d-flex justify-content-center mt-3">
                {{ $tickets->links() }}
            </small>
        </div>
    </div>
@endsection
