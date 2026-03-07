// Copyright © 2008-2026 Pioneer Developers. See AUTHORS.txt for details
// Licensed under the terms of the GPL v3. See licenses/GPL-3.txt

#include "attributes.glsl"
#include "lib.glsl"

uniform float width = 0.05;

out vec4 vertexColor;


void main(void)
{
	vec4 base_pos = matrixTransform();
   vec3 screen_norm = normalize(normalMatrix() * a_normal);
   vec3 unit_z = vec3(0, 0, 1);
   vec3 width_normal = cross(screen_norm, unit_z);
   //vec2 width_normal = normalize(vec2(screen_norm.x, screen_norm.y));

   // TODO: I don't know how well gl_VertexID is supported. May need to 
   // replace it with another buffer
   float offset = (mod(gl_VertexID, 2.0) - 0.5) * width * base_pos.w;

   vec4 offset_vec = vec4(width_normal * offset, 0.0);
   gl_Position = base_pos + offset_vec;
   //gl_Position += vec4(width_normal.xy * base_pos.w * 0.05, 0.0, 0.0);
	vertexColor = a_color;
   vertexColor = vec4(width_normal.xy / 2.0 + 0.5, 0.0, 0.0);
   vertexColor = vec4(abs(screen_norm), 0.0);
   //vertexColor = vec4(normalize(a_normal) / 0.2 + 0.5, 0.0);
}
