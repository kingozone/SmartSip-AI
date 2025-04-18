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
