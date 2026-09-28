# Diário de estudo

Site estático (um único `index.html`) para registar sessões de estudo (data, tempo `hh:mm:ss`, disciplina e sumário), ver o calendário e exportar para Excel e PDF.

- **Dados:** Supabase (tabela `sessoes`, com login e regras RLS). O script está em `supabase/schema.sql`.
- **Site:** Vercel, sem build. Basta ligar este repositório ao Vercel.
