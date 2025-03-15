
/////////////////////////////////////////////////////
//// CS 8803/4803 CGAI: Computer Graphics in AI Era
//// Assignment 2A: Volumetric Ray Tracing
/////////////////////////////////////////////////////

precision highp float;              //// set default precision of float variables to high precision

varying vec2 vUv;                   //// screen uv coordinates (varying, from vertex shader)
uniform vec2 iResolution;           //// screen resolution (uniform, from CPU)
uniform float iTime;                //// time elapsed (uniform, from CPU)
uniform highp sampler3D iVolume;    //// volume texture
#define PI 3.1415925359;

vec3 rotate(vec3 p, vec3 ax, float ro)
{
    return mix(dot(p, ax) * ax, p, cos(ro)) + sin(ro) * cross(ax, p);
}

/////////////////////////////////////////////////////
//// camera initialization
/////////////////////////////////////////////////////

//// set camera: ro - camera position, ta - camera lookat, cr - camera rotation angle
mat3 setCamera(in vec3 ro, in vec3 ta, float cr)
{
	vec3 cw = normalize(ta-ro);
	vec3 cp = vec3(sin(cr), cos(cr),0.0);
	vec3 cu = normalize(cross(cw,cp));
	vec3 cv = cross(cu,cw);
    return mat3(cu, cv, cw);
}

/////////////////////////////////////////////////////
//// density-to-color conversion
/////////////////////////////////////////////////////

//// Inigo Quilez - https://iquilezles.org/articles/palettes/
//// This function converts a scalar value t to a color
vec3 palette(in float t) 
{
  vec3 a = vec3(0.5, 0.5, 0.5);
  vec3 b = vec3(0.5, 0.5, 0.5);
  vec3 c = vec3(1.0, 1.0, 1.0);
  vec3 d = vec3(0.0, 0.25, 0.25);

  vec3 color = a + b * cos(6.28318 * (c * t + d));
//   color = (color - 0.5) * 2.2 + 0.5; // add contrast
  return color;

}

/////////////////////////////////////////////////////
//// sdf definitions
/////////////////////////////////////////////////////

//// sdf sphere
float sdSphere(vec3 p, float s)
{
    return length(p)-s;
}

//// sdf box
float sdBox(vec3 p, vec3 b)
{
    vec3 d = abs(p) - b;
    return min(max(d.x,max(d.y,d.z)),0.0) + length(max(d,0.0));
}

// https://iquilezles.org/articles/mandelbulb/
float mandelbulb(vec3 p)
{
    float power = 8.0 + sin(iTime) * 2.0;       // fractal power -- the higher, the more complex the fractal
    int iterations = 20;
    float bailout = 2.0;     // bailout radius -- the distance at which we consider the point to have escaped to infinity
    float dr = 1.0;        // differential radius for normal estimation
    float r = length(p);   // curr radius
    
    vec3 z = p;
    for (int i = 0; i < iterations; i++) {
        r = length(z);
        if (r > bailout) // r > bailout ? assume orbit escapes to infinity
            break;
        
        // Convert to spherical coordinates
        float theta = acos(z.z / r); // polar angle from +ve z-axis
        float phi = atan(z.y, z.x); // azimuth angle in xy plane, from +ve x-axis
        
        // Scale and rotate the point
        dr = pow(r, power - 1.0) * power * dr + 1.0;
        float zr = pow(r, power);
        theta *= power;
        phi *= power;
        
        // Convert back to Cartesian coordinates
        z = zr * vec3(sin(theta) * cos(phi),
                      sin(theta) * sin(phi),
                      cos(theta));
        z += p;
    }
    
    return 0.5 * log(r) * r / dr; // distance estimator -- estimate distance of p from the fractal
}

/////////////////////////////////////////////////////
//// color and density calculation from volume data
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//// Step 1: calculate color and density from sdf
//// You are asked to convert the negative sdf value to a vec4 with the first three components as color rgb values and the last component as density.
//// For color, you may use the provided palette function to convert the sdf value to an rgb color.
//// For density, we assume it is alway 1.0 inside the object (sdf < 0) and 0.0 outside the object (sdf >= 0).
/////////////////////////////////////////////////////

vec4 readSDFVolume(vec3 p)
{
    //// sdf object
    // float distance = sdBox(p, vec3(1.0));
    // float distance = sdSphere(p, 1.0);
    vec3 animatedP = rotate(p, vec3(0.0, 1.0, 0.0), iTime);
    float distance = mandelbulb(animatedP);

    //// convert sdf value to a color

    //// your implementation starts
    vec3 color = palette(-distance);
    if (distance < 0.0) {
        return vec4(color, 1.0);
    } else {
        return vec4(color, 0.0);
    }
    //// your implementation ends
}

/////////////////////////////////////////////////////
//// Step 2: calculate color and density from CT data
//// You are asked to convert the CT data to a vec4 with the first three components as color rgb values and the last component as density.
//// For density, you should read the density value from the first component of the volumetric texture iVolume with tex_coord.
//// For color, you should use the provided palette function to convert the density value to an rgb color.
//// You may want to multiple the returned vec4 with a constant to enhance the visualization color.
/////////////////////////////////////////////////////

vec4 readCTVolume(vec3 p)
{
    //// normalize coordinates to [0, 1] range
    vec3 tex_coord = (p + vec3(1.0)) * 0.5;
    //// check if tex_coord is outside the box
    if (tex_coord.x < 0.0 || tex_coord.x > 1.0 || 
        tex_coord.y < 0.0 || tex_coord.y > 1.0 || 
        tex_coord.z < 0.0 || tex_coord.z > 1.0) {
        return vec4(0.0);
    }

    //// your implementation starts
    float density = texture(iVolume, tex_coord).x;
    vec3 color = palette(density);
    return vec4(color, density) * 1.2;

    //// your implementation ends
}

/////////////////////////////////////////////////////
//// Step 3: ray tracing with volumetric data
//// You are asked to implement the front-to-back volumetric ray tracing algorithm to accummulate colors along each ray. 
//// Your task is to accumulate color and transmittance along the ray based on the absorption-emission volumetric model.
//// You may want to read the course slides, Equation (3) in the original NeRF paper, and the A2a document for the rendering model.
/////////////////////////////////////////////////////

//// ro - ray origin, rd - ray direction, 
//// near - near bound of t, far - far bound of t, 
//// n_samples - number of samples between near and far
vec4 volumeRendering(vec3 ro, vec3 rd, float near, float far, int n_samples) 
{
    float stepSize = (far - near) / float(n_samples);                           //// step size of each sample

    //// color and transmittance
    vec3 color = vec3(0.0);                                                     //// accumulated color
    float transmittance = 1.0;                                                  //// transmittance

    //// ray marching loop
    for (int i = 0; i < n_samples; i++) {
        float t = near + stepSize * float(i);                                   //// t value along the ray
        vec3 p = ro + t * rd;                                                   //// sample position on the ray

        //// your implementation starts
        vec4 CTsample = readCTVolume(p - vec3(2.0, 0.0, 0.0));
        vec4 SDFsample = readSDFVolume(p + vec3(2.0, 0.0, 0.0));

        float density = CTsample.w + SDFsample.w;

        if (density > 0.0) {
            vec3 blendedColor = (CTsample.rgb * CTsample.w + SDFsample.rgb * SDFsample.w) / density;
            float sigma = 10.0;
            float alpha = 1.0 - exp(-sigma * density * stepSize);
            color += blendedColor * alpha * transmittance;
            transmittance *= exp(-sigma * density * stepSize);
        }

        //// your implementation ends

        //// early termination if opacity is high
        if (transmittance < 0.01) break;
    }
    
    //// return color and transmittance
    return vec4(color, 1.0 - transmittance);                                   
}


void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    //// normalize fragment coordinates to [-0.5, 0.5] range
    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    //// camera 
    float angle = 0.2 * iTime;                                                  //// camera angle
    vec3 ta = vec3(0.0, 0.0, 0.0);                                              //// object center
    float radius = 5.5;                                                         //// camera rotation
    float height = 2.2;                                                         //// camera height
    vec3 ro = ta + vec3(radius * cos(angle), 0.0, radius * sin(angle));      //// camera position
    mat3 ca = setCamera(ro, ta, 0.0);                                           //// camera matrix
    
    //// ray
    vec3 rd = ca * normalize(vec3(uv, 1.0));                                    //// ray direction
    float near = 2.0;                                                           //// near bound
    float far = 8.5;                                                            //// far bound    
    int n_samples = 256;                                                        //// number of samples along each ray
    
    //// final output color
    fragColor = volumeRendering(ro, rd, near, far, n_samples);                  //// volumetric ray marching
}

void main()
{
    mainImage(gl_FragColor, gl_FragCoord.xy);
}