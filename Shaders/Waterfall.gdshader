shader_type canvas_item;

uniform float WAVE_FREQ   = 30.00;
uniform float WAVE_AMPL   =  0.05;
uniform float WAVE_OFFSET =  0.03;
uniform float WAVE_SPEED  = 10.00;

const vec4 BORDER_COLOR = vec4(1.0, 1.0, 1.0, 0.75);
const vec4 MIDDLE_COLOR = vec4(0.4, 0.6, 0.9, 0.75);

void fragment() {
	float wave = (sin(UV.y * WAVE_FREQ - TIME * WAVE_SPEED) + 1.0) / 2.0 * WAVE_AMPL + WAVE_OFFSET;
	if (UV.x < wave || UV.x > 1.0 - wave) {
		COLOR = BORDER_COLOR;
	} else {
		COLOR = MIDDLE_COLOR;
	}
}

