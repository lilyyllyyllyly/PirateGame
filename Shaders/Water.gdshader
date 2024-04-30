shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

uniform vec4 WATER_TINT = vec4(0.4, 0.6, 0.9, 0.75);
uniform vec4  FOAM_TINT = vec4(1.0, 1.0, 1.0, 0.75);
uniform float FOAM_THICK = 0.05;

// distortion
uniform float DIST_AMPL = 0.005;
uniform float DIST_FREQ = 30.0;
uniform float DIST_SPEED = 1.0;

// top waves
uniform float WAVE_AMPL = 0.025;
uniform float WAVE_FREQ = 30.0;
uniform float WAVE_SPEED = 1.0;

void fragment() {
	float wave = (sin(UV.x * WAVE_FREQ + TIME * WAVE_SPEED) + 1.0) / 2.0 * WAVE_AMPL;

	if (UV.y < wave) {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	} else {
		vec4 tint_color = WATER_TINT;
		if (UV.y < wave + FOAM_THICK) {
			tint_color = FOAM_TINT;
		}

		float dist_x = sin(UV.y * DIST_FREQ + TIME * DIST_SPEED) * DIST_AMPL;
		vec4 screen_clr = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x + dist_x, SCREEN_UV.y));
		COLOR = vec4(mix(screen_clr.rgb, tint_color.rgb, tint_color.a), 1.0);
	}
}
