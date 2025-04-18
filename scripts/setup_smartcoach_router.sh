#!/bin/bash

echo "🤖 Scaffolding SmartCoachRouter for Android + Supabase Edge Function..."

# === Android Side ===
SMARTCOACH_KT=frontend/app/src/main/java/com/smartsipai/ai/SmartCoachRouter.kt
mkdir -p "$(dirname "$SMARTCOACH_KT")"

cat <<EOF > "$SMARTCOACH_KT"
package com.smartsipai.ai

import android.util.Log
import com.smartsipai.ai.claude.ClaudeApi
import com.smartsipai.ai.gemini.GeminiApi
import com.smartsipai.ai.openai.OpenAiApi
import com.smartsipai.ai.mistral.MistralApi

object SmartCoachRouter {

    suspend fun getSmartAdvice(prompt: String): String {
        return try {
            ClaudeApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: GeminiApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: OpenAiApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: MistralApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: "Stay hydrated and avoid alcohol before sleep. 🍵"
        } catch (e: Exception) {
            Log.e("SmartCoachRouter", "Fallback error: \${e.message}")
            "Could not fetch advice. Try again later."
        }
    }
}
EOF

echo "✅ Android SmartCoachRouter.kt created at $SMARTCOACH_KT"

# === Supabase Edge Function ===
SUPABASE_FN_DIR=backend/supabase/functions/smartcoach_router
mkdir -p "$SUPABASE_FN_DIR"

cat <<'EOF' > "$SUPABASE_FN_DIR/index.ts"
// Supabase Function: SmartCoach AI Router (Claude → Gemini → OpenAI → Mistral)
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const CLAUDE_KEY = Deno.env.get("CLAUDE_API_KEY");
const GEMINI_KEY = Deno.env.get("GEMINI_API_KEY");
const OPENAI_KEY = Deno.env.get("OPENAI_API_KEY");
const MISTRAL_KEY = Deno.env.get("MISTRAL_API_KEY");

serve(async (req) => {
  const { prompt } = await req.json();

  const tryClaude = async () => {
    try {
      const res = await fetch("https://api.anthropic.com/v1/messages", {
        method: "POST",
        headers: {
          "x-api-key": CLAUDE_KEY!,
          "anthropic-version": "2023-06-01",
          "content-type": "application/json",
        },
        body: JSON.stringify({
          model: "claude-3-opus-20240229",
          messages: [{ role: "user", content: prompt }],
          max_tokens: 256,
        }),
      });
      const data = await res.json();
      return data?.content?.[0]?.text;
    } catch (_) {
      return null;
    }
  };

  const tryGemini = async () => {
    try {
      const res = await fetch(
        `https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${GEMINI_KEY}`,
        {
          method: "POST",
          headers: { "content-type": "application/json" },
          body: JSON.stringify({
            contents: [{ parts: [{ text: prompt }] }],
          }),
        },
      );
      const data = await res.json();
      return data?.candidates?.[0]?.content?.parts?.[0]?.text;
    } catch (_) {
      return null;
    }
  };

  const tryOpenAI = async () => {
    try {
      const res = await fetch("https://api.openai.com/v1/chat/completions", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${OPENAI_KEY}`,
          "content-type": "application/json",
        },
        body: JSON.stringify({
          model: "gpt-4",
          messages: [{ role: "user", content: prompt }],
          max_tokens: 256,
        }),
      });
      const data = await res.json();
      return data?.choices?.[0]?.message?.content;
    } catch (_) {
      return null;
    }
  };

  const tryMistral = async () => {
    try {
      const res = await fetch("https://api.mistral.ai/v1/chat/completions", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${MISTRAL_KEY}`,
          "content-type": "application/json",
        },
        body: JSON.stringify({
          model: "mistral-medium",
          messages: [{ role: "user", content: prompt }],
          temperature: 0.7,
        }),
      });
      const data = await res.json();
      return data?.choices?.[0]?.message?.content;
    } catch (_) {
      return null;
    }
  };

  const response =
    (await tryClaude()) ??
    (await tryGemini()) ??
    (await tryOpenAI()) ??
    (await tryMistral()) ??
    "Try again later. All AIs are resting. 💤";

  return new Response(JSON.stringify({ advice: response }), {
    headers: { "content-type": "application/json" },
  });
});
EOF

echo "✅ Supabase Edge Function created at $SUPABASE_FN_DIR/index.ts"
echo "🚀 Deploy with: supabase functions deploy smartcoach_router"
