shader_type canvas_item;

uniform float alpha;

void fragment() {
	COLOR = vec4(UV, 0.5*sin(TIME/10.0)+1.0, alpha);
}

void vertex() {
	VERTEX += vec2(cos(TIME/5.0), sin(TIME/5.0));
	VERTEX *= vec2(float(VERTEX_ID-2000));
}

