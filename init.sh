#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 <<-EOSQL
  create table locations (
    id uuid default gen_random_uuid() primary key,
    name text not null unique,
    is_public boolean not null default true
  );

  create index idx_is_public on locations (is_public);

  insert into locations (name, is_public) values
    ('Main Market Place', true),
    ('Grocery Store 1', false),
    ('Bakery "Sweet Rainbow"', true),
    ('Central Cafe', false),
    ('Victory Supermarket', true),
    ('Fashion Store "Trendy Style"', false),
    ('Health Pharmacy', true),
    ('Italian Cuisine Restaurant', false),
    ('Electronics Retail Point', true),
    ('Jewelry Boutique "Diamond"', false),
    ('Sporting Goods Store "Active Choice"', true),
    ('Bookstore "Read-Town"', false),
    ('Home Goods "Cozy Home"', true),
    ('Elite Cosmetics Store', false),
    ('Coffee Shop "Fragrant Meeting"', true),
    ('Flower Shop "Floral Rainbow"', false),
    ('Auto Shop "TechnoCar"', true),
    ('Entertainment Spot "Laughter Rainbow"', false),
    ('Night Bar "Night Fire"', true),
    ('Toy Store "Happy Childhood"', false),
    ('Bakery "Tasty Bread"', true),
    ('Jewelry Salon "Golden Line"', false),
    ('Sportswear Store "SportStyle"', true),
    ('Beauty Spot "Sparkle and Glamour"', false),
    ('Tech Store "Tech World"', true),
    ('Japanese Cuisine Restaurant "Sakura"', false),
    ('Antique Shop "Antique Treasures"', true),
    ('Mobile Devices Store "Mobile World"', false),
    ('Bakery "Aroma of Bread"', true),
    ('Chocolate and Candy Store "Sweet Paradise"', false);
EOSQL
