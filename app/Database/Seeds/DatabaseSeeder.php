<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use CodeIgniter\I18n\Time;

class DatabaseSeeder extends Seeder
{
   public function run()
   {
      $categories = [
         [
            'name' => 'Aksesoris',
            'slug' => 'aksesoris',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'Jaket',
            'slug' => 'jaket',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'Celana',
            'slug' => 'celana',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'Kaos',
            'slug' => 'kaos',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'Kemeja',
            'slug' => 'kemeja',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ]
      ];

      $sizes = [
         [
            'name' => 'S',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'M',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'L',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'XL',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'XXL',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
      ];

      $colors = [
         [
            'name' => 'black',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'navy',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'blue',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'darkgreen',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'green',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'teal',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'deepskyblue',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'lime',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'indigo',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'maroon',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'purple',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'gray',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'grey',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'darkred',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'brown',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'salmon',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'red',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'deeppink',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'orangered',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'hotpink',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'orange',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'lightpink',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'pink',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'gold',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'yellow',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ],
         [
            'name' => 'white',
            'created_at' => Time::now(),
            'updated_at' => Time::now()
         ]
      ];

      $faker = \Faker\Factory::create();
      for ($i = 0; $i < 100; $i++) {
         $name = $faker->unique()->sentence(3);
         $products = [
            'category_id' => random_int(1, 5),
            'name' => $name,
            'slug' => strtolower(str_replace(' ', '-', $name)),
            'detail' => $faker->paragraphs(5, true),
            'price' => $faker->randomNumber(6, false),
            'discount' => $faker->numberBetween(0, 75),
            'stock' => 100,
            'weight' => $faker->numberBetween(1000, 5000),
            'sold' => 0,
            'created_at' => Time::createFromTimestamp($faker->unixTime()),
            'updated_at' => Time::now()
         ];
         $this->db->table('products')->insert($products);
      }

      $this->db->table('categories')->insertBatch($categories);
      $this->db->table('sizes')->insertBatch($sizes);
      $this->db->table('colors')->insertBatch($colors);


      for ($i = 0; $i < 300; $i++) {
         $size = [
            'product_id' => random_int(1, 100),
            'size_id' => random_int(1, 5)
         ];

         $this->db->table('productsize')->insert($size);
      }

      for ($i = 0; $i < 300; $i++) {
         $color = [
            'product_id' => random_int(1, 100),
            'color_id' => random_int(1, 26)
         ];

         $this->db->table('productcolor')->insert($color);
      }

      $this->db->table('address')->insert([
         'user_id' => 2,
         'jalan' => 'Jln. ABC No. 6, Kebogadung, RT 05 / RW 02',
         'kecamatan' => 'Jatibarang',
         'kabupaten' => 'Brebes',
         'provinsi' => 'Jawa Tengah',
         'kode_kabupaten' => 92,
         'kode_provinsi' => 10,
         'kode_pos' => 52261,
         'flags' => 1,
         'created_at' => Time::createFromTimestamp($faker->unixTime()),
         'updated_at' => Time::now()
      ]);

      $this->db->table('address')->insert([
         'user_id' => 3,
         'jalan' => 'Jln. XYZ No. 7, Kebogadung, RT 02 / RW 05',
         'kecamatan' => 'Jatibarang',
         'kabupaten' => 'Brebes',
         'provinsi' => 'Jawa Tengah',
         'kode_kabupaten' => 92,
         'kode_provinsi' => 10,
         'kode_pos' => 52261,
         'flags' => 1,
         'created_at' => Time::createFromTimestamp($faker->unixTime()),
         'updated_at' => Time::now()
      ]);

      for ($i = 0; $i < 10; $i++) {
         $name = $faker->unique()->sentence(3);
         $startDate = Time::createFromTimestamp($faker->unixTime());
         $endDate = new Time($startDate . ('+1 days'), 'Asia/Jakarta', 'id_ID');
         $events = [
            'name' => $name,
            'slug' => strtolower(str_replace(' ', '-', $name)),
            'detail' => $faker->paragraphs(10, true),
            'published' => random_int(0, 1),
            'start_date' => $startDate,
            'end_date' => $endDate,
            'created_at' => Time::createFromTimestamp($faker->unixTime()),
            'updated_at' => Time::createFromTimestamp($faker->unixTime())
         ];

         $this->db->table('events')->insert($events);
      }
   }
}
