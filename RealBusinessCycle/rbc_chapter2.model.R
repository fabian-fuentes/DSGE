# Generated on 2025-05-17 08:30:49 by gEcon ver. 1.2.3 (2025-04-13)
# http://gecon.r-forge.r-project.org/

# Model name: rbc_chapter2

# info
info__ <- c("rbc_chapter2", "C:/Users/fuent/Desktop/DSGE/RealBusinessCycle/rbc_chapter2.gcn", "2025-05-17 08:30:49", "false")

# index sets
index_sets__ <- list()

# variables
variables__ <- c("pi",
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

variables_tex__ <- c("\\pi",
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
                  "rho")

parameters_tex__ <- c("\\alpha",
                     "\\beta",
                     "\\delta",
                     "\\gamma",
                     "\\rho")

# free parameters
parameters_free__ <- c("alpha",
                       "beta",
                       "delta",
                       "gamma",
                       "rho")

# free parameters' values
parameters_free_val__ <- c(0.35,
                           0.97,
                           0.06,
                           0.4,
                           0.95)

# equations
equations__ <- c("-pi[] + PI[] = 0",
                 "-r[] + alpha * A[] * K_s[-1]^(-1 + alpha) * L_s[]^(1 - alpha) = 0",
                 "-A[] + exp(epsilon_A[] + rho * log(A[-1])) = 0",
                 "-W[] + A[] * (1 - alpha) * K_s[-1]^alpha * L_s[]^(-alpha) = 0",
                 "-Y[] + A[] * K_s[-1]^alpha * L_s[]^(1 - alpha) = 0",
                 "beta * (gamma * E[][r[1] * C[1]^-1] + gamma * (1 - delta) * E[][C[1]^-1]) - gamma * C[]^-1 = 0",
                 "-(1 - gamma) * (1 - L_s[])^-1 + gamma * C[]^-1 * W[] = 0",
                 "I[] - K_s[] + K_s[-1] * (1 - delta) = 0",
                 "-pi[] + Y[] - K_s[-1] * r[] - L_s[] * W[] = 0",
                 "U[] - beta * E[][U[1]] - gamma * log(C[]) - log(1 - L_s[]) * (1 - gamma) = 0",
                 "pi[] - C[] - I[] + K_s[-1] * r[] + L_s[] * W[] = 0")

# calibrating equations
calibr_equations__ <- character(0)

# variables / equations map
vareqmap__ <- sparseMatrix(i = c(1, 1, 2, 2, 2, 2, 3, 4, 4, 4,
                                 4, 5, 5, 5, 5, 6, 6, 7, 7, 7,
                                 8, 8, 9, 9, 9, 9, 9, 9, 10, 10,
                                 10, 11, 11, 11, 11, 11, 11, 11),
                           j = c(1, 8, 2, 3, 6, 7, 3, 3, 6, 7,
                                 10, 3, 6, 7, 11, 2, 4, 4, 7, 10,
                                 5, 6, 1, 2, 6, 7, 10, 11, 4, 7,
                                 9, 1, 2, 4, 5, 6, 7, 10),
                           x = c(2, 2, 2, 2, 1, 2, 3, 2, 1, 2,
                                 2, 2, 1, 2, 2, 4, 6, 2, 2, 2,
                                 2, 3, 2, 2, 1, 2, 2, 2, 2, 2,
                                 6, 2, 2, 2, 2, 1, 2, 2),
                           dims = c(11, 11))

# variables / calibrating equations map
varcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 11))

# calibrated parameters / equations map
calibrpareqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(11, 0))

# calibrated parameters / calibrating equations map
calibrparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 0))

# free parameters / equations map
freepareqmap__ <- sparseMatrix(i = c(2, 3, 4, 5, 6, 6, 6, 7, 8, 10,
                                     10),
                               j = c(1, 5, 1, 1, 2, 3, 4, 4, 3, 2,
                                     4),
                               x = rep(1, 11), dims = c(11, 5))

# free parameters / calibrating equations map
freeparcalibreqmap__ <- sparseMatrix(i = NULL, j = NULL, dims = c(0, 5))

# shocks / equations map
shockeqmap__ <- sparseMatrix(i = c(3),
                             j = c(1),
                             x = rep(1, 1), dims = c(11, 1))

# steady state equations
ss_eq__ <- function(v, pc, pf)
{
    r <- numeric(11)
    r[1] = -v[1] + v[8]
    r[2] = -v[2] + pf[1] * v[3] * v[6]^(-1 + pf[1]) * v[7]^(1 - pf[1])
    r[3] = -v[3] + exp(pf[5] * log(v[3]))
    r[4] = -v[10] + v[3] * (1 - pf[1]) * v[6]^pf[1] * v[7]^(-pf[1])
    r[5] = -v[11] + v[3] * v[6]^pf[1] * v[7]^(1 - pf[1])
    r[6] = pf[2] * (pf[4] * v[2] * v[4]^-1 + pf[4] * v[4]^-1 * (1 - pf[3])) - pf[4] * v[4]^-1
    r[7] = -(1 - pf[4]) * (1 - v[7])^-1 + pf[4] * v[4]^-1 * v[10]
    r[8] = v[5] - v[6] + v[6] * (1 - pf[3])
    r[9] = -v[1] + v[11] - v[2] * v[6] - v[7] * v[10]
    r[10] = v[9] - pf[2] * v[9] - pf[4] * log(v[4]) - log(1 - v[7]) * (1 - pf[4])
    r[11] = v[1] - v[4] - v[5] + v[2] * v[6] + v[7] * v[10]

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
    jac <- numeric(38)
    jac[1] = -1
    jac[2] = 1
    jac[3] = -1
    jac[4] = pf[1] * v[6]^(-1 + pf[1]) * v[7]^(1 - pf[1])
    jac[5] = pf[1] * v[3] * (-1 + pf[1]) * v[6]^(-2 + pf[1]) * v[7]^(1 - pf[1])
    jac[6] = pf[1] * v[3] * (1 - pf[1]) * v[6]^(-1 + pf[1]) * v[7]^(-pf[1])
    jac[7] = -1 + pf[5] * v[3]^-1 * exp(pf[5] * log(v[3]))
    jac[8] = (1 - pf[1]) * v[6]^pf[1] * v[7]^(-pf[1])
    jac[9] = pf[1] * v[3] * (1 - pf[1]) * v[6]^(-1 + pf[1]) * v[7]^(-pf[1])
    jac[10] = -pf[1] * v[3] * (1 - pf[1]) * v[6]^pf[1] * v[7]^(-1 - pf[1])
    jac[11] = -1
    jac[12] = v[6]^pf[1] * v[7]^(1 - pf[1])
    jac[13] = pf[1] * v[3] * v[6]^(-1 + pf[1]) * v[7]^(1 - pf[1])
    jac[14] = v[3] * (1 - pf[1]) * v[6]^pf[1] * v[7]^(-pf[1])
    jac[15] = -1
    jac[16] = pf[2] * pf[4] * v[4]^-1
    jac[17] = pf[2] * (-pf[4] * v[2] * v[4]^-2 - pf[4] * v[4]^-2 * (1 - pf[3])) + pf[4] * v[4]^-2
    jac[18] = -pf[4] * v[4]^-2 * v[10]
    jac[19] = -(1 - pf[4]) * (1 - v[7])^-2
    jac[20] = pf[4] * v[4]^-1
    jac[21] = 1
    jac[22] = -pf[3]
    jac[23] = -1
    jac[24] = -v[6]
    jac[25] = -v[2]
    jac[26] = -v[10]
    jac[27] = -v[7]
    jac[28] = 1
    jac[29] = -pf[4] * v[4]^-1
    jac[30] = (1 - pf[4]) * (1 - v[7])^-1
    jac[31] = 1 - pf[2]
    jac[32] = 1
    jac[33] = v[6]
    jac[34] = -1
    jac[35] = -1
    jac[36] = v[2]
    jac[37] = v[10]
    jac[38] = v[7]
    jacob <- sparseMatrix(i = c(1, 1, 2, 2, 2, 2, 3, 4, 4, 4,
                                4, 5, 5, 5, 5, 6, 6, 7, 7, 7,
                                8, 8, 9, 9, 9, 9, 9, 9, 10, 10,
                                10, 11, 11, 11, 11, 11, 11, 11),
                          j = c(1, 8, 2, 3, 6, 7, 3, 3, 6, 7,
                                10, 3, 6, 7, 11, 2, 4, 4, 7, 10,
                                5, 6, 1, 2, 6, 7, 10, 11, 4, 7,
                                9, 1, 2, 4, 5, 6, 7, 10),
                          x = jac, dims = c(11, 11))

    return(jacob)
}

# 1st order perturbation
pert1__ <- function(v, pc, pf)
{
    Atm1x <- numeric(7)
    Atm1x[1] = pf[1] * v[3] * (-1 + pf[1]) * v[6]^(-2 + pf[1]) * v[7]^(1 - pf[1])
    Atm1x[2] = pf[5] * v[3]^-1 * exp(pf[5] * log(v[3]))
    Atm1x[3] = pf[1] * v[3] * (1 - pf[1]) * v[6]^(-1 + pf[1]) * v[7]^(-pf[1])
    Atm1x[4] = pf[1] * v[3] * v[6]^(-1 + pf[1]) * v[7]^(1 - pf[1])
    Atm1x[5] = 1 - pf[3]
    Atm1x[6] = -v[2]
    Atm1x[7] = v[2]
    Atm1 <- sparseMatrix(i = c(2, 3, 4, 5, 8, 9, 11),
                         j = c(6, 3, 6, 6, 6, 6, 6),
                         x = Atm1x, dims = c(11, 11))

    Atx <- numeric(32)
    Atx[1] = -1
    Atx[2] = 1
    Atx[3] = -1
    Atx[4] = pf[1] * v[6]^(-1 + pf[1]) * v[7]^(1 - pf[1])
    Atx[5] = pf[1] * v[3] * (1 - pf[1]) * v[6]^(-1 + pf[1]) * v[7]^(-pf[1])
    Atx[6] = -1
    Atx[7] = (1 - pf[1]) * v[6]^pf[1] * v[7]^(-pf[1])
    Atx[8] = -pf[1] * v[3] * (1 - pf[1]) * v[6]^pf[1] * v[7]^(-1 - pf[1])
    Atx[9] = -1
    Atx[10] = v[6]^pf[1] * v[7]^(1 - pf[1])
    Atx[11] = v[3] * (1 - pf[1]) * v[6]^pf[1] * v[7]^(-pf[1])
    Atx[12] = -1
    Atx[13] = pf[4] * v[4]^-2
    Atx[14] = -pf[4] * v[4]^-2 * v[10]
    Atx[15] = (-1 + pf[4]) * (1 - v[7])^-2
    Atx[16] = pf[4] * v[4]^-1
    Atx[17] = 1
    Atx[18] = -1
    Atx[19] = -1
    Atx[20] = -v[6]
    Atx[21] = -v[10]
    Atx[22] = -v[7]
    Atx[23] = 1
    Atx[24] = -pf[4] * v[4]^-1
    Atx[25] = (1 - pf[4]) * (1 - v[7])^-1
    Atx[26] = 1
    Atx[27] = 1
    Atx[28] = v[6]
    Atx[29] = -1
    Atx[30] = -1
    Atx[31] = v[10]
    Atx[32] = v[7]
    At <- sparseMatrix(i = c(1, 1, 2, 2, 2, 3, 4, 4, 4, 5,
                             5, 5, 6, 7, 7, 7, 8, 8, 9, 9,
                             9, 9, 9, 10, 10, 10, 11, 11, 11, 11,
                             11, 11),
                       j = c(1, 8, 2, 3, 7, 3, 3, 7, 10, 3,
                             7, 11, 4, 4, 7, 10, 5, 6, 1, 2,
                             7, 10, 11, 4, 7, 9, 1, 2, 4, 5,
                             7, 10),
                         x = Atx, dims = c(11, 11))

    Atp1x <- numeric(3)
    Atp1x[1] = pf[2] * pf[4] * v[4]^-1
    Atp1x[2] = pf[2] * (-pf[4] * v[2] * v[4]^-2 - pf[4] * v[4]^-2 * (1 - pf[3]))
    Atp1x[3] = -pf[2]
    Atp1 <- sparseMatrix(i = c(6, 6, 10),
                         j = c(2, 4, 9),
                         x = Atp1x, dims = c(11, 11))

    Aepsx <- numeric(1)
    Aepsx[1] = exp(pf[5] * log(v[3]))
    Aeps <- sparseMatrix(i = c(3),
                         j = c(1),
                         x = Aepsx, dims = c(11, 1))

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
