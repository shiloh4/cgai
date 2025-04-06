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
// // Number of Gaussians
// const int NUM_GAUSSIANS = 10;
// // Dimensions [x_min, x_max, y_min, y_max]
// float dim[4] = float[4](-5.0,5.0,-7.552816901408451,7.552816901408451);
// // Centers (x, y coordinates)
// vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-1.17, -4.78),vec2(2.56, -1.34),vec2(-4.16, -1.41),vec2(1.90, -3.49),vec2(-3.86, 0.45),vec2(-2.58, 3.24),vec2(4.15, -6.28),vec2(5.14, -5.18),vec2(-5.17, -4.39),vec2(2.92, 5.70));
// // Sigmas (scales)
// vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(1.35, 0.94),vec2(0.30, 0.21),vec2(0.96, 1.15),vec2(0.17, 0.11),vec2(1.06, 0.58),vec2(1.66, 1.44),vec2(0.06, 0.05),vec2(0.06, 0.12),vec2(0.13, 0.15),vec2(1.51, 1.64));
// // Rotation angles (thetas)
// float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](-0.06,0.40,0.07,0.12,-0.53,-1.26,0.78,-0.19,-0.07,0.93);
// // Colors (RGB)
// vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.78, 0.38, 0.15),vec3(0.48, 0.46, 0.23),vec3(0.40, 0.19, 0.10),vec3(0.16, 0.09, 0.07),vec3(0.22, 0.16, 0.04),vec3(0.56, 0.43, 0.21),vec3(0.45, 0.10, 0.06),vec3(0.15, 0.78, 0.18),vec3(0.20, 0.15, 0.72),vec3(0.90, 0.74, 0.29));

// // Number of Gaussians
// const int NUM_GAUSSIANS = 20;
// // Dimensions [x_min, x_max, y_min, y_max]
// float dim[4] = float[4](-5.0,5.0,-7.552816901408451,7.552816901408451);
// // Centers (x, y coordinates)
// vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-3.77, -3.41),vec2(2.26, -1.70),vec2(1.13, -5.17),vec2(-0.40, 5.76),vec2(2.16, -0.99),vec2(3.83, -4.00),vec2(-2.69, -2.46),vec2(-0.11, 0.38),vec2(-2.82, 6.43),vec2(-0.53, -1.33),vec2(2.98, -2.97),vec2(3.87, 4.73),vec2(2.41, 6.90),vec2(-3.38, -7.26),vec2(-1.54, -4.79),vec2(-3.76, 0.48),vec2(-4.01, 4.96),vec2(2.10, 5.35),vec2(-4.07, -6.65),vec2(5.12, -1.92));
// // Sigmas (scales)
// vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(0.96, 1.18),vec2(0.98, 0.69),vec2(1.31, 0.97),vec2(0.99, 1.61),vec2(0.39, 0.49),vec2(0.00, 0.05),vec2(0.39, 0.31),vec2(1.08, 0.81),vec2(1.29, 0.99),vec2(0.94, 1.02),vec2(-0.00, 0.06),vec2(1.10, 1.37),vec2(1.27, 0.80),vec2(0.00, 0.05),vec2(0.76, 0.95),vec2(0.82, 1.24),vec2(0.99, 1.36),vec2(0.39, 0.53),vec2(0.82, 0.71),vec2(0.43, 0.12));
// // Rotation angles (thetas)
// float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](-0.07,0.63,0.30,-0.13,0.28,-0.35,-0.19,0.54,-0.91,-0.75,-0.48,-0.24,-0.04,0.33,-0.60,-0.25,0.64,0.24,-0.67,-0.15);
// // Colors (RGB)
// vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.17, 0.09, 0.09),vec3(0.17, 0.08, 0.07),vec3(0.24, 0.09, 0.08),vec3(0.74, 0.57, 0.20),vec3(0.09, 0.06, 0.03),vec3(0.11, 0.15, 0.52),vec3(0.09, 0.05, 0.02),vec3(1.22, 0.83, 0.25),vec3(0.59, 0.50, 0.20),vec3(0.06, 0.02, 0.05),vec3(0.50, 0.74, 0.35),vec3(0.82, 0.69, 0.24),vec3(0.55, 0.48, 0.21),vec3(0.22, 0.42, 0.52),vec3(0.82, 0.43, 0.14),vec3(0.47, 0.33, 0.13),vec3(0.68, 0.58, 0.26),vec3(0.49, 0.39, 0.19),vec3(0.11, 0.06, 0.08),vec3(0.60, 0.32, 0.30));


// // Number of Gaussians
// const int NUM_GAUSSIANS = 30;
// // Dimensions [x_min, x_max, y_min, y_max]
// float dim[4] = float[4](-5.0,5.0,-7.552816901408451,7.552816901408451);
// // Centers (x, y coordinates)
// vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-0.80, 5.35),vec2(2.29, -6.66),vec2(-4.17, -1.56),vec2(0.64, 4.65),vec2(2.65, -3.20),vec2(3.71, 0.77),vec2(-3.78, 5.46),vec2(-4.21, 0.31),vec2(-0.73, 0.25),vec2(-5.37, 1.65),vec2(-3.86, 2.31),vec2(-3.71, -7.69),vec2(3.08, 5.21),vec2(0.75, 3.10),vec2(4.11, -6.32),vec2(0.39, 3.69),vec2(-0.04, -1.32),vec2(-2.91, -2.53),vec2(3.48, -6.90),vec2(-1.04, -4.85),vec2(-0.09, -4.04),vec2(-2.29, 2.17),vec2(2.33, 3.80),vec2(4.17, -5.50),vec2(3.65, 6.95),vec2(-3.33, 0.58),vec2(3.90, 3.61),vec2(-3.77, -3.83),vec2(3.94, 0.70),vec2(-3.27, -3.97));
// // Sigmas (scales)
// vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(1.03, 1.47),vec2(0.04, 0.00),vec2(0.40, 0.86),vec2(0.00, 0.09),vec2(0.95, 0.86),vec2(0.68, 0.21),vec2(1.15, 1.27),vec2(0.59, 0.92),vec2(0.89, 1.16),vec2(0.25, 0.36),vec2(0.77, 0.91),vec2(0.13, 0.12),vec2(1.25, 0.75),vec2(0.00, 0.07),vec2(0.02, 0.06),vec2(0.21, 0.27),vec2(0.06, 0.08),vec2(0.12, 0.13),vec2(0.02, 0.01),vec2(1.08, 0.85),vec2(-0.02, -0.00),vec2(0.72, 0.78),vec2(0.90, 0.92),vec2(0.00, 0.06),vec2(1.33, 0.81),vec2(0.25, 0.85),vec2(0.78, 1.35),vec2(0.11, 0.07),vec2(0.99, 1.09),vec2(1.02, 1.29));
// // Rotation angles (thetas)
// float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](0.18,-0.29,-0.48,-0.32,1.59,-0.50,0.07,-0.21,-1.30,0.38,1.05,0.03,-0.52,-0.30,0.03,-0.57,0.02,-0.02,0.45,-0.07,-0.25,1.11,-1.02,-0.23,-0.19,-0.14,-0.82,1.20,1.20,-0.33);
// // Colors (RGB)
// vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.99, 0.71, 0.23),vec3(0.35, 0.33, 0.46),vec3(0.48, 0.24, 0.10),vec3(0.70, 0.53, 0.61),vec3(0.13, 0.05, 0.06),vec3(0.18, 0.24, -0.02),vec3(0.88, 0.76, 0.33),vec3(0.39, 0.22, 0.09),vec3(1.06, 0.80, 0.26),vec3(0.07, 0.12, 0.34),vec3(0.14, 0.15, 0.09),vec3(0.43, 0.25, 0.45),vec3(0.80, 0.65, 0.23),vec3(0.60, 0.21, 0.41),vec3(0.19, 0.39, 0.06),vec3(0.65, 0.48, 0.06),vec3(0.33, 0.12, 0.43),vec3(0.23, 0.46, 0.05),vec3(0.65, 0.66, 0.40),vec3(0.81, 0.41, 0.13),vec3(0.01, -0.02, 0.56),vec3(0.11, 0.05, 0.05),vec3(0.02, -0.05, 0.04),vec3(0.27, 0.45, 0.09),vec3(0.63, 0.55, 0.22),vec3(0.21, 0.16, 0.03),vec3(0.38, 0.37, 0.10),vec3(0.37, 0.34, 0.29),vec3(0.35, 0.19, 0.09),vec3(0.17, 0.09, 0.09));



// const int NUM_GAUSSIANS = 40;
// Dimensions [x_min, x_max, y_min, y_max]
float dim[4] = float[4](-5.0,5.0,-7.552816901408451,7.552816901408451);
// Centers (x, y coordinates)
vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-2.90, 4.08),vec2(-4.60, 5.67),vec2(2.58, 5.42),vec2(-3.93, -3.54),vec2(-4.04, -1.78),vec2(4.33, 4.85),vec2(0.22, 7.09),vec2(-3.94, -1.11),vec2(4.24, 7.13),vec2(2.31, -1.68),vec2(-0.02, -5.92),vec2(2.39, -4.25),vec2(-1.75, -5.31),vec2(1.70, -5.03),vec2(1.59, 6.83),vec2(-0.98, -0.91),vec2(-0.32, 4.08),vec2(2.44, 2.61),vec2(-3.85, -5.62),vec2(2.57, 6.28),vec2(-0.06, 0.40),vec2(-0.56, -3.72),vec2(-3.95, 0.59),vec2(4.19, -5.17),vec2(-3.17, 6.08),vec2(-1.63, -3.55),vec2(2.95, 6.64),vec2(3.13, 4.12),vec2(2.32, 5.50),vec2(0.78, 1.82),vec2(4.41, -1.21),vec2(-3.31, -3.50),vec2(2.05, -6.86),vec2(1.90, 4.76),vec2(4.47, 0.22),vec2(2.35, -4.87),vec2(-1.51, -4.20),vec2(2.16, 3.61),vec2(3.70, 1.43),vec2(-1.46, 6.62));
// Sigmas (scales)
vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(1.06, 1.29),vec2(0.58, 1.19),vec2(-0.02, 0.00),vec2(0.26, 0.54),vec2(0.41, 0.22),vec2(0.87, 1.04),vec2(0.72, 0.63),vec2(1.13, 0.42),vec2(0.94, 0.79),vec2(0.76, 0.90),vec2(0.84, 1.21),vec2(0.09, -0.01),vec2(1.21, 0.61),vec2(0.52, 0.66),vec2(0.62, 0.74),vec2(1.03, 1.22),vec2(0.67, 1.06),vec2(0.46, 0.61),vec2(-0.01, 0.01),vec2(-0.00, 0.04),vec2(0.98, 0.77),vec2(0.03, -0.01),vec2(0.84, 1.24),vec2(0.02, -0.00),vec2(0.72, 1.14),vec2(0.05, -0.00),vec2(0.89, 0.48),vec2(0.64, 0.99),vec2(0.76, 0.53),vec2(-0.00, 0.06),vec2(0.13, 0.08),vec2(0.37, 1.00),vec2(0.48, 0.42),vec2(-0.01, 0.04),vec2(0.48, 0.83),vec2(0.31, 0.16),vec2(0.96, 0.31),vec2(0.07, 0.07),vec2(0.90, 0.74),vec2(0.80, 1.12));
// Rotation angles (thetas)
float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](-0.71,0.08,0.01,-0.34,0.05,-0.09,0.12,1.15,-0.66,-0.57,-0.43,-0.00,0.46,1.15,-0.47,-0.01,0.18,0.23,-0.17,0.35,0.36,0.05,-0.52,-0.05,0.34,0.47,-1.00,0.96,-0.63,-0.24,-0.23,-0.47,-0.04,0.45,0.66,-0.46,-0.32,0.64,0.75,0.21);
// Colors (RGB)
vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.37, 0.31, 0.14),vec3(0.63, 0.55, 0.24),vec3(0.66, 0.06, 0.69),vec3(0.16, 0.07, 0.06),vec3(0.30, 0.27, 0.09),vec3(0.72, 0.59, 0.17),vec3(0.47, 0.44, 0.19),vec3(0.40, 0.16, 0.06),vec3(0.51, 0.46, 0.18),vec3(0.20, 0.09, 0.08),vec3(0.14, 0.06, 0.06),vec3(0.79, 0.16, 0.09),vec3(0.57, 0.28, 0.12),vec3(0.27, 0.11, 0.07),vec3(0.49, 0.41, 0.16),vec3(0.17, 0.09, 0.08),vec3(1.13, 0.67, 0.19),vec3(0.19, 0.14, 0.10),vec3(0.17, 0.53, 0.11),vec3(0.62, 0.16, 0.59),vec3(1.19, 0.83, 0.23),vec3(0.04, -0.01, 0.38),vec3(0.34, 0.25, 0.11),vec3(0.48, 0.58, 0.39),vec3(0.68, 0.55, 0.22),vec3(0.61, 0.73, 0.08),vec3(0.40, 0.32, 0.15),vec3(0.32, 0.29, 0.13),vec3(0.64, 0.51, 0.22),vec3(0.34, 0.48, 0.40),vec3(0.62, 0.26, 0.51),vec3(0.23, 0.13, 0.10),vec3(0.10, 0.03, 0.06),vec3(0.57, 0.42, 0.56),vec3(0.41, 0.21, 0.05),vec3(0.26, 0.05, 0.05),vec3(0.91, 0.58, 0.11),vec3(0.66, 0.61, 0.11),vec3(0.30, 0.26, 0.09),vec3(0.54, 0.46, 0.17));


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
    mat2 R = mat2(cos(theta), -sin(theta), sin(theta), cos(theta)); 
    mat2 D = mat2(1.0 / (sigma.x * sigma.x), 0.0, 0.0, 1.0 / (sigma.y * sigma.y)); 
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
    // uv += smoothstep(0.0, 1.0, cos(iTime)) * cos(iTime + 100.0 * uv.xy) * 3.;

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