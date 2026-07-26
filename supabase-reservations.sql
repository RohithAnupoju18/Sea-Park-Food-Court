-- Sea Park Food Court: reservations database
-- Run in Supabase: SQL Editor > New query

create table if not exists public.reservations (
  id uuid primary key default gen_random_uuid(),
  guest_name text not null check (char_length(guest_name) between 2 and 100),
  phone text not null check (char_length(phone) between 7 and 30),
  reservation_date date not null,
  reservation_time time not null,
  party_size smallint not null check (party_size between 1 and 30),
  special_request text,
  status text not null default 'pending' check (status in ('pending', 'confirmed', 'seated', 'cancelled', 'completed')),
  created_at timestamptz not null default now()
);

create index if not exists reservations_schedule_idx
  on public.reservations (reservation_date, reservation_time);

alter table public.reservations enable row level security;

-- Add the Supabase Auth UUID of each approved owner/manager here.
create table if not exists public.staff_users (
  id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create or replace function public.is_staff()
returns boolean
language sql
security definer
set search_path = public
stable
as $$ select exists (select 1 from public.staff_users where id = auth.uid()) $$;

-- Anonymous visitors can place a reservation, but cannot read any guest data.
create policy "Guests can create reservations"
  on public.reservations for insert to anon, authenticated
  with check (true);

-- Only owners/managers explicitly added to staff_users can read or update guest data.
create policy "Staff can view reservations"
  on public.reservations for select to authenticated using (public.is_staff());
create policy "Staff can update reservations"
  on public.reservations for update to authenticated using (public.is_staff()) with check (public.is_staff());

-- After creating the owner account in Supabase Authentication, grant access once:
-- insert into public.staff_users (id) values ('OWNER_AUTH_UUID');