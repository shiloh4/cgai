uniform float iTime;
uniform vec2 iResolution;

//======================================================= Copy-Paste Area Begin =========================================================
// default
// Number of Gaussians
const int NUM_GAUSSIANS = 2;
// Dimensions [x_min, x_max, y_min, y_max]
float dim[4] = float[4](-5.0,5.0,-5.0,5.0);
// Centers (x, y coordinates)
vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(-3.00, 1.50),vec2(1.50, 2.50));
// Sigmas (scales)
vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(2.00, 1.50),vec2(1.50, 0.50));
// Rotation angles (thetas)
float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](0.20,0.80);
// Colors (RGB)
vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.70, 0.10, 0.20),vec3(0.30, 0.80, 0.10));

// mona lisa
// // Number of Gaussians
// const int NUM_GAUSSIANS = 100;
// // Dimensions [x_min, x_max, y_min, y_max]
// float dim[4] = float[4](-5.0,5.0,-7.552816901408451,7.552816901408451);
// // Centers (x, y coordinates)
// vec2 gauss_centers[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(0.56, -0.19),vec2(-3.94, -4.12),vec2(4.59, 7.24),vec2(4.38, 3.03),vec2(-2.55, 6.55),vec2(-3.22, -4.49),vec2(-4.33, -6.37),vec2(1.82, 5.51),vec2(-2.54, -5.06),vec2(-2.01, 2.42),vec2(-0.87, 6.83),vec2(-0.95, -4.15),vec2(-3.26, -7.81),vec2(0.39, -6.41),vec2(4.24, -6.05),vec2(-0.40, -0.09),vec2(-2.76, 1.77),vec2(-2.21, 2.13),vec2(0.44, 0.99),vec2(-4.23, 4.04),vec2(-1.84, 4.94),vec2(-2.75, -5.38),vec2(-4.40, -0.53),vec2(-3.63, -3.44),vec2(-2.65, -3.74),vec2(-4.27, 0.78),vec2(0.12, -7.82),vec2(-3.32, -6.29),vec2(0.01, -2.92),vec2(2.70, 3.52),vec2(4.22, -7.33),vec2(-0.98, 0.53),vec2(0.26, 3.89),vec2(1.58, 1.05),vec2(2.46, 0.45),vec2(-4.06, -6.20),vec2(-3.09, -2.57),vec2(1.63, 3.29),vec2(-0.66, -7.46),vec2(-1.34, -4.67),vec2(-0.99, 4.24),vec2(-3.78, 6.62),vec2(4.51, -3.69),vec2(0.02, 5.28),vec2(-4.13, -1.55),vec2(-5.25, -0.24),vec2(2.73, 3.29),vec2(-3.29, 3.35),vec2(1.83, -0.92),vec2(-2.35, 4.20),vec2(2.72, 0.61),vec2(-3.61, 4.76),vec2(1.75, -3.76),vec2(1.65, -2.20),vec2(-3.59, -3.81),vec2(0.29, -5.60),vec2(1.56, 4.87),vec2(1.83, -4.85),vec2(3.56, -4.32),vec2(-4.70, 5.28),vec2(-0.76, 3.71),vec2(-4.85, 6.62),vec2(3.94, 4.05),vec2(3.01, 5.20),vec2(1.33, 6.70),vec2(-3.30, 7.58),vec2(-2.21, -7.10),vec2(2.79, -3.90),vec2(-2.34, -5.82),vec2(-4.40, -7.53),vec2(-0.37, -2.18),vec2(1.49, -7.55),vec2(3.43, 0.82),vec2(-2.66, 5.21),vec2(-4.00, 1.90),vec2(-0.40, 5.01),vec2(1.90, 0.07),vec2(-1.10, -3.16),vec2(3.74, -2.38),vec2(-0.76, -4.34),vec2(4.29, 0.73),vec2(2.34, -1.51),vec2(3.09, 1.64),vec2(-0.26, 5.95),vec2(-4.43, 2.98),vec2(-0.86, -1.42),vec2(-1.85, 5.92),vec2(-4.05, -4.69),vec2(-3.93, 5.45),vec2(-1.99, -5.35),vec2(4.89, 5.32),vec2(-3.01, 5.53),vec2(-3.38, -7.32),vec2(2.58, 3.06),vec2(2.67, 7.26),vec2(4.13, -6.39),vec2(-5.14, 0.58),vec2(-0.43, 3.01),vec2(-3.35, 0.27),vec2(-2.21, 5.01));
// // Sigmas (scales)
// vec2 gauss_sigmas[NUM_GAUSSIANS] = vec2[NUM_GAUSSIANS](vec2(0.57, 0.31),vec2(1.20, 0.71),vec2(0.87, 0.90),vec2(1.05, 0.82),vec2(0.58, 0.62),vec2(-0.01, 0.05),vec2(-0.00, 0.05),vec2(0.25, 0.69),vec2(0.08, 0.01),vec2(0.04, -0.00),vec2(1.06, 0.56),vec2(0.01, -0.00),vec2(0.22, 0.12),vec2(0.02, -0.00),vec2(0.02, -0.00),vec2(0.66, 0.50),vec2(0.60, 0.25),vec2(0.40, 0.69),vec2(0.51, 0.65),vec2(0.63, 0.35),vec2(0.14, 0.62),vec2(0.05, 0.19),vec2(0.41, 0.35),vec2(0.00, 0.12),vec2(0.01, 0.02),vec2(0.82, 0.50),vec2(0.23, 0.14),vec2(0.01, 0.00),vec2(-0.00, 0.08),vec2(0.07, 0.44),vec2(0.00, 0.07),vec2(0.86, 0.28),vec2(0.36, 0.68),vec2(0.02, 0.06),vec2(0.67, 0.34),vec2(1.21, 0.87),vec2(0.70, 0.46),vec2(-0.00, 0.02),vec2(0.43, 0.20),vec2(1.05, 0.37),vec2(0.27, 0.99),vec2(0.64, 0.50),vec2(0.73, 0.37),vec2(0.07, -0.01),vec2(0.38, 0.83),vec2(0.07, 0.06),vec2(0.70, 0.53),vec2(0.60, 0.57),vec2(0.26, 0.45),vec2(0.40, 0.28),vec2(0.00, 0.04),vec2(1.02, 0.27),vec2(0.06, 0.00),vec2(0.08, 0.39),vec2(0.24, 0.29),vec2(1.72, 1.14),vec2(0.00, 0.02),vec2(0.20, 0.46),vec2(0.01, 0.01),vec2(0.32, 0.62),vec2(0.93, 0.19),vec2(0.45, 0.87),vec2(0.71, 0.62),vec2(0.79, 0.75),vec2(1.18, 0.58),vec2(1.53, 0.33),vec2(0.89, 0.68),vec2(0.03, -0.01),vec2(0.36, 0.24),vec2(0.41, 0.77),vec2(0.05, -0.00),vec2(0.55, 0.93),vec2(0.44, 0.23),vec2(0.53, 0.27),vec2(0.93, 0.62),vec2(0.51, 0.44),vec2(0.17, 0.54),vec2(0.57, 0.29),vec2(1.54, 1.16),vec2(1.32, 0.19),vec2(0.49, 1.09),vec2(0.23, 0.51),vec2(0.58, 0.11),vec2(0.05, -0.00),vec2(0.55, 0.43),vec2(1.61, 1.30),vec2(0.65, 0.35),vec2(0.07, 0.00),vec2(0.41, 0.48),vec2(0.41, 0.25),vec2(0.74, 0.88),vec2(0.52, 0.71),vec2(0.01, 0.01),vec2(0.54, 0.87),vec2(0.68, 1.15),vec2(1.10, 1.37),vec2(0.04, 0.11),vec2(0.78, 0.53),vec2(0.46, 0.55),vec2(0.68, 0.22));
// // Rotation angles (thetas)
// float gauss_thetas[NUM_GAUSSIANS] = float[NUM_GAUSSIANS](0.77,-0.02,0.24,1.73,-0.81,-0.88,-0.72,0.69,0.04,-0.14,-0.09,0.02,-0.06,0.01,0.24,0.48,0.13,0.22,-1.30,0.33,-0.47,-0.26,-0.47,0.30,-0.22,0.79,-0.00,-0.02,-0.77,-1.66,0.30,0.90,-0.27,-0.30,-0.81,-0.00,0.28,0.01,0.08,-0.55,0.05,0.51,1.46,-0.04,-0.59,-0.81,-1.76,0.24,-0.97,0.09,-0.14,-0.08,-0.24,-0.30,0.20,0.36,-0.07,1.36,-0.04,-0.23,0.05,-0.31,0.54,0.57,-0.57,0.03,0.50,-0.01,-0.78,1.55,-0.40,-1.33,-0.57,0.26,0.48,-0.27,-1.21,-0.35,0.69,-0.37,0.35,-0.93,-0.15,0.01,0.55,-0.62,0.37,0.61,-0.40,-0.69,0.74,-0.38,-0.34,0.10,0.94,-0.28,0.29,-0.33,-0.30,0.88);
// // Colors (RGB)
// vec3 gauss_colors[NUM_GAUSSIANS] = vec3[NUM_GAUSSIANS](vec3(0.67, 0.42, 0.10),vec3(0.10, 0.06, 0.07),vec3(0.44, 0.40, 0.15),vec3(0.13, 0.13, 0.06),vec3(0.29, 0.23, 0.08),vec3(0.35, 0.02, 0.05),vec3(0.56, 0.19, 0.52),vec3(0.43, 0.37, 0.15),vec3(0.70, 0.57, 0.69),vec3(0.12, 0.77, 0.40),vec3(0.54, 0.47, 0.19),vec3(0.31, 0.17, 0.40),vec3(0.42, 0.17, 0.53),vec3(0.16, 0.75, 0.74),vec3(0.36, 0.34, 0.47),vec3(0.83, 0.75, 0.24),vec3(0.23, 0.24, 0.15),vec3(0.26, 0.18, 0.10),vec3(0.89, 0.56, 0.14),vec3(0.39, 0.34, 0.14),vec3(0.53, 0.46, 0.21),vec3(0.48, 0.26, 0.15),vec3(0.45, 0.17, 0.07),vec3(0.53, 0.25, 0.34),vec3(0.33, 0.19, 0.67),vec3(0.24, 0.16, 0.07),vec3(0.25, 0.15, 0.28),vec3(0.34, 0.41, 0.64),vec3(0.09, 0.03, 0.34),vec3(0.38, 0.30, 0.09),vec3(0.11, 0.14, 0.04),vec3(0.76, 0.51, 0.15),vec3(0.73, 0.41, 0.09),vec3(0.47, 0.56, 0.32),vec3(0.13, 0.04, 0.07),vec3(0.09, 0.05, 0.06),vec3(0.12, 0.07, 0.06),vec3(0.26, 0.67, 0.25),vec3(0.06, 0.04, 0.04),vec3(0.75, 0.43, 0.09),vec3(0.62, 0.43, 0.12),vec3(0.53, 0.44, 0.19),vec3(0.02, 0.01, 0.01),vec3(0.65, 0.23, 0.49),vec3(0.53, 0.29, 0.12),vec3(0.00, 0.49, 0.37),vec3(-0.49, -0.22, -0.11),vec3(0.25, 0.21, 0.10),vec3(0.17, 0.10, 0.08),vec3(0.58, 0.46, 0.19),vec3(0.38, -0.00, 0.25),vec3(0.46, 0.38, 0.15),vec3(0.13, 0.04, 0.52),vec3(0.08, 0.05, 0.03),vec3(0.33, 0.18, 0.03),vec3(0.11, 0.03, 0.05),vec3(-0.04, 0.62, 0.18),vec3(0.35, 0.15, 0.04),vec3(0.12, 0.06, 0.47),vec3(0.46, 0.40, 0.17),vec3(0.28, 0.24, 0.08),vec3(0.42, 0.36, 0.15),vec3(0.58, 0.48, 0.14),vec3(0.59, 0.49, 0.20),vec3(0.50, 0.41, 0.16),vec3(0.34, 0.32, 0.15),vec3(0.06, 0.03, 0.04),vec3(0.11, 0.05, 0.46),vec3(0.49, 0.23, 0.06),vec3(0.06, 0.03, 0.04),vec3(0.21, 0.47, 0.02),vec3(0.06, 0.02, 0.03),vec3(0.45, 0.39, 0.08),vec3(0.27, 0.21, 0.07),vec3(0.14, 0.14, 0.08),vec3(1.11, 0.77, 0.23),vec3(0.60, 0.35, 0.09),vec3(0.01, 0.01, 0.01),vec3(0.08, 0.03, 0.04),vec3(0.74, 0.46, 0.08),vec3(0.40, 0.26, 0.06),vec3(0.34, 0.20, 0.09),vec3(0.21, 0.21, 0.08),vec3(0.07, 0.72, 0.61),vec3(0.16, 0.14, 0.08),vec3(0.12, 0.05, 0.05),vec3(0.41, 0.32, 0.11),vec3(0.44, 0.09, 0.56),vec3(0.55, 0.46, 0.20),vec3(0.79, 0.45, 0.10),vec3(0.51, 0.40, 0.09),vec3(0.46, 0.39, 0.17),vec3(0.15, 0.09, 0.43),vec3(0.58, 0.33, 0.19),vec3(0.43, 0.36, 0.16),vec3(0.06, 0.02, 0.03),vec3(0.76, 0.39, 0.37),vec3(0.59, 0.27, 0.12),vec3(0.42, 0.29, 0.08),vec3(0.43, 0.36, 0.15));


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