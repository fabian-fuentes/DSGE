# Generated on 2025-05-29 16:56:51 by gEcon ver. 1.2.3 (2025-04-13)
# http://gecon.r-forge.r-project.org/

# Model name: Taxes_chapter7

# info
info__ <- c("Taxes_chapter7", "/Users/fabianfuentes/Library/CloudStorage/OneDrive-InstitutoTecnologicoydeEstudiosSuperioresdeMonterrey/2025/T_abr_jun/Macro/DSGE/NonRicardianAgents/Taxes_chapter7.gcn", "2025-05-29 16:56:51", "false")

# index sets
index_sets__ <- list()

# variables
variables__ <- c("lambda_c",
                 "pi",
                 "r",
                 "A",
                 "C",
                 "G_inc",
                 "GT",
                 "I",
                 "K_s",
                 "L_s",
                 "PI",
                 "T_c",
                 "T_l",
                 "T_k",
                 "U",
                 "W",
                 "Y")

variables_tex__ <- c("\\lambda^{\\mathrm{c}}",
                     "\\pi",
                     "r",
                     "A",
                     "C",
                     "G^{\\mathrm{inc}}",
                     "{G\\!T}",
                     "I",
                     "K^{\\mathrm{s}}",
                     "L^{\\mathrm{s}}",
                     "\\Pi",
                     "T^{\\mathrm{c}}",
                     "T^{\\mathrm{l}}",
                     "T^{\\mathrm{k}}",
                     "U",
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
                  "rho",
                  "tau_c",
                  "tau_k",
                  "tau_l")

parameters_tex__ <- c("\\alpha",
                     "\\beta",
                     "\\delta",
                     "\\gamma",
                     "\\rho",
                     "\\tau^{\\mathrm{c}}",
                     "\\tau^{\\mathrm{k}}",
                     "\\tau^{\\mathrm{l}}")

# free parameters
parameters_free__ <- c("alpha",
                       "beta",
                       "delta",
                       "gamma",
                       "rho",
                       "tau_c",
                       "tau_k",
                       "tau_l")

# free parameters' values
parameters_free_val__ <- c(0.35,
                           0.97,
                           0.06,
                           0.4,
                           0.95,
                           0.116,
                           0.225,
                           0.348)

# equations
equations__ <- c("-lambda_c[] + beta * ((1 - delta) * E[][lambda_c[1]] + (1 - tau_k) * E[][lambda_c[1] * r[1]]) = 0",
                 "-pi[] + PI[] = 0",
                 "-r[] + alpha * A[] * K_s[-1]^(-1 + alpha) * L_s[]^(1 - alpha) = 0",
                 "-A[] + exp(epsilon_A[] + rho * log(A[-1])) = 0",
                 "G_inc[] - GT[] = 0",
                 "-T_c[] + tau_c * C[] = 0",
                 "-T_l[] + tau_l * L_s[] * W[] = 0",
                 "-T_k[] + tau_k * K_s[-1] * (-delta + r[]) = 0",
                 "-W[] + A[] * (1 - alpha) * K_s[-1]^alpha * L_s[]^(-alpha) = 0",
                 "-Y[] + A[] * K_s[-1]^alpha * L_s[]^(1 - alpha) = 0",
                 "gamma * C[]^-1 + lambda_c[] * (-1 - tau_c) = 0",
                 "-(1 - gamma) * (1 - L_s[])^-1 + lambda_c[] * W[] * (1 - tau_l) = 0",
                 "I[] - K_s[] + K_s[-1] * (1 - delta) = 0",
                 "-pi[] + Y[] - K_s[-1] * r[] - L_s[] * W[] = 0",
                 "-G_inc[] + T_c[] + T_l[] + T_k[] = 0",
                 "U[] - beta * E[][U[1]] - gamma * log(C[]) - log(1 - L_s[]) * (1 - gamma) = 0",
                 "pi[] + GT[] - I[] - C[] * (1 + tau_c) + K_s[-1] * r[] * (1 - tau_k) + L_s[] * W[] * (1 - tau_l) = 0")

# calibrating equations
calibr_equations__ <- character(0)

# variables / equations map
vareqmap__ <- sparseMatrix(i = c(1, 1, 2, 2, 3, 3, 3, 3, 4, 5,
                                 5, 6, 6, 7, 7, 7, 8, 8, 8, 9,
                                 9, 9, 9, 10, 10, 10, 10, 11, 11, 12,
                                 12, 12, 13, 13, 14, 14, 14, 14, 14, 14,
                                 15, 15, 15, 15, 16, 16, 16, 17, 17, 17,
                                 17, 17, 17, 17, 17),
                           j = c(1, 3, 2, 11, 3, 4, 9, 10, 4, 6,
                                 7, 5, 12, 10, 13, 16, 3, 9, 14, 4,
                                 9, 10, 16, 4, 9, 10, 17, 1, 5, 1,
                                 10, 16, 8, 9, 2, 3, 9, 10, 16, 17,
                                 6, 12, 13, 14, 5, 10, 15, 2, 3, 5,
                                 7, 8, 9, 10, 16),
                           x = c(6, 4, 2, 2, 2, 2, 1, 2, 3, 2,
                                 2, 2, 2, 2, 2, 2, 2, 1, 2, 2,
                                 1, 2, 2, 2, 1, 2, 2, 2, 2, 2,
                                 2, 2, 2, 3, 2, 2, 1, 2, 2, 2,
                                 2, 2, 2, 2, 2, 2, 6, 2, 2, 2,
                                 2, 2, 1, 2, 2),
                           dims = c(17, 17))

# variables / calibrating equations map
varcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 17))

# calibrated parameters / equations map
calibrpareqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(17, 0))

# calibrated parameters / calibrating equations map
calibrparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 0))

# free parameters / equations map
freepareqmap__ <- sparseMatrix(i = c(1, 1, 1, 3, 4, 6, 7, 8, 8, 9,
                                     10, 11, 11, 12, 12, 13, 16, 16, 17, 17,
                                     17),
                               j = c(2, 3, 7, 1, 5, 6, 8, 3, 7, 1,
                                     1, 4, 6, 4, 8, 3, 2, 4, 6, 7,
                                     8),
                               x = rep(1, 21), dims = c(17, 8))

# free parameters / calibrating equations map
freeparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 8))

# shocks / equations map
shockeqmap__ <- sparseMatrix(i = c(4),
                             j = c(1),
                             x = rep(1, 1), dims = c(17, 1))

# steady state equations
ss_eq__ <- function(v, pc, pf)
{
    r <- numeric(17)
    r[1] = -v[1] + pf[2] * (v[1] * (1 - pf[3]) + v[1] * v[3] * (1 - pf[7]))
    r[2] = -v[2] + v[11]
    r[3] = -v[3] + pf[1] * v[4] * v[9]^(-1 + pf[1]) * v[10]^(1 - pf[1])
    r[4] = -v[4] + exp(pf[5] * log(v[4]))
    r[5] = v[6] - v[7]
    r[6] = -v[12] + pf[6] * v[5]
    r[7] = -v[13] + pf[8] * v[10] * v[16]
    r[8] = -v[14] + pf[7] * v[9] * (-pf[3] + v[3])
    r[9] = -v[16] + v[4] * (1 - pf[1]) * v[9]^pf[1] * v[10]^(-pf[1])
    r[10] = -v[17] + v[4] * v[9]^pf[1] * v[10]^(1 - pf[1])
    r[11] = pf[4] * v[5]^-1 + v[1] * (-1 - pf[6])
    r[12] = -(1 - pf[4]) * (1 - v[10])^-1 + v[1] * v[16] * (1 - pf[8])
    r[13] = v[8] - v[9] + v[9] * (1 - pf[3])
    r[14] = -v[2] + v[17] - v[3] * v[9] - v[10] * v[16]
    r[15] = -v[6] + v[12] + v[13] + v[14]
    r[16] = v[15] - pf[2] * v[15] - pf[4] * log(v[5]) - log(1 - v[10]) * (1 - pf[4])
    r[17] = v[2] + v[7] - v[8] - v[5] * (1 + pf[6]) + v[3] * v[9] * (1 - pf[7]) + v[10] * v[16] * (1 - pf[8])

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
    jac <- numeric(55)
    jac[1] = -1 + pf[2] * (1 - pf[3] + v[3] * (1 - pf[7]))
    jac[2] = pf[2] * v[1] * (1 - pf[7])
    jac[3] = -1
    jac[4] = 1
    jac[5] = -1
    jac[6] = pf[1] * v[9]^(-1 + pf[1]) * v[10]^(1 - pf[1])
    jac[7] = pf[1] * v[4] * (-1 + pf[1]) * v[9]^(-2 + pf[1]) * v[10]^(1 - pf[1])
    jac[8] = pf[1] * v[4] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[10]^(-pf[1])
    jac[9] = -1 + pf[5] * v[4]^-1 * exp(pf[5] * log(v[4]))
    jac[10] = 1
    jac[11] = -1
    jac[12] = pf[6]
    jac[13] = -1
    jac[14] = pf[8] * v[16]
    jac[15] = -1
    jac[16] = pf[8] * v[10]
    jac[17] = pf[7] * v[9]
    jac[18] = pf[7] * (-pf[3] + v[3])
    jac[19] = -1
    jac[20] = (1 - pf[1]) * v[9]^pf[1] * v[10]^(-pf[1])
    jac[21] = pf[1] * v[4] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[10]^(-pf[1])
    jac[22] = -pf[1] * v[4] * (1 - pf[1]) * v[9]^pf[1] * v[10]^(-1 - pf[1])
    jac[23] = -1
    jac[24] = v[9]^pf[1] * v[10]^(1 - pf[1])
    jac[25] = pf[1] * v[4] * v[9]^(-1 + pf[1]) * v[10]^(1 - pf[1])
    jac[26] = v[4] * (1 - pf[1]) * v[9]^pf[1] * v[10]^(-pf[1])
    jac[27] = -1
    jac[28] = -1 - pf[6]
    jac[29] = -pf[4] * v[5]^-2
    jac[30] = v[16] * (1 - pf[8])
    jac[31] = -(1 - pf[4]) * (1 - v[10])^-2
    jac[32] = v[1] * (1 - pf[8])
    jac[33] = 1
    jac[34] = -pf[3]
    jac[35] = -1
    jac[36] = -v[9]
    jac[37] = -v[3]
    jac[38] = -v[16]
    jac[39] = -v[10]
    jac[40] = 1
    jac[41] = -1
    jac[42] = 1
    jac[43] = 1
    jac[44] = 1
    jac[45] = -pf[4] * v[5]^-1
    jac[46] = (1 - pf[4]) * (1 - v[10])^-1
    jac[47] = 1 - pf[2]
    jac[48] = 1
    jac[49] = v[9] * (1 - pf[7])
    jac[50] = -1 - pf[6]
    jac[51] = 1
    jac[52] = -1
    jac[53] = v[3] * (1 - pf[7])
    jac[54] = v[16] * (1 - pf[8])
    jac[55] = v[10] * (1 - pf[8])
    jacob <- sparseMatrix(i = c(1, 1, 2, 2, 3, 3, 3, 3, 4, 5,
                                5, 6, 6, 7, 7, 7, 8, 8, 8, 9,
                                9, 9, 9, 10, 10, 10, 10, 11, 11, 12,
                                12, 12, 13, 13, 14, 14, 14, 14, 14, 14,
                                15, 15, 15, 15, 16, 16, 16, 17, 17, 17,
                                17, 17, 17, 17, 17),
                          j = c(1, 3, 2, 11, 3, 4, 9, 10, 4, 6,
                                7, 5, 12, 10, 13, 16, 3, 9, 14, 4,
                                9, 10, 16, 4, 9, 10, 17, 1, 5, 1,
                                10, 16, 8, 9, 2, 3, 9, 10, 16, 17,
                                6, 12, 13, 14, 5, 10, 15, 2, 3, 5,
                                7, 8, 9, 10, 16),
                          x = jac, dims = c(17, 17))

    return(jacob)
}

# 1st order perturbation
pert1__ <- function(v, pc, pf)
{
    Atm1x <- numeric(8)
    Atm1x[1] = pf[1] * v[4] * (-1 + pf[1]) * v[9]^(-2 + pf[1]) * v[10]^(1 - pf[1])
    Atm1x[2] = pf[5] * v[4]^-1 * exp(pf[5] * log(v[4]))
    Atm1x[3] = pf[7] * (-pf[3] + v[3])
    Atm1x[4] = pf[1] * v[4] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[10]^(-pf[1])
    Atm1x[5] = pf[1] * v[4] * v[9]^(-1 + pf[1]) * v[10]^(1 - pf[1])
    Atm1x[6] = 1 - pf[3]
    Atm1x[7] = -v[3]
    Atm1x[8] = v[3] * (1 - pf[7])
    Atm1 <- sparseMatrix(i = c(3, 4, 8, 9, 10, 13, 14, 17),
                         j = c(9, 4, 9, 9, 9, 9, 9, 9),
                         x = Atm1x, dims = c(17, 17))

    Atx <- numeric(48)
    Atx[1] = -1
    Atx[2] = -1
    Atx[3] = 1
    Atx[4] = -1
    Atx[5] = pf[1] * v[9]^(-1 + pf[1]) * v[10]^(1 - pf[1])
    Atx[6] = pf[1] * v[4] * (1 - pf[1]) * v[9]^(-1 + pf[1]) * v[10]^(-pf[1])
    Atx[7] = -1
    Atx[8] = 1
    Atx[9] = -1
    Atx[10] = pf[6]
    Atx[11] = -1
    Atx[12] = pf[8] * v[16]
    Atx[13] = -1
    Atx[14] = pf[8] * v[10]
    Atx[15] = pf[7] * v[9]
    Atx[16] = -1
    Atx[17] = (1 - pf[1]) * v[9]^pf[1] * v[10]^(-pf[1])
    Atx[18] = -pf[1] * v[4] * (1 - pf[1]) * v[9]^pf[1] * v[10]^(-1 - pf[1])
    Atx[19] = -1
    Atx[20] = v[9]^pf[1] * v[10]^(1 - pf[1])
    Atx[21] = v[4] * (1 - pf[1]) * v[9]^pf[1] * v[10]^(-pf[1])
    Atx[22] = -1
    Atx[23] = -1 - pf[6]
    Atx[24] = -pf[4] * v[5]^-2
    Atx[25] = v[16] * (1 - pf[8])
    Atx[26] = (-1 + pf[4]) * (1 - v[10])^-2
    Atx[27] = v[1] * (1 - pf[8])
    Atx[28] = 1
    Atx[29] = -1
    Atx[30] = -1
    Atx[31] = -v[9]
    Atx[32] = -v[16]
    Atx[33] = -v[10]
    Atx[34] = 1
    Atx[35] = -1
    Atx[36] = 1
    Atx[37] = 1
    Atx[38] = 1
    Atx[39] = -pf[4] * v[5]^-1
    Atx[40] = (1 - pf[4]) * (1 - v[10])^-1
    Atx[41] = 1
    Atx[42] = 1
    Atx[43] = v[9] * (1 - pf[7])
    Atx[44] = -1 - pf[6]
    Atx[45] = 1
    Atx[46] = -1
    Atx[47] = v[16] * (1 - pf[8])
    Atx[48] = v[10] * (1 - pf[8])
    At <- sparseMatrix(i = c(1, 2, 2, 3, 3, 3, 4, 5, 5, 6,
                             6, 7, 7, 7, 8, 8, 9, 9, 9, 10,
                             10, 10, 11, 11, 12, 12, 12, 13, 13, 14,
                             14, 14, 14, 14, 15, 15, 15, 15, 16, 16,
                             16, 17, 17, 17, 17, 17, 17, 17),
                       j = c(1, 2, 11, 3, 4, 10, 4, 6, 7, 5,
                             12, 10, 13, 16, 3, 14, 4, 10, 16, 4,
                             10, 17, 1, 5, 1, 10, 16, 8, 9, 2,
                             3, 10, 16, 17, 6, 12, 13, 14, 5, 10,
                             15, 2, 3, 5, 7, 8, 10, 16),
                         x = Atx, dims = c(17, 17))

    Atp1x <- numeric(3)
    Atp1x[1] = pf[2] * (1 - pf[3] + v[3] * (1 - pf[7]))
    Atp1x[2] = pf[2] * v[1] * (1 - pf[7])
    Atp1x[3] = -pf[2]
    Atp1 <- sparseMatrix(i = c(1, 1, 16),
                         j = c(1, 3, 15),
                         x = Atp1x, dims = c(17, 17))

    Aepsx <- numeric(1)
    Aepsx[1] = exp(pf[5] * log(v[4]))
    Aeps <- sparseMatrix(i = c(4),
                         j = c(1),
                         x = Aepsx, dims = c(17, 1))

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
