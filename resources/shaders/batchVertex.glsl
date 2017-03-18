#version 330 core

layout (location = 0) in vec2 position;
layout (location = 1) in vec2 texCoord;
layout (location = 2) in int tid;
layout (location = 3) in vec4 color;

out DATA
{
	//vec3 pos;
	vec2 uv;
	vec4 col;
	flat int tid;
}v_out;

uniform mat4 pr_matrix = mat4(1.0);
uniform mat4 vw_matrix = mat4(1.0);
uniform mat4 ml_matrix = mat4(1.0);

void main()
{
	gl_Position = pr_matrix * vw_matrix * ml_matrix * vec4(position, 0,1);
	v_out.uv = texCoord;
	v_out.col = color;
	v_out.tid = tid;
}

