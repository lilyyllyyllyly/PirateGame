shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

uniform float WAVE_FREQ   = 30.00;
uniform float WAVE_AMPL   =  0.05;
uniform float WAVE_OFFSET =  0.03;
uniform float WAVE_SPEED  = 10.00;

const vec4 FOAM_TINT  = vec4(1.0, 1.0, 1.0, 0.75);
const vec4 WATER_TINT = vec4(0.4, 0.6, 0.9, 0.75);

float lerp(float a, float b, float t) {
	return (b - a) * t + a;
}

void fragment() {
	vec4 tint_color = WATER_TINT;

	float wave_left  = (sin(UV.y * WAVE_FREQ - TIME * WAVE_SPEED))      / 2.0 * WAVE_AMPL + WAVE_OFFSET;
	float wave_right = (sin(UV.y * WAVE_FREQ - TIME * WAVE_SPEED + PI)) / 2.0 * WAVE_AMPL + WAVE_OFFSET;

	if (UV.x < wave_left || UV.x > 1.0 - wave_right) {
		tint_color = FOAM_TINT;
	}

	float dist_x = sin(UV.y * WAVE_FREQ - TIME * WAVE_SPEED + PI) * WAVE_AMPL / 10.0;
	vec4 screen_clr = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x + dist_x, SCREEN_UV.y));

	float final_r = lerp(screen_clr.r, tint_color.r, tint_color.a);
	float final_g = lerp(screen_clr.g, tint_color.g, tint_color.a);
	float final_b = lerp(screen_clr.b, tint_color.b, tint_color.a);

	COLOR = vec4(final_r, final_g, final_b, 1.0);
}

