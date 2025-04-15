-- Table: drink_logs
create table if not exists drink_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users,
  drink_type text,
  quantity numeric,
  timestamp timestamptz default now()
);

-- Enable RLS
alter table drink_logs enable row level security;

-- Policy: logged-in users can insert their own drinks
create policy "Allow insert by owner"
  on drink_logs
  for insert
  with check (auth.uid() = user_id);

-- Policy: users can select their own logs
create policy "Allow select by owner"
  on drink_logs
  for select
  using (auth.uid() = user_id);
