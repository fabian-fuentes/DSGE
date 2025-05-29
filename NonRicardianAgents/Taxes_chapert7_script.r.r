rm(list=ls())

#Taxes
 library(gEcon)
 dir.model<-paste0(getwd(),'/NonRicardianAgents/') 
 gcn.file<-"Taxes_chapter7.gcn"

#create a model from gcc.file
  model <- make_model(paste0(dir.model,gcn.file))

#set initial conditions
  model <- initval_var(model, list(C = 0.8,
                                    L_s = 0.3,
                                    K_s = 3.5,
                                    I = 0.2,
                                    Y = 1.0,
                                    A = 1.0,
                                    W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=0.0, 
                                    PI=0.0 , 
                                    U = 1.0, 
                                    G_inc = 0.116*0.8 + 0.348*(1-0.350)*(1.0/0.3)*0.3 + 0.225*((0.350)*(1.0/3.5)-0.06)*3.5  , 
                                    GT = 0.116*0.8 + 0.348*(1-0.350)*(1.0/0.3)*0.3 + 0.225*((0.350)*(1.0/3.5)-0.06)*3.5, 
                                    lambda_c = 1.0,
                                    T_c = 0.116*0.8, 
                                    T_l = 0.348*(1-0.350)*(1.0/0.3)*0.3, 
                                    T_k = 0.225*((0.350)*(1.0/3.5)-0.06)*3.5
                                    )
                        )

#define steady state
 model <- steady_state(model)

#=================================================================================================================
#create Laffer Curves 
#=================================================================================================================

#create experimental design 
  Xs <- expand.grid(list(tau_l=seq(0.0,1.0,0.1),tau_c=seq(0.0,1.0,0.1),tau_k=seq(0.0,1.0,0.1)))
  Xs$Run_ID <- 1:nrow(Xs)
  dim(Xs)

 laffer <- list()
 for (i in 1:length(Xs$Run_ID))
 {
# i<-67
   model_i <- initval_var(model, list(C = 0.8,
                                    L_s = 0.3,
                                    K_s = 3.5,
                                    I = 0.2,
                                    Y = 1.0,
                                    A = 1.0,
                                    W=(1-0.350)*(1.0/0.3),
                                    r=(0.350)*(1.0/3.5), 
                                    pi=0.0, 
                                    PI=0.0 , 
                                    U = 1.0, 
                                    G_inc = Xs$tau_c[i]*0.8 + Xs$tau_l[i]*(1-0.350)*(1.0/0.3)*0.3 + Xs$tau_k[i]*((0.350)*(1.0/3.5)-0.06)*3.5, 
                                    GT = Xs$tau_c[i]*0.8 + Xs$tau_l[i]*(1-0.350)*(1.0/0.3)*0.3 + Xs$tau_k[i]*((0.350)*(1.0/3.5)-0.06)*3.5, 
                                    lambda_c = 0.1,
                                    T_c = Xs$tau_c[i]*0.8, 
                                    T_l = Xs$tau_l[i]*(1-0.350)*(1.0/0.3)*0.3, 
                                    T_k = Xs$tau_k[i]*((0.350)*(1.0/3.5)-0.06)*3.5
                                    )
                        )
 model_i <- set_free_par(model_i, list(tau_l = Xs$tau_l[i], tau_c = Xs$tau_c[i], tau_k = Xs$tau_k[i]),warnings=FALSE)
 model_i <- steady_state(model_i,last_solver_iter=TRUE)
 ss_i <- get_ss_values(model_i,silent=TRUE)
 ss_i <- data.frame(t(ss_i))
 ss_i$Run_ID <- Xs$Run_ID[i]
 laffer <- append(laffer,list(ss_i))
 rm(model_i)
 }

#row bind results 
 laffer <- do.call("rbind",laffer) 

#merge Xs
 dim(laffer)
 laffer<-merge(laffer,Xs,by="Run_ID")
 dim(laffer)

#Identify cases of interests for laffer curves 
laffer$labor_tax <- ifelse(laffer$tau_c==0 & laffer$tau_k==0,1,0)
laffer$capital_tax <- ifelse(laffer$tau_l==0 & laffer$tau_c==0,1,0)
laffer$consumption_tax <- ifelse(laffer$tau_l==0 & laffer$tau_k==0,1,0)

#write laffer curve database
write.csv(laffer,paste0(dir.model,"out/laffer_curve.csv"),row.names=FALSE)

#=================================================================================================================
#Introduce Productivity Shock 
#=================================================================================================================
#estimate IRFs
  model <- set_shock_distr_par(model = model, distr_par = list("sd(epsilon_A)" = 0.01))
  model<- compute_model_stats(model)
  model <- solve_pert(model)
#Compute Impulse Response Function (IRFs)
  model_irf <- compute_irf(model = model, variables = c('C','L_s','K_s','I','Y','A', 'G_inc','T_c','T_l','T_k'), sim_length = 40)

#Extract simulation values
  library(reshape2)
  out <- as.data.frame.table(model_irf@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
#print simulation
  write.csv(out,paste0(dir.model,"out/out.csv"),row.names=FALSE)

#Compute random path 
  model_rp <- random_path(model = model, variables = c('C','L_s','K_s','I','Y','A', 'G_inc','T_c','T_l','T_k'), sim_length = 40)

#extract values of random path simulation 
  out <- as.data.frame.table(model_rp@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
  out$Case<-paste0("sd_epsilon_A = ",0.01)
  write.csv(out,paste0(dir.model,"out/out_random_path.csv"),row.names=FALSE)

#Introduce Multiple Shocks  






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