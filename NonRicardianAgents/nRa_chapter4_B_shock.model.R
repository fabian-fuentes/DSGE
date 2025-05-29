# Generated on 2025-05-29 16:58:22 by gEcon ver. 1.2.3 (2025-04-13)
# http://gecon.r-forge.r-project.org/

# Model name: nRa_chapter4_B_shock

# info
info__ <- c("nRa_chapter4_B_shock", "/Users/fabianfuentes/Library/CloudStorage/OneDrive-InstitutoTecnologicoydeEstudiosSuperioresdeMonterrey/2025/T_abr_jun/Macro/DSGE/NonRicardianAgents/nRa_chapter4_B_shock.gcn", "2025-05-29 16:58:22", "false")

# index sets
index_sets__ <- list()

# variables
variables__ <- c("pi",
                 "r",
                 "A",
                 "B",
                 "C",
                 "C_1",
                 "C_2",
                 "I",
                 "I_1",
                 "K_s",
                 "K_1_s",
                 "L_s",
                 "L_1_s",
                 "L_2_s",
                 "PI",
                 "U_1",
                 "U_2",
                 "W",
                 "Y")

variables_tex__ <- c("\\pi",
                     "r",
                     "A",
                     "B",
                     "C",
                     "C^{\\mathrm{1}}",
                     "C^{\\mathrm{2}}",
                     "I",
                     "I^{\\mathrm{1}}",
                     "K^{\\mathrm{s}}",
                     "K^{\\mathrm{1}^{\\mathrm{s}}}",
                     "L^{\\mathrm{s}}",
                     "L^{\\mathrm{1}^{\\mathrm{s}}}",
                     "L^{\\mathrm{2}^{\\mathrm{s}}}",
                     "\\Pi",
                     "U^{\\mathrm{1}}",
                     "U^{\\mathrm{2}}",
                     "W",
                     "Y")

# shocks
shocks__ <- c("epsilon_B")

shocks_tex__ <- c("\\epsilon^{\\mathrm{B}}")

# parameters
parameters__ <- c("alpha",
                  "beta",
                  "delta",
                  "gamma",
                  "omega",
                  "rho_B")

parameters_tex__ <- c("\\alpha",
                     "\\beta",
                     "\\delta",
                     "\\gamma",
                     "\\omega",
                     "\\rho^{\\mathrm{B}}")

# free parameters
parameters_free__ <- c("alpha",
                       "beta",
                       "delta",
                       "gamma",
                       "omega",
                       "rho_B")

# free parameters' values
parameters_free_val__ <- c(0.35,
                           0.97,
                           0.06,
                           0.4,
                           0.5,
                           0.95)

# equations
equations__ <- c("1 - A[] = 0",
                 "-pi[] + PI[] = 0",
                 "-r[] + alpha * A[] * K_s[-1]^(-1 + alpha) * L_s[]^(1 - alpha) = 0",
                 "-B[] + exp(epsilon_B[] + rho_B * log(B[-1])) = 0",
                 "-C_2[] + L_2_s[] * W[] = 0",
                 "-I[] + omega * I_1[] = 0",
                 "-K_s[] + omega * K_1_s[] = 0",
                 "-W[] + A[] * (1 - alpha) * K_s[-1]^alpha * L_s[]^(-alpha) = 0",
                 "-Y[] + A[] * K_s[-1]^alpha * L_s[]^(1 - alpha) = 0",
                 "-gamma * C_1[]^-1 + beta * B[] * (gamma * E[][r[1] * C_1[1]^-1] + gamma * (1 - delta) * E[][C_1[1]^-1]) = 0",
                 "-(1 - gamma) * (1 - L_1_s[])^-1 + gamma * C_1[]^-1 * W[] = 0",
                 "-(1 - gamma) * (1 - L_2_s[])^-1 + gamma * C_2[]^-1 * W[] = 0",
                 "-C[] + omega * C_1[] + C_2[] * (1 - omega) = 0",
                 "I_1[] - K_1_s[] + K_1_s[-1] * (1 - delta) = 0",
                 "-L_s[] + omega * L_1_s[] + L_2_s[] * (1 - omega) = 0",
                 "-pi[] + Y[] - K_s[-1] * r[] - L_s[] * W[] = 0",
                 "-C_1[] - I_1[] + K_1_s[-1] * r[] + L_1_s[] * W[] = 0",
                 "U_1[] - gamma * log(C_1[]) - log(1 - L_1_s[]) * (1 - gamma) - beta * B[] * E[][U_1[1]] = 0",
                 "U_2[] - gamma * log(C_2[]) - log(1 - L_2_s[]) * (1 - gamma) - beta * B[] * E[][U_2[1]] = 0")

# calibrating equations
calibr_equations__ <- character(0)

# variables / equations map
vareqmap__ <- sparseMatrix(i = c(1, 2, 2, 3, 3, 3, 3, 4, 5, 5,
                                 5, 6, 6, 7, 7, 8, 8, 8, 8, 9,
                                 9, 9, 9, 10, 10, 10, 11, 11, 11, 12,
                                 12, 12, 13, 13, 13, 14, 14, 15, 15, 15,
                                 16, 16, 16, 16, 16, 16, 17, 17, 17, 17,
                                 17, 17, 18, 18, 18, 18, 19, 19, 19, 19),
                           j = c(3, 1, 15, 2, 3, 10, 12, 4, 7, 14,
                                 18, 8, 9, 10, 11, 3, 10, 12, 18, 3,
                                 10, 12, 19, 2, 4, 6, 6, 13, 18, 7,
                                 14, 18, 5, 6, 7, 9, 11, 12, 13, 14,
                                 1, 2, 10, 12, 18, 19, 2, 6, 9, 11,
                                 13, 18, 4, 6, 13, 16, 4, 7, 14, 17),
                           x = c(2, 2, 2, 2, 2, 1, 2, 3, 2, 2,
                                 2, 2, 2, 2, 2, 2, 1, 2, 2, 2,
                                 1, 2, 2, 4, 2, 6, 2, 2, 2, 2,
                                 2, 2, 2, 2, 2, 2, 3, 2, 2, 2,
                                 2, 2, 1, 2, 2, 2, 2, 2, 2, 1,
                                 2, 2, 2, 2, 2, 6, 2, 2, 2, 6),
                           dims = c(19, 19))

# variables / calibrating equations map
varcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 19))

# calibrated parameters / equations map
calibrpareqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(19, 0))

# calibrated parameters / calibrating equations map
calibrparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 0))

# free parameters / equations map
freepareqmap__ <- sparseMatrix(i = c(3, 4, 6, 7, 8, 9, 10, 10, 10, 11,
                                     12, 13, 14, 15, 18, 18, 19, 19),
                               j = c(1, 6, 5, 5, 1, 1, 2, 3, 4, 4,
                                     4, 5, 3, 5, 2, 4, 2, 4),
                               x = rep(1, 18), dims = c(19, 6))

# free parameters / calibrating equations map
freeparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 6))

# shocks / equations map
shockeqmap__ <- sparseMatrix(i = c(4),
                             j = c(1),
                             x = rep(1, 1), dims = c(19, 1))

# steady state equations
ss_eq__ <- function(v, pc, pf)
{
    r <- numeric(19)
    r[1] = 1 - v[3]
    r[2] = -v[1] + v[15]
    r[3] = -v[2] + pf[1] * v[3] * v[10]^(-1 + pf[1]) * v[12]^(1 - pf[1])
    r[4] = -v[4] + exp(pf[6] * log(v[4]))
    r[5] = -v[7] + v[14] * v[18]
    r[6] = -v[8] + pf[5] * v[9]
    r[7] = -v[10] + pf[5] * v[11]
    r[8] = -v[18] + v[3] * (1 - pf[1]) * v[10]^pf[1] * v[12]^(-pf[1])
    r[9] = -v[19] + v[3] * v[10]^pf[1] * v[12]^(1 - pf[1])
    r[10] = -pf[4] * v[6]^-1 + pf[2] * v[4] * (pf[4] * v[2] * v[6]^-1 + pf[4] * v[6]^-1 * (1 - pf[3]))
    r[11] = -(1 - pf[4]) * (1 - v[13])^-1 + pf[4] * v[6]^-1 * v[18]
    r[12] = -(1 - pf[4]) * (1 - v[14])^-1 + pf[4] * v[7]^-1 * v[18]
    r[13] = -v[5] + pf[5] * v[6] + v[7] * (1 - pf[5])
    r[14] = v[9] - v[11] + v[11] * (1 - pf[3])
    r[15] = -v[12] + pf[5] * v[13] + v[14] * (1 - pf[5])
    r[16] = -v[1] + v[19] - v[2] * v[10] - v[12] * v[18]
    r[17] = -v[6] - v[9] + v[2] * v[11] + v[13] * v[18]
    r[18] = v[16] - pf[4] * log(v[6]) - log(1 - v[13]) * (1 - pf[4]) - pf[2] * v[4] * v[16]
    r[19] = v[17] - pf[4] * log(v[7]) - log(1 - v[14]) * (1 - pf[4]) - pf[2] * v[4] * v[17]

    return(r)
}

# calibrating equations
calibr_eq__ <- function(v, pc, pf)
{
    r <- numeric(0)

    return(r)
}

# steady state and calibrating equations Jacobian
ss_calibr_eq_jacob__ <- function(v, pc, pf)
{
    r <- numeric(0)
    jac <- numeric(60)
    jac[1] = -1
    jac[2] = -1
    jac[3] = 1
    jac[4] = -1
    jac[5] = pf[1] * v[10]^(-1 + pf[1]) * v[12]^(1 - pf[1])
    jac[6] = pf[1] * v[3] * (-1 + pf[1]) * v[10]^(-2 + pf[1]) * v[12]^(1 - pf[1])
    jac[7] = pf[1] * v[3] * (1 - pf[1]) * v[10]^(-1 + pf[1]) * v[12]^(-pf[1])
    jac[8] = -1 + pf[6] * v[4]^-1 * exp(pf[6] * log(v[4]))
    jac[9] = -1
    jac[10] = v[18]
    jac[11] = v[14]
    jac[12] = -1
    jac[13] = pf[5]
    jac[14] = -1
    jac[15] = pf[5]
    jac[16] = (1 - pf[1]) * v[10]^pf[1] * v[12]^(-pf[1])
    jac[17] = pf[1] * v[3] * (1 - pf[1]) * v[10]^(-1 + pf[1]) * v[12]^(-pf[1])
    jac[18] = -pf[1] * v[3] * (1 - pf[1]) * v[10]^pf[1] * v[12]^(-1 - pf[1])
    jac[19] = -1
    jac[20] = v[10]^pf[1] * v[12]^(1 - pf[1])
    jac[21] = pf[1] * v[3] * v[10]^(-1 + pf[1]) * v[12]^(1 - pf[1])
    jac[22] = v[3] * (1 - pf[1]) * v[10]^pf[1] * v[12]^(-pf[1])
    jac[23] = -1
    jac[24] = pf[2] * pf[4] * v[4] * v[6]^-1
    jac[25] = pf[2] * (pf[4] * v[2] * v[6]^-1 + pf[4] * v[6]^-1 * (1 - pf[3]))
    jac[26] = pf[4] * v[6]^-2 + pf[2] * v[4] * (-pf[4] * v[2] * v[6]^-2 - pf[4] * v[6]^-2 * (1 - pf[3]))
    jac[27] = -pf[4] * v[6]^-2 * v[18]
    jac[28] = -(1 - pf[4]) * (1 - v[13])^-2
    jac[29] = pf[4] * v[6]^-1
    jac[30] = -pf[4] * v[7]^-2 * v[18]
    jac[31] = -(1 - pf[4]) * (1 - v[14])^-2
    jac[32] = pf[4] * v[7]^-1
    jac[33] = -1
    jac[34] = pf[5]
    jac[35] = 1 - pf[5]
    jac[36] = 1
    jac[37] = -pf[3]
    jac[38] = -1
    jac[39] = pf[5]
    jac[40] = 1 - pf[5]
    jac[41] = -1
    jac[42] = -v[10]
    jac[43] = -v[2]
    jac[44] = -v[18]
    jac[45] = -v[12]
    jac[46] = 1
    jac[47] = v[11]
    jac[48] = -1
    jac[49] = -1
    jac[50] = v[2]
    jac[51] = v[18]
    jac[52] = v[13]
    jac[53] = -pf[2] * v[16]
    jac[54] = -pf[4] * v[6]^-1
    jac[55] = (1 - pf[4]) * (1 - v[13])^-1
    jac[56] = 1 - pf[2] * v[4]
    jac[57] = -pf[2] * v[17]
    jac[58] = -pf[4] * v[7]^-1
    jac[59] = (1 - pf[4]) * (1 - v[14])^-1
    jac[60] = 1 - pf[2] * v[4]
    jacob <- sparseMatrix(i = c(1, 2, 2, 3, 3, 3, 3, 4, 5, 5,
                                5, 6, 6, 7, 7, 8, 8, 8, 8, 9,
                                9, 9, 9, 10, 10, 10, 11, 11, 11, 12,
                                12, 12, 13, 13, 13, 14, 14, 15, 15, 15,
                                16, 16, 16, 16, 16, 16, 17, 17, 17, 17,
                                17, 17, 18, 18, 18, 18, 19, 19, 19, 19),
                          j = c(3, 1, 15, 2, 3, 10, 12, 4, 7, 14,
                                18, 8, 9, 10, 11, 3, 10, 12, 18, 3,
                                10, 12, 19, 2, 4, 6, 6, 13, 18, 7,
                                14, 18, 5, 6, 7, 9, 11, 12, 13, 14,
                                1, 2, 10, 12, 18, 19, 2, 6, 9, 11,
                                13, 18, 4, 6, 13, 16, 4, 7, 14, 17),
                          x = jac, dims = c(19, 19))

    return(jacob)
}

# 1st order perturbation
pert1__ <- function(v, pc, pf)
{
    Atm1x <- numeric(7)
    Atm1x[1] = pf[1] * v[3] * (-1 + pf[1]) * v[10]^(-2 + pf[1]) * v[12]^(1 - pf[1])
    Atm1x[2] = pf[6] * v[4]^-1 * exp(pf[6] * log(v[4]))
    Atm1x[3] = pf[1] * v[3] * (1 - pf[1]) * v[10]^(-1 + pf[1]) * v[12]^(-pf[1])
    Atm1x[4] = pf[1] * v[3] * v[10]^(-1 + pf[1]) * v[12]^(1 - pf[1])
    Atm1x[5] = 1 - pf[3]
    Atm1x[6] = -v[2]
    Atm1x[7] = v[2]
    Atm1 <- sparseMatrix(i = c(3, 4, 8, 9, 14, 16, 17),
                         j = c(10, 4, 10, 10, 11, 10, 11),
                         x = Atm1x, dims = c(19, 19))

    Atx <- numeric(54)
    Atx[1] = -1
    Atx[2] = -1
    Atx[3] = 1
    Atx[4] = -1
    Atx[5] = pf[1] * v[10]^(-1 + pf[1]) * v[12]^(1 - pf[1])
    Atx[6] = pf[1] * v[3] * (1 - pf[1]) * v[10]^(-1 + pf[1]) * v[12]^(-pf[1])
    Atx[7] = -1
    Atx[8] = -1
    Atx[9] = v[18]
    Atx[10] = v[14]
    Atx[11] = -1
    Atx[12] = pf[5]
    Atx[13] = -1
    Atx[14] = pf[5]
    Atx[15] = (1 - pf[1]) * v[10]^pf[1] * v[12]^(-pf[1])
    Atx[16] = -pf[1] * v[3] * (1 - pf[1]) * v[10]^pf[1] * v[12]^(-1 - pf[1])
    Atx[17] = -1
    Atx[18] = v[10]^pf[1] * v[12]^(1 - pf[1])
    Atx[19] = v[3] * (1 - pf[1]) * v[10]^pf[1] * v[12]^(-pf[1])
    Atx[20] = -1
    Atx[21] = pf[2] * (pf[4] * v[2] * v[6]^-1 + pf[4] * v[6]^-1 * (1 - pf[3]))
    Atx[22] = pf[4] * v[6]^-2
    Atx[23] = -pf[4] * v[6]^-2 * v[18]
    Atx[24] = (-1 + pf[4]) * (1 - v[13])^-2
    Atx[25] = pf[4] * v[6]^-1
    Atx[26] = -pf[4] * v[7]^-2 * v[18]
    Atx[27] = (-1 + pf[4]) * (1 - v[14])^-2
    Atx[28] = pf[4] * v[7]^-1
    Atx[29] = -1
    Atx[30] = pf[5]
    Atx[31] = 1 - pf[5]
    Atx[32] = 1
    Atx[33] = -1
    Atx[34] = -1
    Atx[35] = pf[5]
    Atx[36] = 1 - pf[5]
    Atx[37] = -1
    Atx[38] = -v[10]
    Atx[39] = -v[18]
    Atx[40] = -v[12]
    Atx[41] = 1
    Atx[42] = v[11]
    Atx[43] = -1
    Atx[44] = -1
    Atx[45] = v[18]
    Atx[46] = v[13]
    Atx[47] = -pf[2] * v[16]
    Atx[48] = -pf[4] * v[6]^-1
    Atx[49] = (1 - pf[4]) * (1 - v[13])^-1
    Atx[50] = 1
    Atx[51] = -pf[2] * v[17]
    Atx[52] = -pf[4] * v[7]^-1
    Atx[53] = (1 - pf[4]) * (1 - v[14])^-1
    Atx[54] = 1
    At <- sparseMatrix(i = c(1, 2, 2, 3, 3, 3, 4, 5, 5, 5,
                             6, 6, 7, 7, 8, 8, 8, 9, 9, 9,
                             10, 10, 11, 11, 11, 12, 12, 12, 13, 13,
                             13, 14, 14, 15, 15, 15, 16, 16, 16, 16,
                             16, 17, 17, 17, 17, 17, 18, 18, 18, 18,
                             19, 19, 19, 19),
                       j = c(3, 1, 15, 2, 3, 12, 4, 7, 14, 18,
                             8, 9, 10, 11, 3, 12, 18, 3, 12, 19,
                             4, 6, 6, 13, 18, 7, 14, 18, 5, 6,
                             7, 9, 11, 12, 13, 14, 1, 2, 12, 18,
                             19, 2, 6, 9, 13, 18, 4, 6, 13, 16,
                             4, 7, 14, 17),
                         x = Atx, dims = c(19, 19))

    Atp1x <- numeric(4)
    Atp1x[1] = pf[2] * pf[4] * v[4] * v[6]^-1
    Atp1x[2] = pf[2] * v[4] * (-pf[4] * v[2] * v[6]^-2 - pf[4] * v[6]^-2 * (1 - pf[3]))
    Atp1x[3] = -pf[2] * v[4]
    Atp1x[4] = -pf[2] * v[4]
    Atp1 <- sparseMatrix(i = c(10, 10, 18, 19),
                         j = c(2, 6, 16, 17),
                         x = Atp1x, dims = c(19, 19))

    Aepsx <- numeric(1)
    Aepsx[1] = exp(pf[6] * log(v[4]))
    Aeps <- sparseMatrix(i = c(4),
                         j = c(1),
                         x = Aepsx, dims = c(19, 1))

    return(list(Atm1, At, Atp1, Aeps))
}

ext__ <- list()

# create model object
gecon_model(model_info = info__,
            index_sets = index_sets__,
            variables = variables__,
            variables_tex = variables_tex__,
            shocks = shocks__,
            shocks_tex = shocks_tex__,
            parameters = parameters__,
            parameters_tex = parameters_tex__,
            parameters_free = parameters_free__,
            parameters_free_val = parameters_free_val__,
            equations = equations__,
            calibr_equations = calibr_equations__,
            var_eq_map = vareqmap__,
            shock_eq_map = shockeqmap__,
            var_ceq_map = varcalibreqmap__,
            cpar_eq_map = calibrpareqmap__,
            cpar_ceq_map = calibrparcalibreqmap__,
            fpar_eq_map = freepareqmap__,
            fpar_ceq_map = freeparcalibreqmap__,
            ss_function = ss_eq__,
            calibr_function = calibr_eq__,
            ss_calibr_jac_function = ss_calibr_eq_jacob__,
            pert = pert1__,
            ext = ext__)
