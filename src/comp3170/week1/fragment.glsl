#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
   vec2 p = gl_FragCoord.xy / u_screenSize; // Normalize pixel coordinates to [0,1]
   vec2 center = vec2(0.5);
   vec2 offset = p - center;
   
   // Calculate Manhattan distance from the center
    float d = abs(offset.x) + abs(offset.y);
   
   if (d < 0.5) {
      o_colour = vec4(u_colour, 1.0);
   }
   else {
      o_colour = vec4(1.0); // WHITE
   }
}