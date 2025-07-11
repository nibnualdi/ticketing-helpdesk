@extends('layouts.app')

@section('content')
    <div class="container">
        <form action={{ route('ticket.editAction', $ticket->id) }} method="post">
            @csrf
            @method('put')
            <div class="my-3 p-3 bg-body rounded shadow-sm">
                <p class="h5">{{ $ticket->id }}</p>
                <div class="mb-3">
                    <label for="name" class="form-label">Ticket name</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="Ticket's name"
                        value="{{ $ticket->name }}">
                </div>

                <div class="mb-3">
                    <label for="category_id" class="form-label">Select a category</label>
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="category_id",
                        id="category_id">
                        @foreach ($categories as $category)
                            <option value={{ $category->id }}
                                {{ $category->id == $ticket->category->id ? 'selected' : '' }}>
                                {{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Select a status</label>
                    <select class="form-select form-select-lg" aria-label=".form-select-lg example" name="status">
                        @foreach ($status as $stat)
                            <option value={{ $stat }} {{ $stat == $ticket->status ? 'selected' : '' }}>
                                {{ $stat }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="mb-3">
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="notes..." name="note"
                        id="note">{{ $ticket->note }}</textarea>
                </div>
                <a href={{ route('home') }}><button type="button" class="btn btn-secondary">Cancel</button></a>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
@endsection
