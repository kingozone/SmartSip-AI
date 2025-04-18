-- Enable email/password signups
alter schema auth enable row level security;

-- Allow user sign-up via email/password
-- (Supabase enables this by default, but you can override policies)

-- Custom claims can be added with edge functions or JWT middleware if needed
create table if not exists profiles (
  id uuid primary key references auth.users,
  display_name text,
  created_at timestamptz default now()
);

alter table profiles enable row level security;

create policy "Users can manage their profile"
  on profiles
  for all
  using (auth.uid() = id)
  with check (auth.uid() = id);
