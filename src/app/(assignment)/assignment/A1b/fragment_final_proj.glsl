/////////////////////////////////////////////////////
//// CS 8803/4803 CGAI: Computer Graphics in AI Era
//// Assignment 1B: Neural SDF
/////////////////////////////////////////////////////

precision highp float;              //// set default precision of float variables to high precision

varying vec2 vUv;                   //// screen uv coordinates (varying, from vertex shader)
uniform vec2 iResolution;           //// screen resolution (uniform, from CPU)
uniform float iTime;                //// time elapsed (uniform, from CPU)

#define PI 3.1415925359

const vec3 CAM_POS = vec3(0, 1, 0);

vec3 rotate(vec3 p, vec3 ax, float ro)
{
    return mix(dot(p, ax) * ax, p, cos(ro)) + sin(ro) * cross(ax, p);
}

float sdfSmoothUnion(float s1, float s2, float k)
{   
    return -k * log2(exp2(-s1 / k) + exp2(-s2 / k));
}

vec3 palette(in float t) 
{
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0., 0.33, 0.67);

    vec3 color = a + b * cos(6.28318 * (c * t + d));
    return color;

}

/////////////////////////////////////////////////////
//// sdf functions
/////////////////////////////////////////////////////

float sdfPlane(vec3 p, float h)
{
    return p.y - h;
}

/////////////////////////////////////////////////////
//// Step 1: training a neural SDF model
//// You are asked to train your own neural SDF model on Colab. 
//// Your implementation should take place in neural_sdf.ipynb.
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//// Step 2: copy neural SDF weights to GLSL
//// In this step, you are asked to the network weights you have trained from the text file to the function sdfCow().
//// You should replace the default implementation (a sphere) with your own network weights. 
/////////////////////////////////////////////////////
// https://iquilezles.org/articles/mandelbulb/
vec2 mandelbulb(vec3 p)
{
    float power = 8.0 + sin(iTime) * 2.0;
    int iterations = 20;
    float bailout = 2.0;
    float dr = 1.0;
    float r = length(p);
    
    vec3 z = p;
    int i;
    for (i = 0; i < iterations; i++) {
        r = length(z);
        if (r > bailout)
            break;
        
        float theta = acos(z.z / r);
        float phi = atan(z.y, z.x);
        
        dr = pow(r, power - 1.0) * power * dr + 1.0;
        float zr = pow(r, power);
        theta *= power;
        phi *= power;
        
        z = zr * vec3(sin(theta) * cos(phi),
                      sin(theta) * sin(phi),
                      cos(theta));
        z += p;
    }
    
    return vec2(0.5 * log(r) * r / dr, float(i));
}

vec2 mandelbulb2(vec3 p) {
    float power = 6.0 + sin(iTime * 0.7) * 2.0;
    int iterations = 20;
    float bailout = 4.0;
    float dr = 1.0;
    vec3 z = p;
    float r = 0.0;
    int i;

    for (i = 0; i < iterations; i++) {
        r = length(z);
        if (r > bailout) break;

        float theta = acos(z.z / r);
        float phi   = atan(z.y, z.x);
        phi += sin(r * 0.5 + iTime) * 0.5;

        dr = pow(r, power - 1.0) * power * dr + 1.0;
        float zr = pow(r, power);

        z = zr * vec3(
            abs(sin(power * theta)) * cos(power * phi),
            abs(sin(power * theta)) * sin(power * phi),
            cos(power * theta)
        );

        z += p;
    }

    // return (distance estimate, # iterations)
    return vec2(0.5 * log(r) * r / dr, float(i));
}

vec2 mandelbulb3(vec3 p) {
    // --- parameters for variation #3 ---
    float power      = 5.0 + cos(iTime * 1.2);  // ebb & flow of fractal power
    int   iterations = 20;
    float bailout    = 3.5;
    float dr         = 1.0;
    vec3  z          = p;
    float r          = 0.0;
    int   i;

    for (i = 0; i < iterations; i++) {
        r = length(z);
        if (r > bailout) break;

        float theta = acos(clamp(z.z / r, -1.0, 1.0));
        float phi   = atan(z.y, z.x);

        dr = pow(r, power - 1.0) * power * dr + 1.0;
        float zr = pow(r, power);

        // float ripple = sin(r * 4.0 + iTime) * 0.1;
        // zr += ripple;

        z = zr * vec3(
            sin(power * theta) * cos(power * phi),
            sin(power * theta) * sin(power * phi),
            cos(power * theta)
        );

        // 7) Feed back the original point (scaled)
        z += p * 0.7;
    }

    // distance estimate, plus how many iters we did
    return vec2(0.5 * log(r) * r / dr, float(i));
}

float sdfUnion(float d1, float d2)
{
    return min(d1, d2);
}

/////////////////////////////////////////////////////
//// Step 3: scene sdf
//// You are asked to use the sdf boolean operations to draw the bunny and the cow in the scene.
//// The bunny is located in the center of vec3(-1.0, 1., 4.), and the cow is located in the center of vec3(1.0, 1., 4.).
/////////////////////////////////////////////////////

//// sdf: p - query point
float sdf(vec3 p)
{
    float s = 0.;

    float plane_h = -1.0;

    //// calculate the sdf based on all objects in the scene
    
    //// your implementation starts
    float plane = sdfPlane(p, plane_h);

    // centre
    float mandel = mandelbulb2(rotate(p - vec3(0.0, 1., 5.), vec3(0.0, 0.0, 1.), 0.25 * iTime)).x;

    // first orbit
    float mandel2 = mandelbulb(rotate(p - vec3(-2.0 * cos(iTime * 0.5), 1.0 + 2.0 * sin(iTime * 0.5), 5.0), vec3(0.0, 1./sqrt(2.), 1./sqrt(2.)), -0.25 * iTime)).x;
    float mandel3 = mandelbulb(rotate(p - vec3(2.0 * cos(iTime * 0.5), 1.0 - 2.0 * sin(iTime * 0.5), 5.0), vec3(0.0, 1./sqrt(2.), 1./sqrt(2.)), -0.25 * iTime)).x;
    float mandel4 = mandelbulb(rotate(p - vec3(-2.0 * cos(iTime * 0.5), 1.0 - 2.0 * sin(iTime * 0.5), 5.0), vec3(0.0, 1./sqrt(2.), 1./sqrt(2.)), 0.25 * iTime)).x;
    float mandel5 = mandelbulb(rotate(p - vec3(2.0 * cos(iTime * 0.5), 1.0 + 2.0 * sin(iTime * 0.5), 5.0), vec3(0.0, 1./sqrt(2.), 1./sqrt(2.)), 0.25 * iTime)).x;

    // second orbit
    float mandel6 = mandelbulb3(rotate(p - vec3(3.0 * cos(iTime * 0.2), 1.0, 5.0 + 3.0 * sin(iTime * 0.2)), vec3(0.0, 1./sqrt(2.), 1./sqrt(2.)), 0.25 * iTime)).x;
    float mandel7 = mandelbulb3(rotate(p - vec3(-3.0 * cos(iTime * 0.2), 1.0, 5.0 + 3.0 * sin(iTime * 0.2)), vec3(1./sqrt(2.), 0., 1./sqrt(2.)), 0.25 * iTime)).x;
    float composite = sdfSmoothUnion(mandel2, mandel3, 0.005);
    composite = sdfSmoothUnion(composite, mandel4, 0.005);
    composite = sdfSmoothUnion(composite, mandel5, 0.005);
    composite = sdfSmoothUnion(composite, mandel6, 0.005);
    composite = sdfSmoothUnion(composite, mandel7, 0.005);

    s = mandel;

    // if (mandel2 < s) {
    //     s = mandel2;
    // }
    // if (mandel3 < s) {
    //     s = mandel3;
    // }
    // if (mandel4 < s) {
    //     s = mandel4;
    // }
    // if (mandel5 < s) {
    //     s = mandel5;
    // }
    if (composite < s) {
        s = composite;
    }
    if (mandel6 < s) {
        s = mandel6;
    }
    if (mandel7 < s) {
        s = mandel7;
    }
    //// your implementation ends

    return s;
}

/////////////////////////////////////////////////////
//// ray marching
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//// Step 4: ray marching
//// You are asked to implement the ray marching algorithm within the following for-loop.
//// You are allowed to reuse your previous implementation in A1a for this function.
/////////////////////////////////////////////////////

//// ray marching: origin - ray origin; dir - ray direction 
float rayMarching(vec3 origin, vec3 dir)
{
    float s = 0.;
    float t = 0.0;

    //// your implementation starts
    for(int i = 0; i < 500; i++)
    {
        vec3 p = origin + dir * t;
        s = sdf(p);
        t += s;
        if(s < 0.001 || t > 100.0) break;

    }
    //// your implementation ends

    return t;
}

/////////////////////////////////////////////////////
//// normal calculation
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//// Step 5: normal calculation
//// You are asked to calculate the sdf normal based on finite difference.
//// You are allowed to reuse your previous implementation in A1a for this function.
/////////////////////////////////////////////////////

//// normal: p - query point
vec3 normal(vec3 p)
{
    float s = 0.;          //// sdf value in p
    float dx = 0.01;           //// step size for finite difference

    //// your implementation starts
    vec3 n = normalize(vec3(
        sdf(p + vec3(dx, 0.0, 0.0)) - s,
        sdf(p + vec3(0.0, dx, 0.0)) - s,
        sdf(p + vec3(0.0, 0.0, dx)) - s
    ));
    //// your implementation ends

    return n;
}

/////////////////////////////////////////////////////
//// Phong shading
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//// Step 6: lighting and coloring
//// You are asked to specify the color for the two neural SDF objects in the scene.
//// Each object must have a separate color without mixing.
//// Notice that we have implemented the default Phong shading model for you.
/////////////////////////////////////////////////////
vec3 phong_shading(vec3 p, vec3 n)
{
    //// background
    if(p.z > 20.0)
    {
        vec3 color = vec3(0.5);
        return color;
    }

    //// phong shading
    vec3 lightPos = vec3(4. * sin(iTime), 4., 4. * cos(iTime));
    vec3 l = normalize(lightPos - p);
    float amb = 0.1;
    float dif = max(dot(n, l), 0.) * 0.7;
    vec3 eye = CAM_POS;
    float spec = pow(max(dot(reflect(-l, n), normalize(eye - p)), 0.0), 128.0) * 0.9;

    vec3 sunDir = normalize(vec3(0, 1, -1)); //// parallel light direction
    float sunDif = max(dot(n, sunDir), 0.) * 0.2;

    //// shadow
    float s = rayMarching(p + n * 0.02, l);
    if(s < length(lightPos - p))
        dif *= .2;

    vec3 color = vec3(1.0);

    //// your implementation starts
    vec3 animatedP = rotate(p, vec3(0.0, 1.0, 0.0), iTime);
    vec2 mandel = mandelbulb(animatedP - vec3(0.0, 1.0, 4.0));
    float distance = mandel.x;
    float iterations = mandel.y;

    float t = iterations / 20.;
    t += iTime + 0.05;
    t = fract(t);

    // color = palette(t);
    // color *= 0.8 + 0.2 * dot(n, normalize(vec3(1,1,1))); 
    float band = smoothstep(0.2, 0.25, fract(iterations/20.*10. + iTime*0.2));
    vec3 banded = mix(palette(fract(t+0.3)), palette(fract(t-0.3)), band);
    color = banded;
    //// your implementation ends

    return (amb + dif + spec + sunDif) * color;
}

/////////////////////////////////////////////////////
//// main function
/////////////////////////////////////////////////////

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = (fragCoord.xy - .5 * iResolution.xy) / iResolution.y;         //// screen uv
    // vec3 origin = rotate(CAM_POS, vec3(0., 0., 1.), 0.5 * iTime);                                                  //// camera position 
    vec3 origin = CAM_POS;
    vec3 dir = normalize(vec3(uv.x, uv.y, 1));                              //// camera direction
    dir = rotate(dir, vec3(0., 0., 1.), 0.3 * iTime);
    float s = rayMarching(origin, dir);                                     //// ray marching
    vec3 p = origin + dir * s;                                              //// ray-sdf intersection
    vec3 n = normal(p);                                                     //// sdf normal
    vec3 color = phong_shading(p, n);                                       //// phong shading
    fragColor = vec4(color, 1.);                                            //// fragment color
}

void main()
{
    mainImage(gl_FragColor, gl_FragCoord.xy);
}