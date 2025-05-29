rm(list=ls())

#Non-Ricardian Agents Analysis 
 library(gEcon)

 dir.model<-paste0(getwd(),'/NonRicardianAgents/') 
 gcn.file<-"nRa_chapter4.gcn"

#create a model from gcc.file
  model <- make_model(paste0(dir.model,gcn.file))

#set parameter values

#set initial conditions
  model <- initval_var(model, list(C = 0.8,
                                    C_1=0.8,
                                    C_2 = 0.2,
                                    L_s = 0.3,
                                    L_1_s = 0.3,
                                    L_2_s = 0.3,
                                    K_s = 3.5,
                                    K_1_s = 4.0,
                                    I = 0.2,
                                    I_1 = 0.3,
                                    Y = 1.0,
                                    A = 1.0,
                                    W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=1.0, 
                                    PI=1.0 , 
                                    U_1 = 1.0,
                                    U_2 = 2.0 ))

#define steady state
 model <- steady_state(model)

#Now to explore output data
 get_ss_values(model)
 get_par_values(model)

#Solving for dynamics
 model <- solve_pert(model)

#printing the results
 get_pert_solution(model)

#Introducing shocks
  model <- set_shock_distr_par(model = model, distr_par = list("sd(epsilon_A)" = 0.01))
#Print all results
  model<- compute_model_stats(model)
  get_model_stats(model)

#Compute Impulse Response Function (IRFs)
  model_irf <- compute_irf(model = model, variables = c('C','C_1','C_2','L_s','L_1_s','L_2_s','K_s','K_1_s','I','I_1','Y','A'), sim_length = 40)

#Extract simulation values
  library(reshape2)
  out <- as.data.frame.table(model_irf@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
  out$Case<-"Non-Ricardian Agents omega Medium"
  out$Omega <- 0.5
#run another case
  model1 <- make_model(paste0(dir.model,gcn.file))
  model1 <- set_free_par(model1, list(omega = 0.2))
  model1 <- initval_var(model1, list(C = 0.8,
                                    C_1=0.8,
                                    C_2 = 0.2,
                                   L_s = 0.3,
                                    L_1_s = 0.3,
                                    L_2_s = 0.3,
                                   K_s = 3.5,
                                    K_1_s = 4.0,
                                   I = 0.2,
                                    I_1 = 0.3,
                                   Y = 1.0,
                                   A = 1.0,
                                   W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=1.0, 
                                    PI=1.0 , 
                                    U_1 = 1.0,
                                    U_2 = 2.0))
  model1 <- steady_state(model1)
  model1 <- set_shock_distr_par(model = model1, distr_par = list("sd(epsilon_A)" = 0.01))
  model1 <- solve_pert(model1)
  model_irf1 <- compute_irf(model = model1, variables = c('C','C_1','C_2','L_s','L_1_s','L_2_s','K_s','K_1_s','I','I_1','Y','A'), sim_length = 40)
  out1 <- as.data.frame.table(model_irf1@sim)
  out1<-dcast(out1,Var2  ~ Var1 , value.var="Freq")
  out1$Case<-"Non-Ricardian Agents omega Low"
  out1$Omega <- 0.2
#
#run another case
  model2 <- make_model(paste0(dir.model,gcn.file))
  model2 <- set_free_par(model2, list(omega = 0.8))
  model2 <- initval_var(model2, list(C = 0.8,
                                    C_1=0.8,
                                    C_2 = 0.2,
                                   L_s = 0.3,
                                    L_1_s = 0.3,
                                    L_2_s = 0.3,
                                   K_s = 3.5,
                                    K_1_s = 4.0,
                                   I = 0.2,
                                    I_1 = 0.3,
                                   Y = 1.0,
                                   A = 1.0,
                                   W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=1.0, 
                                    PI=1.0 , 
                                    U_1 = 1.0,
                                    U_2 = 2.0))
  model2 <- steady_state(model2)
  model2 <- set_shock_distr_par(model = model2, distr_par = list("sd(epsilon_A)" = 0.01))
  model2 <- solve_pert(model2)
  model_irf2 <- compute_irf(model = model2, variables = c('C','C_1','C_2','L_s','L_1_s','L_2_s','K_s','K_1_s','I','I_1','Y','A'), sim_length = 40)
  out2 <- as.data.frame.table(model_irf2@sim)
  out2<-dcast(out2,Var2  ~ Var1 , value.var="Freq")
  out2$Case<-"Non-Ricardian Agents omega High"
  out2$Omega <- 0.8

#rbind
  outf<-rbind(out,out1,out2)

#print simulation
  write.csv(outf,paste0(dir.model,"out/out.csv"),row.names=FALSE)



#now lets run different TFP shocks 
sdepsilon_Avector<-seq(0.5,1.5, by= 0.1)
gcn.file<-"nRa_chapter4.gcn"

out_all <- list()

for (i in 1:length(sdepsilon_Avector))
{
#i<-1
#create a model from gcc.file
  model <- make_model(paste0(dir.model,gcn.file))

#set parameter values

#set initial conditions
  model <- initval_var(model, list(C = 0.8,
                                    C_1=0.8,
                                    C_2 = 0.2,
                                    L_s = 0.3,
                                    L_1_s = 0.3,
                                    L_2_s = 0.3,
                                    K_s = 3.5,
                                    K_1_s = 4.0,
                                    I = 0.2,
                                    I_1 = 0.3,
                                    Y = 1.0,
                                    A = 1.0,
                                    W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=1.0, 
                                    PI=1.0 , 
                                    U_1 = 1.0,
                                    U_2 = 2.0 ))

#define steady state
 model <- steady_state(model)

#Solving for dynamics
 model <- solve_pert(model)

#Introducing shocks
  model <- set_shock_distr_par(model = model, distr_par = list("sd(epsilon_A)" = sdepsilon_Avector[i]*0.01))

#Compute Impulse Response Function (IRFs)
  model_irf <- compute_irf(model = model, variables = c('C','C_1','C_2','L_s','L_1_s','L_2_s','K_s','K_1_s','I','I_1','Y','A'), sim_length = 40)

#Extract simulation values
  out <- as.data.frame.table(model_irf@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
  out$Case<-paste0("sd_epsilon_A = ",sdepsilon_Avector[i])
  out$ShockType <- "A"
#save ouput  
 out_all <- append(out_all,list(out))
}
out_all <- do.call("rbind",out_all)
head(out_all)

#now lets run an intertemporal substitution shock 
gcn.file<-"nRa_chapter4_B_shock.gcn"
sdepsilon_Bvector<-seq(0.5,1.5, by= 0.1)

out_allB <- list()

for (i in 1:length(sdepsilon_Bvector))
{
#i<-1
 model <- make_model(paste0(dir.model,gcn.file))

#set initial conditions
  model <- initval_var(model, list(C = 0.8,
                                    C_1=0.8,
                                    C_2 = 0.2,
                                    L_s = 0.3,
                                    L_1_s = 0.3,
                                    L_2_s = 0.3,
                                    K_s = 3.5,
                                    K_1_s = 4.0,
                                    I = 0.2,
                                    I_1 = 0.3,
                                    Y = 1.0,
                                    A = 1.0,
                                    W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=1.0, 
                                    PI=1.0 , 
                                    U_1 = 1.0,
                                    U_2 = 2.0, 
                                    B= 1))

#define steady state
 model <- steady_state(model)

#Solving for dynamics
 model <- solve_pert(model)

#Introducing shocks
  model <- set_shock_distr_par(model = model, distr_par = list("sd(epsilon_B)" = sdepsilon_Bvector[i]*0.01))

#Compute Impulse Response Function (IRFs)
  model_irf <- compute_irf(model = model, variables = c('C','C_1','C_2','L_s','L_1_s','L_2_s','K_s','K_1_s','I','I_1','Y','A'), sim_length = 40)

#Extract simulation values
  out <- as.data.frame.table(model_irf@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
  out$Case<-paste0("sd_epsilon_B = ",sdepsilon_Bvector[i])
  out$ShockType <- "B"
#save ouput  
  out_allB <- append(out_allB,list(out))
}
out_allB <- do.call("rbind",out_allB)
head(out_allB)

#print simulation
 out_all<-rbind(out_all,out_allB)
 write.csv(out_all,paste0(dir.model,"out/out_sentivity_TFP.csv"),row.names=FALSE)


#simulate the behavior of the economy using random path for shocks
#create a model from gcc.file
  gcn.file<-"nRa_chapter4.gcn"
  model <- make_model(paste0(dir.model,gcn.file))
#set initial conditions
  model <- initval_var(model, list(C = 0.8,
                                    C_1=0.8,
                                    C_2 = 0.2,
                                    L_s = 0.3,
                                    L_1_s = 0.3,
                                    L_2_s = 0.3,
                                    K_s = 3.5,
                                    K_1_s = 4.0,
                                    I = 0.2,
                                    I_1 = 0.3,
                                    Y = 1.0,
                                    A = 1.0,
                                    W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=1.0, 
                                    PI=1.0 , 
                                    U_1 = 1.0,
                                    U_2 = 2.0 ))

#define steady state
 model <- steady_state(model)

#Solving for dynamics
 model <- solve_pert(model)

#Introducing shocks
  model <- set_shock_distr_par(model = model, distr_par = list("sd(epsilon_A)" = 0.01))

#Compute random path 
  model_rp <- random_path(model = model, variables = c('C','C_1','C_2','L_s','L_1_s','L_2_s','K_s','K_1_s','I','I_1','Y','A'), sim_length = 40)

#extract values of random path simulation 
  out <- as.data.frame.table(model_rp@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
  out$Case<-paste0("sd_epsilon_A = ",0.01)
  write.csv(out,paste0(dir.model,"out/out_random_path.csv"),row.names=FALSE)
