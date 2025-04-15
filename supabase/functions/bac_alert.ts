// supabase/functions/bac_alert.ts

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

serve(async (req) => {
  const { bac, user_id } = await req.json()

  if (bac > 0.08) {
    console.log(`ALERT: User ${user_id} has BAC of ${bac}!`)
    // TODO: Integrate with email / SMS / Sentry / Discord webhook
  }

  return new Response(
    JSON.stringify({ status: "ok", bac, warning: bac > 0.08 }),
    { headers: { "Content-Type": "application/json" }, status: 200 }
  )
})
