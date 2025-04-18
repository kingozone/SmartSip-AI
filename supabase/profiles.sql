create table if not exists profiles (
  id uuid primary key references auth.users on delete cascade,
  display_name text,
  avatar_url text,
  created_at timestamptz default now()
);

alter table profiles enable row level security;

create policy "Users can manage their own profile"
  on profiles
  for all
  using (auth.uid() = id)
  with check (auth.uid() = id);
