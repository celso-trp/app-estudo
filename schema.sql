create table public.sessoes (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  data date not null,
  segundos integer not null check (segundos > 0),
  disciplina text not null default '',
  sumario text not null default '',
  criado_em timestamptz not null default now()
);
create index sessoes_user_data_idx on public.sessoes (user_id, data);
alter table public.sessoes enable row level security;
create policy "ler as minhas sessoes" on public.sessoes for select to authenticated using (user_id = (select auth.uid()));
create policy "criar as minhas sessoes" on public.sessoes for insert to authenticated with check (user_id = (select auth.uid()));
create policy "apagar as minhas sessoes" on public.sessoes for delete to authenticated using (user_id = (select auth.uid()));
