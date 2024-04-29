shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float WAVE_AMPL = 0.005;
uniform float WAVE_FREQ = 30.0;
uniform float WAVE_SPEED = 1.0;
uniform vec4 TINT = vec4(0.0, 0.0, 0.0, 0.0);

float lerp(float a, float b, float t) {
	return (b - a) * t + a;
}

void fragment() {
	float wave_x = SCREEN_UV.x + sin(SCREEN_UV.y * WAVE_FREQ + TIME * WAVE_SPEED) * WAVE_AMPL;
	vec4 screen_clr = texture(SCREEN_TEXTURE, vec2(wave_x, SCREEN_UV.y));

	float final_r = lerp(screen_clr.r, TINT.r, TINT.a);
	float final_g = lerp(screen_clr.g, TINT.g, TINT.a);
	float final_b = lerp(screen_clr.b, TINT.b, TINT.a);

	COLOR = vec4(final_r, final_g, final_b, 1.0);
}
