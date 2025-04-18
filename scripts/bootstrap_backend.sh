#!/bin/bash

echo "🚀 Bootstrapping backend structure..."

mkdir -p backend/{supabase/functions/{smartcoach_router,bac_alert},api/routes,scripts}

touch backend/supabase/{config.toml,.env,roles.sql,init.sql,seed.sql}
touch backend/api/routes/healthcheck.ts
touch backend/docker-compose.yml
touch backend/Dockerfile
touch backend/Makefile
touch backend/scripts/{deploy.sh,export_user_data.sh}

# === Healthcheck starter
cat <<EOF > backend/api/routes/healthcheck.ts
export function GET() {
  return new Response("✅ Backend OK", { status: 200 });
}
EOF

# === Edge function placeholder
cat <<EOF > backend/supabase/functions/smartcoach_router/index.ts
// AI Router: Claude → Gemini → OpenAI → Mistral
export default async (req: Request): Promise<Response> => {
  const body = await req.json();
  const prompt = body.prompt || "Give me a recovery tip.";

  // TODO: implement fallback logic (see previous setup)
  return new Response(JSON.stringify({
    advice: "Stay hydrated, eat protein, and rest.",
    prompt,
  }), { headers: { "Content-Type": "application/json" } });
};
EOF

echo "✅ Backend structure created at /backend"
