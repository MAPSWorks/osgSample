//
// Isotropic Ward fragment shader
//

varying	vec3 l;
varying	vec3 h;
varying vec3 v;
varying vec3 n;

void main (void)
{
	const vec4	diffColor = vec4 ( 0.5, 0.0, 0.0, 1.0 );
	const vec4	specColor = vec4 ( 0.7, 0.7, 0.0, 1.0 );
	const float	k         = 10.0;

	vec3	n2   = normalize ( n );
	vec3	l2   = normalize ( l );
	vec3	h2   = normalize ( h );
	float	hn   = dot       ( h, n );
	float	hn2  = hn * hn;
	

	vec4	diff = diffColor * max ( dot ( n2, l2 ), 0.0 );
	vec4	spec = specColor * exp ( - k * (1.0 - hn2) / hn2 );

	gl_FragColor = diff + spec;
}
