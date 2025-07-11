<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Ticket;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Ticket>
 */
class TicketFactory extends Factory
{
    protected $model = Ticket::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */

    public function definition(): array
    {
        $status = ['open', 'on progress', 'resolved', 'closed'];

        $note = '';
        if (fake()->randomElement([1, 3]) === 1) {
            $note = fake()->text();
        }

        return [
            'name' => fake()->text(10),
            'status' => fake()->randomElement($status),
            'note' => $note,
            'user_id' => User::inRandomOrder()->first()->id,
            'category_id' => Category::inRandomOrder()->first()->id,
        ];
    }
}
