# Generated on 2025-05-29 16:58:28 by gEcon ver. 1.2.3 (2025-04-13)
# http://gecon.r-forge.r-project.org/

# Model name: nRa_chapter4

# info
info__ <- c("nRa_chapter4", "/Users/fabianfuentes/Library/CloudStorage/OneDrive-InstitutoTecnologicoydeEstudiosSuperioresdeMonterrey/2025/T_abr_jun/Macro/DSGE/NonRicardianAgents/nRa_chapter4.gcn", "2025-05-29 16:58:28", "false")

# index sets
index_sets__ <- list()

# variables
variables__ <- c("pi",
                 "r",
                 "A",
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
shocks__ <- c("epsilon_A")

shocks_tex__ <- c("\\epsilon^{\\mathrm{A}}")

# parameters
parameters__ <- c("alpha",
                  "beta",
                  "delta",
                  "gamma",
                  "omega",
                  "rho")

parameters_tex__ <- c("\\alpha",
                     "\\beta",
                     "\\delta",
                     "\\gamma",
                     "\\omega",
                     "\\rho")

# free parameters
parameters_free__ <- c("alpha",
                       "beta",
                       "delta",
                       "gamma",
                       "omega",
                       "rho")

# free parameters' values
parameters_free_val__ <- c(0.35,
                           0.97,
                           0.06,
                           0.4,
                           0.5,
                           0.95)

# equations
equations__ <- c("-pi[] + PI[] = 0",
                 "-r[] + alpha * A[] * K_s[-1]^(-1 + alpha) * L_s[]^(1 - alpha) = 0",
                 "-A[] + exp(epsilon_A[] + rho * log(A[-1])) = 0",
                 "-C_2[] + L_2_s[] * W[] = 0",
                 "-I[] + omega * I_1[] = 0",
                 "-K_s[] + omega * K_1_s[] = 0",
                 "-W[] + A[] * (1 - alpha) * K_s[-1]^alpha * L_s[]^(-alpha) = 0",
                 "-Y[] + A[] * K_s[-1]^alpha * L_s[]^(1 - alpha) = 0",
                 "beta * (gamma * E[][r[1] * C_1[1]^-1] + gamma * (1 - delta) * E[][C_1[1]^-1]) - gamma * C_1[]^-1 = 0",
                 "-(1 - gamma) * (1 - L_1_s[])^-1 + gamma * C_1[]^-1 * W[] = 0",
                 "-(1 - gamma) * (1 - L_2_s[])^-1 + gamma * C_2[]^-1 * W[] = 0",
                 "-C[] + omega * C_1[] + C_2[] * (1 - omega) = 0",
                 "I_1[] - K_1_s[] + K_1_s[-1] * (1 - delta) = 0",
                 "-L_s[] + omega * L_1_s[] + L_2_s[] * (1 - omega) = 0",
                 "-pi[] + Y[] - K_s[-1] * r[] - L_s[] * W[] = 0",
                 "-C_1[] - I_1[] + K_1_s[-1] * r[] + L_1_s[] * W[] = 0",
                 "U_1[] - beta * E[][U_1[1]] - gamma * log(C_1[]) - log(1 - L_1_s[]) * (1 - gamma) = 0",
                 "U_2[] - beta * E[][U_2[1]] - gamma * log(C_2[]) - log(1 - L_2_s[]) * (1 - gamma) = 0")

# calibrating equations
calibr_equations__ <- character(0)

# variables / equations map
vareqmap__ <- sparseMatrix(i = c(1, 1, 2, 2, 2, 2, 3, 4, 4, 4,
                                 5, 5, 6, 6, 7, 7, 7, 7, 8, 8,
                                 8, 8, 9, 9, 10, 10, 10, 11, 11, 11,
                                 12, 12, 12, 13, 13, 14, 14, 14, 15, 15,
                                 15, 15, 15, 15, 16, 16, 16, 16, 16, 16,
                                 17, 17, 17, 18, 18, 18),
                           j = c(1, 14, 2, 3, 9, 11, 3, 6, 13, 17,
                                 7, 8, 9, 10, 3, 9, 11, 17, 3, 9,
                                 11, 18, 2, 5, 5, 12, 17, 6, 13, 17,
                                 4, 5, 6, 8, 10, 11, 12, 13, 1, 2,
                                 9, 11, 17, 18, 2, 5, 8, 10, 12, 17,
                                 5, 12, 15, 6, 13, 16),
                           x = c(2, 2, 2, 2, 1, 2, 3, 2, 2, 2,
                                 2, 2, 2, 2, 2, 1, 2, 2, 2, 1,
                                 2, 2, 4, 6, 2, 2, 2, 2, 2, 2,
                                 2, 2, 2, 2, 3, 2, 2, 2, 2, 2,
                                 1, 2, 2, 2, 2, 2, 2, 1, 2, 2,
                                 2, 2, 6, 2, 2, 6),
                           dims = c(18, 18))

# variables / calibrating equations map
varcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 18))

# calibrated parameters / equations map
calibrpareqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(18, 0))

# calibrated parameters / calibrating equations map
calibrparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 0))

# free parameters / equations map
freepareqmap__ <- sparseMatrix(i = c(2, 3, 5, 6, 7, 8, 9, 9, 9, 10,
                                     11, 12, 13, 14, 17, 17, 18, 18),
                               j = c(1, 6, 5, 5, 1, 1, 2, 3, 4, 4,
                                     4, 5, 3, 5, 2, 4, 2, 4),
                               x = rep(1, 18), dims = c(18, 6))

# free parameters / calibrating equations map
freeparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 6))

# shocks / equations map
shockeqmap__ <- sparseMatrix(i = c(3),
                             j = c(1),
                             x = rep(1, 1), dims = c(18, 1))

# steady state equations
ss_eq__ <- function(v, pc, pf)
{
    r <- numeric(18)
    r[1] = -v[1] + v[14]
    r[2] = -v[2] + pf[1] * v[3] * v[9]^(-1 + pf[1]) * v[11]^(1 - pf[1])
    r[3] = -v[3] + exp(pf[6] * log(v[3]))
    r[4] = -v[6] + v[13] * v[17]
    r[5] = -v[7] + pf[5] * v[8]
    r[6] = -v[9] + pf[5] * v[10]
    r[7] = -v[17] + v[3] * (1 - pf[1]) * v[9]^pf[1] * v[11]^(-pf[1])
    r[8] = -v[18] + v[3] * v[9]^pf[1] * v[11]^(1 - pf[1])
    r[9] = pf[2] * (pf[4] * v[2] * v[5]^-1 + pf[4] * v[5]^-1 * (1 - pf[3])) - pf[4] * v[5]^-1
    r[10] = -(1 - pf[4]) * (1 - v[12])^-1 + pf[4] * v[5]^-1 * v[17]
    r[11] = -(1 - pf[4]) * (1 - v[13])^-1 + pf[4] * v[6]^-1 * v[17]
    r[12] = -v[4] + pf[5] * v[5] + v[6] * (1 - pf[5])
    r[13] = v[8] - v[10] + v[10] * (1 - pf[3])
    r[14] = -v[11] + pf[5] * v[12] + v[13] * (1 - pf[5])
    r[15] = -v[1] + v[18] - v[2] * v[9] - v[11] * v[17]
    r[16] = -v[5] - v[8] + v[2] * v[10] + v[12] * v[17]
    r[17] = v[15] - pf[2] * v[15] - pf[4] * log(v[5]) - log(1 - v[12]) * (1 - pf[4])
    r[18] = v[16] - pf[2] * v[16] - pf[4] * log(v[6]) - log(1 - v[13]) * (1 - pf[4])

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
    jac <- numeric(56)
    jac[1] = -1
    jac[2] = 1
    jac[3] = -1
    jac[4] = pf[1] * v[9]^(-1 + pf[1]) * v[11]^(1 - pf[1])
    jac[5] = pf[1] * v[3] * (-1 + pf[1]) * v[9]^(-2 + pf[1]) * v[11]^(1 - pf[1])
    jac[6] = pf[1] * v[3] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[11]^(-pf[1])
    jac[7] = -1 + pf[6] * v[3]^-1 * exp(pf[6] * log(v[3]))
    jac[8] = -1
    jac[9] = v[17]
    jac[10] = v[13]
    jac[11] = -1
    jac[12] = pf[5]
    jac[13] = -1
    jac[14] = pf[5]
    jac[15] = (1 - pf[1]) * v[9]^pf[1] * v[11]^(-pf[1])
    jac[16] = pf[1] * v[3] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[11]^(-pf[1])
    jac[17] = -pf[1] * v[3] * (1 - pf[1]) * v[9]^pf[1] * v[11]^(-1 - pf[1])
    jac[18] = -1
    jac[19] = v[9]^pf[1] * v[11]^(1 - pf[1])
    jac[20] = pf[1] * v[3] * v[9]^(-1 + pf[1]) * v[11]^(1 - pf[1])
    jac[21] = v[3] * (1 - pf[1]) * v[9]^pf[1] * v[11]^(-pf[1])
    jac[22] = -1
    jac[23] = pf[2] * pf[4] * v[5]^-1
    jac[24] = pf[2] * (-pf[4] * v[2] * v[5]^-2 - pf[4] * v[5]^-2 * (1 - pf[3])) + pf[4] * v[5]^-2
    jac[25] = -pf[4] * v[5]^-2 * v[17]
    jac[26] = -(1 - pf[4]) * (1 - v[12])^-2
    jac[27] = pf[4] * v[5]^-1
    jac[28] = -pf[4] * v[6]^-2 * v[17]
    jac[29] = -(1 - pf[4]) * (1 - v[13])^-2
    jac[30] = pf[4] * v[6]^-1
    jac[31] = -1
    jac[32] = pf[5]
    jac[33] = 1 - pf[5]
    jac[34] = 1
    jac[35] = -pf[3]
    jac[36] = -1
    jac[37] = pf[5]
    jac[38] = 1 - pf[5]
    jac[39] = -1
    jac[40] = -v[9]
    jac[41] = -v[2]
    jac[42] = -v[17]
    jac[43] = -v[11]
    jac[44] = 1
    jac[45] = v[10]
    jac[46] = -1
    jac[47] = -1
    jac[48] = v[2]
    jac[49] = v[17]
    jac[50] = v[12]
    jac[51] = -pf[4] * v[5]^-1
    jac[52] = (1 - pf[4]) * (1 - v[12])^-1
    jac[53] = 1 - pf[2]
    jac[54] = -pf[4] * v[6]^-1
    jac[55] = (1 - pf[4]) * (1 - v[13])^-1
    jac[56] = 1 - pf[2]
    jacob <- sparseMatrix(i = c(1, 1, 2, 2, 2, 2, 3, 4, 4, 4,
                                5, 5, 6, 6, 7, 7, 7, 7, 8, 8,
                                8, 8, 9, 9, 10, 10, 10, 11, 11, 11,
                                12, 12, 12, 13, 13, 14, 14, 14, 15, 15,
                                15, 15, 15, 15, 16, 16, 16, 16, 16, 16,
                                17, 17, 17, 18, 18, 18),
                          j = c(1, 14, 2, 3, 9, 11, 3, 6, 13, 17,
                                7, 8, 9, 10, 3, 9, 11, 17, 3, 9,
                                11, 18, 2, 5, 5, 12, 17, 6, 13, 17,
                                4, 5, 6, 8, 10, 11, 12, 13, 1, 2,
                                9, 11, 17, 18, 2, 5, 8, 10, 12, 17,
                                5, 12, 15, 6, 13, 16),
                          x = jac, dims = c(18, 18))

    return(jacob)
}

# 1st order perturbation
pert1__ <- function(v, pc, pf)
{
    Atm1x <- numeric(7)
    Atm1x[1] = pf[1] * v[3] * (-1 + pf[1]) * v[9]^(-2 + pf[1]) * v[11]^(1 - pf[1])
    Atm1x[2] = pf[6] * v[3]^-1 * exp(pf[6] * log(v[3]))
    Atm1x[3] = pf[1] * v[3] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[11]^(-pf[1])
    Atm1x[4] = pf[1] * v[3] * v[9]^(-1 + pf[1]) * v[11]^(1 - pf[1])
    Atm1x[5] = 1 - pf[3]
    Atm1x[6] = -v[2]
    Atm1x[7] = v[2]
    Atm1 <- sparseMatrix(i = c(2, 3, 7, 8, 13, 15, 16),
                         j = c(9, 3, 9, 9, 10, 9, 10),
                         x = Atm1x, dims = c(18, 18))

    Atx <- numeric(50)
    Atx[1] = -1
    Atx[2] = 1
    Atx[3] = -1
    Atx[4] = pf[1] * v[9]^(-1 + pf[1]) * v[11]^(1 - pf[1])
    Atx[5] = pf[1] * v[3] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[11]^(-pf[1])
    Atx[6] = -1
    Atx[7] = -1
    Atx[8] = v[17]
    Atx[9] = v[13]
    Atx[10] = -1
    Atx[11] = pf[5]
    Atx[12] = -1
    Atx[13] = pf[5]
    Atx[14] = (1 - pf[1]) * v[9]^pf[1] * v[11]^(-pf[1])
    Atx[15] = -pf[1] * v[3] * (1 - pf[1]) * v[9]^pf[1] * v[11]^(-1 - pf[1])
    Atx[16] = -1
    Atx[17] = v[9]^pf[1] * v[11]^(1 - pf[1])
    Atx[18] = v[3] * (1 - pf[1]) * v[9]^pf[1] * v[11]^(-pf[1])
    Atx[19] = -1
    Atx[20] = pf[4] * v[5]^-2
    Atx[21] = -pf[4] * v[5]^-2 * v[17]
    Atx[22] = (-1 + pf[4]) * (1 - v[12])^-2
    Atx[23] = pf[4] * v[5]^-1
    Atx[24] = -pf[4] * v[6]^-2 * v[17]
    Atx[25] = (-1 + pf[4]) * (1 - v[13])^-2
    Atx[26] = pf[4] * v[6]^-1
    Atx[27] = -1
    Atx[28] = pf[5]
    Atx[29] = 1 - pf[5]
    Atx[30] = 1
    Atx[31] = -1
    Atx[32] = -1
    Atx[33] = pf[5]
    Atx[34] = 1 - pf[5]
    Atx[35] = -1
    Atx[36] = -v[9]
    Atx[37] = -v[17]
    Atx[38] = -v[11]
    Atx[39] = 1
    Atx[40] = v[10]
    Atx[41] = -1
    Atx[42] = -1
    Atx[43] = v[17]
    Atx[44] = v[12]
    Atx[45] = -pf[4] * v[5]^-1
    Atx[46] = (1 - pf[4]) * (1 - v[12])^-1
    Atx[47] = 1
    Atx[48] = -pf[4] * v[6]^-1
    Atx[49] = (1 - pf[4]) * (1 - v[13])^-1
    Atx[50] = 1
    At <- sparseMatrix(i = c(1, 1, 2, 2, 2, 3, 4, 4, 4, 5,
                             5, 6, 6, 7, 7, 7, 8, 8, 8, 9,
                             10, 10, 10, 11, 11, 11, 12, 12, 12, 13,
                             13, 14, 14, 14, 15, 15, 15, 15, 15, 16,
                             16, 16, 16, 16, 17, 17, 17, 18, 18, 18),
                       j = c(1, 14, 2, 3, 11, 3, 6, 13, 17, 7,
                             8, 9, 10, 3, 11, 17, 3, 11, 18, 5,
                             5, 12, 17, 6, 13, 17, 4, 5, 6, 8,
                             10, 11, 12, 13, 1, 2, 11, 17, 18, 2,
                             5, 8, 12, 17, 5, 12, 15, 6, 13, 16),
                         x = Atx, dims = c(18, 18))

    Atp1x <- numeric(4)
    Atp1x[1] = pf[2] * pf[4] * v[5]^-1
    Atp1x[2] = pf[2] * (-pf[4] * v[2] * v[5]^-2 - pf[4] * v[5]^-2 * (1 - pf[3]))
    Atp1x[3] = -pf[2]
    Atp1x[4] = -pf[2]
    Atp1 <- sparseMatrix(i = c(9, 9, 17, 18),
                         j = c(2, 5, 15, 16),
                         x = Atp1x, dims = c(18, 18))

    Aepsx <- numeric(1)
    Aepsx[1] = exp(pf[6] * log(v[3]))
    Aeps <- sparseMatrix(i = c(3),
                         j = c(1),
                         x = Aepsx, dims = c(18, 1))

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
