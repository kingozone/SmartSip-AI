-- Tracks drinks consumed by each user
create table if not exists drink_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users on delete cascade,
  drink_type text not null,
  quantity numeric not null,
  bac_estimate numeric,
  timestamp timestamptz default now()
);

alter table drink_logs enable row level security;

-- RLS: Only allow users to access their own drink logs
create policy "Users can insert their drinks"
  on drink_logs
  for insert
  with check (auth.uid() = user_id);

create policy "Users can select their drinks"
  on drink_logs
  for select
  using (auth.uid() = user_id);
