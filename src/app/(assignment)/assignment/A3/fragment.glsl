uniform float iTime;
uniform vec2 iResolution;

//======================================================= Copy-Paste Area Begin =========================================================
// default
// // Number of Gaussians
// const int NUM_GAUSSIANS = 2;
// // Dimensions [x_min, x_max, y_min, y_max]
// float dim[4] = float[4](-5.0,5.0,-5.0,5.0);
// // Centers (x, y coordinates)
// vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-3.00, 1.50),vec2(1.50, 2.50));
// // Sigmas (scales)
// vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(2.00, 1.50),vec2(1.50, 0.50));
// // Rotation angles (thetas)
// float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](0.20,0.80);
// // Colors (RGB)
// vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.70, 0.10, 0.20),vec3(0.30, 0.80, 0.10));

// mona lisa
// Number of Gaussians
const int NUM_GAUSSIANS = 100;
// Dimensions [x_min, x_max, y_min, y_max]
float dim[4] = float[4](-5.0,5.0,-7.552816901408451,7.552816901408451);
// Centers (x, y coordinates)
vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-3.00, 3.30),vec2(-4.05, 1.70),vec2(2.41, 2.80),vec2(0.34, 3.82),vec2(-1.54, -2.10),vec2(3.38, -1.18),vec2(-2.29, 1.60),vec2(-0.81, -2.82),vec2(-0.74, 0.01),vec2(0.33, 6.45),vec2(-2.13, 5.68),vec2(-1.19, 6.32),vec2(-2.97, 0.04),vec2(4.49, -4.72),vec2(-4.41, 5.84),vec2(2.15, 2.83),vec2(-2.89, 7.57),vec2(1.49, 3.94),vec2(4.31, -6.42),vec2(2.12, -1.36),vec2(-0.15, -2.17),vec2(-3.32, -0.18),vec2(-3.50, -6.84),vec2(-2.57, 4.89),vec2(1.98, 6.83),vec2(1.79, -6.55),vec2(-3.18, -2.80),vec2(-3.56, 4.86),vec2(-4.54, 7.25),vec2(-1.88, -6.79),vec2(3.26, 4.37),vec2(2.45, -6.97),vec2(-2.27, 1.99),vec2(0.77, -5.07),vec2(1.93, 5.19),vec2(-0.94, 4.53),vec2(2.25, -5.02),vec2(2.00, 4.27),vec2(2.30, 3.87),vec2(-0.39, -6.07),vec2(-3.78, -5.59),vec2(4.67, -2.56),vec2(-2.59, -7.66),vec2(0.38, 0.65),vec2(-1.36, -6.05),vec2(4.53, -2.60),vec2(-3.68, -1.77),vec2(3.59, 5.34),vec2(3.22, 3.39),vec2(-1.42, -5.08),vec2(2.56, -6.19),vec2(-0.35, 3.34),vec2(-0.24, 5.05),vec2(-1.90, 0.87),vec2(-4.51, 7.20),vec2(3.93, 1.01),vec2(-4.70, 4.89),vec2(2.38, -2.79),vec2(0.85, 2.73),vec2(-3.09, 1.77),vec2(-1.96, 4.71),vec2(3.94, 7.04),vec2(-2.62, 4.03),vec2(-3.22, 6.28),vec2(1.35, 1.63),vec2(-3.74, 0.45),vec2(-0.39, 3.25),vec2(-4.25, -4.27),vec2(-1.97, -0.75),vec2(-2.50, -1.16),vec2(-4.36, 3.01),vec2(3.44, -4.72),vec2(0.41, 4.60),vec2(-4.48, -0.56),vec2(0.86, 7.24),vec2(-2.55, 4.29),vec2(-4.16, -4.77),vec2(0.76, 1.82),vec2(-3.84, 3.75),vec2(-2.97, -0.18),vec2(-1.52, 1.73),vec2(5.20, -0.86),vec2(-1.74, -4.17),vec2(2.01, 4.26),vec2(-0.78, 8.00),vec2(-0.18, 6.96),vec2(-4.13, -1.52),vec2(2.03, 5.76),vec2(2.40, -5.88),vec2(4.36, 4.05),vec2(2.52, 3.53),vec2(-1.76, -3.84),vec2(1.15, -7.36),vec2(0.67, -3.65),vec2(-0.38, -3.09),vec2(0.81, -6.48),vec2(-4.53, 3.88),vec2(-0.01, -7.07),vec2(5.17, -3.66),vec2(-1.87, 6.91));
// Sigmas (scales)
vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(0.62, 0.50),vec2(1.03, 0.60),vec2(0.50, 0.37),vec2(0.23, 0.37),vec2(1.22, 0.88),vec2(0.17, 0.01),vec2(0.19, 0.10),vec2(0.32, 0.12),vec2(0.63, 0.69),vec2(0.67, 0.22),vec2(0.54, 0.55),vec2(0.38, 0.70),vec2(0.47, 0.13),vec2(-0.01, 0.02),vec2(0.69, 0.60),vec2(-0.01, 0.17),vec2(0.65, 0.56),vec2(-0.00, 0.02),vec2(0.73, 1.08),vec2(0.95, 1.24),vec2(0.38, 0.77),vec2(-0.00, 0.23),vec2(1.09, 1.40),vec2(0.41, 0.53),vec2(0.73, 0.66),vec2(0.01, 0.02),vec2(0.71, 0.73),vec2(0.50, 0.53),vec2(0.79, 0.78),vec2(0.03, -0.00),vec2(0.70, 0.42),vec2(0.02, 0.01),vec2(0.38, 0.44),vec2(1.03, 0.34),vec2(0.65, 0.18),vec2(0.31, 0.80),vec2(0.92, 1.50),vec2(0.12, 0.08),vec2(0.26, 0.17),vec2(0.01, -0.06),vec2(-0.01, 0.01),vec2(0.01, 0.01),vec2(0.06, 0.04),vec2(0.71, 0.84),vec2(0.05, -0.01),vec2(1.30, 0.68),vec2(-0.01, 0.06),vec2(1.20, 0.77),vec2(0.00, 0.06),vec2(0.96, 0.53),vec2(0.02, -0.00),vec2(0.87, 0.91),vec2(0.49, 0.43),vec2(0.03, -0.00),vec2(0.73, 0.68),vec2(0.66, 1.25),vec2(0.46, 0.51),vec2(0.00, -0.01),vec2(0.00, 0.00),vec2(0.36, 0.18),vec2(0.19, 0.67),vec2(1.31, 0.94),vec2(-0.01, 0.13),vec2(0.55, 0.61),vec2(-0.01, -0.00),vec2(0.64, 0.76),vec2(0.71, 0.56),vec2(0.73, 1.09),vec2(0.24, 0.44),vec2(-0.00, 0.05),vec2(0.65, 0.50),vec2(0.02, -0.00),vec2(0.32, 0.16),vec2(0.40, 0.31),vec2(0.64, 0.51),vec2(0.40, 0.31),vec2(-0.00, 0.03),vec2(0.10, 0.01),vec2(0.34, 0.41),vec2(0.03, 0.07),vec2(0.06, -0.00),vec2(0.05, 0.07),vec2(1.07, 0.26),vec2(0.10, 0.06),vec2(0.86, 0.42),vec2(0.42, 0.54),vec2(0.38, 0.87),vec2(0.89, 0.42),vec2(0.08, 0.07),vec2(0.72, 1.00),vec2(0.46, 0.09),vec2(0.43, 0.12),vec2(0.04, 0.00),vec2(0.04, -0.01),vec2(0.04, 0.01),vec2(0.01, 0.01),vec2(0.23, 0.36),vec2(1.35, 1.14),vec2(0.05, 0.09),vec2(0.47, 0.77));
// Rotation angles (thetas)
float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](-0.61,0.50,1.45,-0.97,-0.87,-0.05,0.15,0.90,0.77,-0.10,0.55,-0.43,0.86,0.01,-0.38,0.32,0.42,0.07,-0.32,-0.12,0.61,0.04,-1.53,0.40,0.17,0.86,0.64,-0.21,0.33,-0.45,-0.76,-0.05,-0.77,0.12,-1.02,-0.05,0.02,-1.19,-0.11,-0.79,0.03,0.11,-0.35,0.36,0.09,1.47,-0.03,0.20,-0.22,0.33,-0.03,-1.18,-0.65,0.47,0.44,0.82,0.72,-0.20,-0.26,0.07,-0.33,-0.07,0.00,0.16,-0.11,-0.82,-0.19,-0.85,-0.57,0.31,-0.38,0.61,0.20,-0.51,0.33,-0.51,0.80,0.79,0.84,-0.85,0.30,-0.35,-0.22,-1.16,0.05,-0.88,-0.58,-0.66,0.41,-0.65,-0.08,-0.15,0.53,0.01,0.04,0.45,-1.33,-0.26,-0.00,-0.84);
// Colors (RGB)
vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.22, 0.21, 0.10),vec3(0.17, 0.16, 0.09),vec3(0.11, 0.11, 0.10),vec3(0.60, 0.54, 0.07),vec3(0.08, 0.04, 0.05),vec3(0.14, 0.21, 0.05),vec3(0.13, 0.17, 0.10),vec3(0.08, 0.06, 0.02),vec3(0.91, 0.70, 0.24),vec3(0.43, 0.36, 0.13),vec3(0.49, 0.40, 0.15),vec3(0.44, 0.36, 0.14),vec3(0.31, 0.19, 0.04),vec3(0.64, 0.05, 0.35),vec3(0.51, 0.42, 0.19),vec3(0.18, 0.11, 0.21),vec3(0.40, 0.34, 0.15),vec3(0.27, 0.63, 0.64),vec3(0.07, 0.02, 0.03),vec3(0.13, 0.05, 0.06),vec3(0.08, 0.04, 0.03),vec3(0.48, 0.47, 0.51),vec3(0.10, 0.05, 0.07),vec3(0.48, 0.40, 0.17),vec3(0.35, 0.26, 0.11),vec3(0.09, 0.16, 0.13),vec3(0.12, 0.07, 0.05),vec3(0.68, 0.56, 0.22),vec3(0.33, 0.54, 0.07),vec3(0.43, 0.40, 0.68),vec3(0.22, 0.22, 0.11),vec3(0.34, 0.22, 0.56),vec3(0.35, 0.32, 0.15),vec3(0.37, 0.16, 0.04),vec3(0.37, 0.34, 0.14),vec3(0.70, 0.61, 0.16),vec3(0.08, 0.03, 0.04),vec3(0.32, 0.02, 0.24),vec3(0.19, 0.19, 0.08),vec3(0.27, 0.46, 0.26),vec3(0.62, 0.08, 0.61),vec3(0.21, 0.73, 0.63),vec3(0.47, 0.31, 0.66),vec3(0.95, 0.63, 0.17),vec3(0.25, 0.10, 0.70),vec3(0.10, 0.05, 0.04),vec3(0.53, 0.67, 0.68),vec3(0.54, 0.42, 0.15),vec3(0.42, 0.22, 0.39),vec3(0.70, 0.36, 0.10),vec3(0.19, 0.56, 0.05),vec3(0.26, -0.24, 0.10),vec3(0.98, 0.72, 0.17),vec3(0.67, 0.03, 0.06),vec3(0.16, -0.12, 0.12),vec3(0.44, 0.32, 0.10),vec3(0.51, 0.43, 0.18),vec3(0.40, 0.46, 0.28),vec3(0.51, 0.44, 0.60),vec3(0.16, 0.16, 0.13),vec3(0.48, 0.43, 0.17),vec3(0.52, 0.46, 0.18),vec3(0.70, 0.64, 0.51),vec3(0.43, 0.35, 0.16),vec3(0.07, 0.00, 0.57),vec3(0.40, 0.26, 0.09),vec3(0.57, 0.80, 0.04),vec3(0.09, 0.05, 0.07),vec3(0.20, 0.10, 0.06),vec3(0.45, 0.64, 0.29),vec3(0.21, 0.18, 0.10),vec3(0.68, 0.05, 0.21),vec3(0.46, 0.32, 0.03),vec3(0.38, 0.12, 0.06),vec3(0.36, 0.33, 0.12),vec3(0.44, 0.39, 0.15),vec3(0.18, 0.18, 0.69),vec3(0.66, 0.29, 0.06),vec3(0.17, 0.13, 0.04),vec3(0.26, 0.51, 0.52),vec3(0.56, 0.22, 0.30),vec3(0.26, 0.40, 0.31),vec3(0.76, 0.51, 0.11),vec3(-0.13, 0.24, -0.21),vec3(0.34, 0.53, 0.32),vec3(0.37, 0.31, 0.13),vec3(0.52, 0.28, 0.11),vec3(0.32, 0.27, 0.12),vec3(-0.01, -0.01, -0.01),vec3(0.55, 0.48, 0.14),vec3(0.33, 0.29, 0.11),vec3(0.65, 0.45, 0.12),vec3(0.35, 0.36, 0.11),vec3(0.35, 0.20, 0.57),vec3(0.57, 0.03, 0.43),vec3(0.16, 0.61, 0.38),vec3(0.23, 0.23, 0.12),vec3(0.08, 0.03, 0.05),vec3(0.11, 0.05, 0.53),vec3(0.43, 0.35, 0.13));


//======================================================= Copy-Paste Area End =========================================================

/////////////////////////////////////////////////////
//// Here, you are asked to build the inverse covariance matrix, similar to in the 2DGS_A3_solution.ipynb file.
//// You must create the rotation matrix R, the inverse squared sigma matrix D, and the final inverse covariance matrix. 
/////////////////////////////////////////////////////

// This function builds the inverse covariance matrix
mat2 buildSigmaInv(float theta, vec2 sigma)
{
    mat2 cov_mat = mat2(0, 0, 0, 0);

    /////////// 
    // BEGINNING OF YOUR CODE.
    //////////
    mat2 R = mat2(cos(theta), sin(theta), -sin(theta), cos(theta)); 
    float eps = 0.001;
    float sigmaX = max(abs(sigma.x), eps);
    float sigmaY = max(abs(sigma.y), eps);
    mat2 D = mat2(1.0 / (sigmaX * sigmaX), 0.0, 0.0, 1.0 / (sigmaY * sigmaY));
    cov_mat = R * D * transpose(R);

    /////////// 
    // END OF YOUR CODE.
    //////////
    return cov_mat;
}

/////////////////////////////////////////////////////
//// Here, you are asked to fill in the necessary components for calculating each gaussian's contribution to the current pixel's color.
//// You must calculate the position of the pixel relative to the gaussian's center, calculate the contribution exponent (pos^T * sigma_inv * pos) 
//// and finally calculate the Gaussian function value that will control the contribution of this specific gaussian.
/////////////////////////////////////////////////////

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

    // Animate the Gaussian centers
    uv += smoothstep(0.0, 1.0, cos(iTime)) * cos(iTime + 100.0 * uv.xy) * 3.;

    for (int i = 0; i < NUM_GAUSSIANS; ++i) {
        vec2 center = gauss_centers[i];
        vec2 scale = gauss_sigmas[i];
        float theta = gauss_thetas[i];
        vec3 color_rgb = gauss_colors[i];
        
        // Build inverse covariance matrix
        mat2 sigma_inv = buildSigmaInv(theta, scale);
        float f_x = 0.;

        /////////// 
        // BEGINNING OF YOUR CODE.
        //////////
        vec2 pos = uv - center;
        float exponent = dot(pos, sigma_inv * pos);
        f_x = exp(-0.5 * exponent);

        /////////// 
        // END OF YOUR CODE.
        //////////
        
        // Add color contribution
        color += f_x * color_rgb;
    }

    fragColor = vec4(color, 1.0);
}


void main() {
    mainImage(gl_FragColor, gl_FragCoord.xy);
}