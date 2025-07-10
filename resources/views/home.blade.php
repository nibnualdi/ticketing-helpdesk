@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="my-3 p-3 bg-body rounded shadow-sm">
            <div class="border-bottom pb-2">
                <div class="mb-0 d-flex align-items-center justify-content-between gap-3 border-bottom py-3">
                    <h6 class="">Tickets</h6>
                    <button type="button" class="btn btn-outline-primary">Make A Ticket</button>
                </div>
                <div class="container d-flex justify-content-between py-2">
                    <div class="w-full">
                        <div>
                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option selected>Status ticket</option>
                                <option value="open">Open</option>
                                <option value="on Progress">On Progress</option>
                                <option value="resolved">Resolved</option>
                                <option value="closed">Closed</option>
                            </select>
                        </div>
                        <div>
                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option selected>Categories</option>
                                <option value="open">Open</option>
                                <option value="on Progress">On Progress</option>
                                <option value="resolved">Resolved</option>
                                <option value="closed">Closed</option>
                            </select>
                        </div>
                    </div>
                    <div class="container d-flex">
                        <div>
                            <label for="start" class="form-label">Start Date</label>
                            <input type="date" name="start" class="form-control" placeholder="Enter Start Date"
                                value="">
                        </div>
                        <div>
                            <label for="end" class="form-label">End Date</label>
                            <input type="date" name="end" class="form-control" placeholder="Enter End Date"
                                value="">
                        </div>
                    </div>
                </div>
            </div>
            @foreach ($tickets as $ticket)
                <div class="d-flex text-muted py-3">
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
                        @if ($ticket->note)
                            <span>{{ $ticket->note }}</span>
                        @endif
                    </p>
                </div>
            @endforeach
            <small class="d-flex justify-content-center mt-3">
                {{ $tickets->links() }}
            </small>
        </div>
    </div>
@endsection
