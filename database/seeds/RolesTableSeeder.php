<?php

use App\Role;
use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Create Roles
        $roles = [
            [
                'name'  =>  'Gymie',
                'display_name' => 'Gymie',
                'description' => 'The default role for all users.',
            ],
            [
                'name'  =>  'Admin',
                'display_name' => 'Admin',
                'description' => 'The admin role with full access.',
            ],
            [
                'name'  =>  'Manager',
                'display_name' => 'Manager',
                'description' => 'The manager role with limited access.',
            ],
        ];

        foreach ($roles as $role) {
            Role::create($role);
        }
    }
}
