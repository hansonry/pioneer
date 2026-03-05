// Copyright © 2008-2026 Pioneer Developers. See AUTHORS.txt for details
// Licensed under the terms of the GPL v3. See licenses/GPL-3.txt

#include "attributes.glsl"
#include "lib.glsl"

uniform float width = 0.05;

out vec4 vertexColor;


void main(void)
{
	vec4 base_pos = matrixTransform();

   vec3 ndc = base_pos.xyz / base_pos.w;

   // TODO: I don't know how well gl_VertexID is supported. May need to 
   // replace it with another buffer
   float offset = (mod(gl_VertexID, 2.0) - 0.5) * width;
   // TODO: Offset needs to be some kind of 2d vector so that xs aren't flat
   gl_Position = vec4(ndc.x, ndc.y + offset, ndc.z, 1.0);
	vertexColor = a_color;
}
