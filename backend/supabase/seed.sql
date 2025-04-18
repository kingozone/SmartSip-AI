-- 🔐 Create sample users (linked to auth.users manually)
insert into profiles (id, display_name, avatar_url)
values
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'https://i.pravatar.cc/150?u=alice'),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'https://i.pravatar.cc/150?u=bob');

-- 🍷 Add fake drink logs
insert into drink_logs (user_id, drink_type, quantity, bac_estimate, timestamp)
values
  ('00000000-0000-0000-0000-000000000001', 'Red Wine', 1.5, 0.04, now() - interval '1 day'),
  ('00000000-0000-0000-0000-000000000001', 'Whiskey', 2.0, 0.08, now() - interval '3 hours'),
  ('00000000-0000-0000-0000-000000000002', 'Beer', 1.0, 0.02, now() - interval '2 days'),
  ('00000000-0000-0000-0000-000000000002', 'Vodka', 2.5, 0.10, now() - interval '30 minutes');
