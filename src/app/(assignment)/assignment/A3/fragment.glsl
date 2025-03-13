uniform float iTime;
uniform vec2 iResolution;

//======================================================= Copy-Paste Area Begin =========================================================
// Number of Gaussians
const int NUM_GAUSSIANS = 0;
// Dimensions [x_min, x_max, y_min, y_max]
float dim[4] = float[4](0,0,0,0);
// Centers (x, y coordinates)
vec2 gauss_centers[NUM_GAUSSIANS] = [];
// Sigmas (scales)
vec2 gauss_sigmas[NUM_GAUSSIANS] = [];
// Rotation angles (thetas)
float gauss_thetas[NUM_GAUSSIANS] = [];
// Colors (RGB)
vec3 gauss_colors[NUM_GAUSSIANS] = [];

//======================================================= Copy-Paste Area End =========================================================

// This function builds the inverse covariance matrix
mat2 buildSigmaInv(float theta, vec2 sigma)
{
    // Create rotation matrix
    float cos_theta = cos(theta);
    float sin_theta = sin(theta);
    // Column-major order
    mat2 R = mat2(
        cos_theta, sin_theta,
        -sin_theta, cos_theta
    );
    
    // Create inverse squared sigma matrix
    mat2 inv_squared_sigma = mat2(
        1.0 / (sigma.x * sigma.x + 1e-7), 0.0,
        0.0, 1.0 / (sigma.y * sigma.y + 1e-7)
    );
    
    // Return R * inv_squared_sigma * R^T
    return R * inv_squared_sigma * mat2(
        R[0][0], R[1][0],
        R[0][1], R[1][1]
    );
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    float aspect = (dim[1] - dim[0]) / (dim[3] - dim[2]) * iResolution.y / iResolution.x;
    vec2 uv = fragCoord.xy / iResolution.xy; // scale to [0, 1]
    // scale from [-1, 1] to [x_min, x_max] and [y_min, y_max]
    uv.x = mix(dim[0], dim[1], uv.x);
    uv.y = mix(dim[2], dim[3], uv.y);
    if (aspect > 1.0) {
        uv.y *= aspect;
    } else {
        uv.x /= aspect;
    }

    vec3 color = vec3(0.0);

    // Draw bounding box
    float edge = 0.01;
    if (uv.x > dim[0] - edge && uv.x < dim[0] + edge ||
        uv.x > dim[1] - edge && uv.x < dim[1] + edge ||
        ((uv.y > dim[2] - edge && uv.y < dim[2] + edge || uv.y > dim[3] - edge && uv.y < dim[3] + edge) && uv.x > dim[0] && uv.x < dim[1])) {
        color = vec3(1.0, 1.0, 1.0);
    }

    for (int i = 0; i < NUM_GAUSSIANS; ++i) {
        vec2 center = gauss_centers[i];
        vec2 scale = gauss_sigmas[i];
        float theta = gauss_thetas[i];
        vec3 color_rgb = gauss_colors[i];

        vec2 pos = uv - center;
        
        // Build inverse covariance matrix
        mat2 sigma_inv = buildSigmaInv(theta, scale);
        
        // Calculate exponent: pos^T * sigma_inv * pos
        float exponent = dot(pos * sigma_inv, pos);
        
        // Calculate Gaussian function value
        float f_x = exp(-0.5 * exponent);
        
        // Add color contribution
        color += f_x * color_rgb;
    }

    fragColor = vec4(color, 1.0);
}


void main() {
    mainImage(gl_FragColor, gl_FragCoord.xy);
}