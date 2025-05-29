# Generated on 2025-05-29 16:54:22 by gEcon ver. 1.2.3 (2025-04-13)
# http://gecon.r-forge.r-project.org/

# Model name: hf_chapter3

# info
info__ <- c("hf_chapter3", "/Users/fabianfuentes/Library/CloudStorage/OneDrive-InstitutoTecnologicoydeEstudiosSuperioresdeMonterrey/2025/T_abr_jun/Macro/DSGE/HabitFormation/hf_chapter3.gcn", "2025-05-29 16:54:22", "false")

# index sets
index_sets__ <- list()

# variables
variables__ <- c("lambda__CONSUMER_2",
                 "pi",
                 "r",
                 "A",
                 "C",
                 "I",
                 "K_s",
                 "L_s",
                 "PI",
                 "U",
                 "W",
                 "Y")

variables_tex__ <- c("\\lambda^{\\mathrm{CONSUMER}^{\\mathrm{2}}}",
                     "\\pi",
                     "r",
                     "A",
                     "C",
                     "I",
                     "K^{\\mathrm{s}}",
                     "L^{\\mathrm{s}}",
                     "\\Pi",
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
                  "phi",
                  "rho")

parameters_tex__ <- c("\\alpha",
                     "\\beta",
                     "\\delta",
                     "\\gamma",
                     "\\phi",
                     "\\rho")

# free parameters
parameters_free__ <- c("alpha",
                       "beta",
                       "delta",
                       "gamma",
                       "phi",
                       "rho")

# free parameters' values
parameters_free_val__ <- c(0.35,
                           0.97,
                           0.06,
                           0.4,
                           0.8,
                           0.95)

# equations
equations__ <- c("-lambda__CONSUMER_2[] + beta * ((1 - delta) * E[][lambda__CONSUMER_2[1]] + E[][lambda__CONSUMER_2[1] * r[1]]) = 0",
                 "-pi[] + PI[] = 0",
                 "-r[] + alpha * A[] * K_s[-1]^(-1 + alpha) * L_s[]^(1 - alpha) = 0",
                 "-A[] + exp(epsilon_A[] + rho * log(A[-1])) = 0",
                 "-W[] + A[] * (1 - alpha) * K_s[-1]^alpha * L_s[]^(-alpha) = 0",
                 "-Y[] + A[] * K_s[-1]^alpha * L_s[]^(1 - alpha) = 0",
                 "lambda__CONSUMER_2[] * W[] - (1 - gamma) * (1 - L_s[])^-1 = 0",
                 "-lambda__CONSUMER_2[] + gamma * (C[] - phi * C[-1])^-1 - beta * gamma * phi * E[][(C[1] - phi * C[])^-1] = 0",
                 "I[] - K_s[] + K_s[-1] * (1 - delta) = 0",
                 "-pi[] + Y[] - K_s[-1] * r[] - L_s[] * W[] = 0",
                 "U[] - beta * E[][U[1]] - gamma * log(C[] - phi * C[-1]) - log(1 - L_s[]) * (1 - gamma) = 0",
                 "pi[] - C[] - I[] + K_s[-1] * r[] + L_s[] * W[] = 0")

# calibrating equations
calibr_equations__ <- character(0)

# variables / equations map
vareqmap__ <- sparseMatrix(i = c(1, 1, 2, 2, 3, 3, 3, 3, 4, 5,
                                 5, 5, 5, 6, 6, 6, 6, 7, 7, 7,
                                 8, 8, 9, 9, 10, 10, 10, 10, 10, 10,
                                 11, 11, 11, 12, 12, 12, 12, 12, 12, 12),
                           j = c(1, 3, 2, 9, 3, 4, 7, 8, 4, 4,
                                 7, 8, 11, 4, 7, 8, 12, 1, 8, 11,
                                 1, 5, 6, 7, 2, 3, 7, 8, 11, 12,
                                 5, 8, 10, 2, 3, 5, 6, 7, 8, 11),
                           x = c(6, 4, 2, 2, 2, 2, 1, 2, 3, 2,
                                 1, 2, 2, 2, 1, 2, 2, 2, 2, 2,
                                 2, 7, 2, 3, 2, 2, 1, 2, 2, 2,
                                 3, 2, 6, 2, 2, 2, 2, 1, 2, 2),
                           dims = c(12, 12))

# variables / calibrating equations map
varcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 12))

# calibrated parameters / equations map
calibrpareqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(12, 0))

# calibrated parameters / calibrating equations map
calibrparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 0))

# free parameters / equations map
freepareqmap__ <- sparseMatrix(i = c(1, 1, 3, 4, 5, 6, 7, 8, 8, 8,
                                     9, 11, 11, 11),
                               j = c(2, 3, 1, 6, 1, 1, 4, 2, 4, 5,
                                     3, 2, 4, 5),
                               x = rep(1, 14), dims = c(12, 6))

# free parameters / calibrating equations map
freeparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 6))

# shocks / equations map
shockeqmap__ <- sparseMatrix(i = c(4),
                             j = c(1),
                             x = rep(1, 1), dims = c(12, 1))

# steady state equations
ss_eq__ <- function(v, pc, pf)
{
    r <- numeric(12)
    r[1] = -v[1] + pf[2] * (v[1] * v[3] + v[1] * (1 - pf[3]))
    r[2] = -v[2] + v[9]
    r[3] = -v[3] + pf[1] * v[4] * v[7]^(-1 + pf[1]) * v[8]^(1 - pf[1])
    r[4] = -v[4] + exp(pf[6] * log(v[4]))
    r[5] = -v[11] + v[4] * (1 - pf[1]) * v[7]^pf[1] * v[8]^(-pf[1])
    r[6] = -v[12] + v[4] * v[7]^pf[1] * v[8]^(1 - pf[1])
    r[7] = v[1] * v[11] - (1 - pf[4]) * (1 - v[8])^-1
    r[8] = -v[1] + pf[4] * (v[5] - pf[5] * v[5])^-1 - pf[2] * pf[4] * pf[5] * (v[5] - pf[5] * v[5])^-1
    r[9] = v[6] - v[7] + v[7] * (1 - pf[3])
    r[10] = -v[2] + v[12] - v[3] * v[7] - v[8] * v[11]
    r[11] = v[10] - pf[2] * v[10] - pf[4] * log(v[5] - pf[5] * v[5]) - log(1 - v[8]) * (1 - pf[4])
    r[12] = v[2] - v[5] - v[6] + v[3] * v[7] + v[8] * v[11]

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
    jac <- numeric(40)
    jac[1] = -1 + pf[2] * (1 - pf[3] + v[3])
    jac[2] = pf[2] * v[1]
    jac[3] = -1
    jac[4] = 1
    jac[5] = -1
    jac[6] = pf[1] * v[7]^(-1 + pf[1]) * v[8]^(1 - pf[1])
    jac[7] = pf[1] * v[4] * (-1 + pf[1]) * v[7]^(-2 + pf[1]) * v[8]^(1 - pf[1])
    jac[8] = pf[1] * v[4] * (1 - pf[1]) * v[7]^(-1 + pf[1]) * v[8]^(-pf[1])
    jac[9] = -1 + pf[6] * v[4]^-1 * exp(pf[6] * log(v[4]))
    jac[10] = (1 - pf[1]) * v[7]^pf[1] * v[8]^(-pf[1])
    jac[11] = pf[1] * v[4] * (1 - pf[1]) * v[7]^(-1 + pf[1]) * v[8]^(-pf[1])
    jac[12] = -pf[1] * v[4] * (1 - pf[1]) * v[7]^pf[1] * v[8]^(-1 - pf[1])
    jac[13] = -1
    jac[14] = v[7]^pf[1] * v[8]^(1 - pf[1])
    jac[15] = pf[1] * v[4] * v[7]^(-1 + pf[1]) * v[8]^(1 - pf[1])
    jac[16] = v[4] * (1 - pf[1]) * v[7]^pf[1] * v[8]^(-pf[1])
    jac[17] = -1
    jac[18] = v[11]
    jac[19] = -(1 - pf[4]) * (1 - v[8])^-2
    jac[20] = v[1]
    jac[21] = -1
    jac[22] = pf[4] * (-1 + pf[5]) * (v[5] - pf[5] * v[5])^-2 - pf[2] * pf[4] * pf[5] * (-1 + pf[5]) * (v[5] - pf[5] * v[5])^-2
    jac[23] = 1
    jac[24] = -pf[3]
    jac[25] = -1
    jac[26] = -v[7]
    jac[27] = -v[3]
    jac[28] = -v[11]
    jac[29] = -v[8]
    jac[30] = 1
    jac[31] = -pf[4] * (1 - pf[5]) * (v[5] - pf[5] * v[5])^-1
    jac[32] = (1 - pf[4]) * (1 - v[8])^-1
    jac[33] = 1 - pf[2]
    jac[34] = 1
    jac[35] = v[7]
    jac[36] = -1
    jac[37] = -1
    jac[38] = v[3]
    jac[39] = v[11]
    jac[40] = v[8]
    jacob <- sparseMatrix(i = c(1, 1, 2, 2, 3, 3, 3, 3, 4, 5,
                                5, 5, 5, 6, 6, 6, 6, 7, 7, 7,
                                8, 8, 9, 9, 10, 10, 10, 10, 10, 10,
                                11, 11, 11, 12, 12, 12, 12, 12, 12, 12),
                          j = c(1, 3, 2, 9, 3, 4, 7, 8, 4, 4,
                                7, 8, 11, 4, 7, 8, 12, 1, 8, 11,
                                1, 5, 6, 7, 2, 3, 7, 8, 11, 12,
                                5, 8, 10, 2, 3, 5, 6, 7, 8, 11),
                          x = jac, dims = c(12, 12))

    return(jacob)
}

# 1st order perturbation
pert1__ <- function(v, pc, pf)
{
    Atm1x <- numeric(9)
    Atm1x[1] = pf[1] * v[4] * (-1 + pf[1]) * v[7]^(-2 + pf[1]) * v[8]^(1 - pf[1])
    Atm1x[2] = pf[6] * v[4]^-1 * exp(pf[6] * log(v[4]))
    Atm1x[3] = pf[1] * v[4] * (1 - pf[1]) * v[7]^(-1 + pf[1]) * v[8]^(-pf[1])
    Atm1x[4] = pf[1] * v[4] * v[7]^(-1 + pf[1]) * v[8]^(1 - pf[1])
    Atm1x[5] = pf[4] * pf[5] * (v[5] - pf[5] * v[5])^-2
    Atm1x[6] = 1 - pf[3]
    Atm1x[7] = -v[3]
    Atm1x[8] = pf[4] * pf[5] * (v[5] - pf[5] * v[5])^-1
    Atm1x[9] = v[3]
    Atm1 <- sparseMatrix(i = c(3, 4, 5, 6, 8, 9, 10, 11, 12),
                         j = c(7, 4, 7, 7, 5, 7, 7, 5, 7),
                         x = Atm1x, dims = c(12, 12))

    Atx <- numeric(34)
    Atx[1] = -1
    Atx[2] = -1
    Atx[3] = 1
    Atx[4] = -1
    Atx[5] = pf[1] * v[7]^(-1 + pf[1]) * v[8]^(1 - pf[1])
    Atx[6] = pf[1] * v[4] * (1 - pf[1]) * v[7]^(-1 + pf[1]) * v[8]^(-pf[1])
    Atx[7] = -1
    Atx[8] = (1 - pf[1]) * v[7]^pf[1] * v[8]^(-pf[1])
    Atx[9] = -pf[1] * v[4] * (1 - pf[1]) * v[7]^pf[1] * v[8]^(-1 - pf[1])
    Atx[10] = -1
    Atx[11] = v[7]^pf[1] * v[8]^(1 - pf[1])
    Atx[12] = v[4] * (1 - pf[1]) * v[7]^pf[1] * v[8]^(-pf[1])
    Atx[13] = -1
    Atx[14] = v[11]
    Atx[15] = (-1 + pf[4]) * (1 - v[8])^-2
    Atx[16] = v[1]
    Atx[17] = -1
    Atx[18] = -pf[4] * (v[5] - pf[5] * v[5])^-2 - pf[2] * pf[4] * pf[5]^2 * (v[5] - pf[5] * v[5])^-2
    Atx[19] = 1
    Atx[20] = -1
    Atx[21] = -1
    Atx[22] = -v[7]
    Atx[23] = -v[11]
    Atx[24] = -v[8]
    Atx[25] = 1
    Atx[26] = -pf[4] * (v[5] - pf[5] * v[5])^-1
    Atx[27] = (1 - pf[4]) * (1 - v[8])^-1
    Atx[28] = 1
    Atx[29] = 1
    Atx[30] = v[7]
    Atx[31] = -1
    Atx[32] = -1
    Atx[33] = v[11]
    Atx[34] = v[8]
    At <- sparseMatrix(i = c(1, 2, 2, 3, 3, 3, 4, 5, 5, 5,
                             6, 6, 6, 7, 7, 7, 8, 8, 9, 9,
                             10, 10, 10, 10, 10, 11, 11, 11, 12, 12,
                             12, 12, 12, 12),
                       j = c(1, 2, 9, 3, 4, 8, 4, 4, 8, 11,
                             4, 8, 12, 1, 8, 11, 1, 5, 6, 7,
                             2, 3, 8, 11, 12, 5, 8, 10, 2, 3,
                             5, 6, 8, 11),
                         x = Atx, dims = c(12, 12))

    Atp1x <- numeric(4)
    Atp1x[1] = pf[2] * (1 - pf[3] + v[3])
    Atp1x[2] = pf[2] * v[1]
    Atp1x[3] = pf[2] * pf[4] * pf[5] * (v[5] - pf[5] * v[5])^-2
    Atp1x[4] = -pf[2]
    Atp1 <- sparseMatrix(i = c(1, 1, 8, 11),
                         j = c(1, 3, 5, 10),
                         x = Atp1x, dims = c(12, 12))

    Aepsx <- numeric(1)
    Aepsx[1] = exp(pf[6] * log(v[4]))
    Aeps <- sparseMatrix(i = c(4),
                         j = c(1),
                         x = Aepsx, dims = c(12, 1))

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
