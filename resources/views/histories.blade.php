@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="list-group">
            @foreach ($histories as $history)
                <div class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">{{ $history->action }}</h5>
                        <small class="text-muted">{{ $history->created_at }}</small>
                    </div>
                    <p class="mb-1">{{ $history->user->name }}</p>
                </div>
            @endforeach
        </div>
        <small class="d-flex justify-content-center mt-3">
            {{ $histories->links() }}
        </small>
    </div>
@endsection
