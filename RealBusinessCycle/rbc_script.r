#Real business cycle
 library(gEcon)
 
 dir.model <- paste0(getwd(),'/RealBusinessCycle/') 
 gcn.file<-"rbc_chapter2.gcn"

#create a model from gcc.file
  model <- make_model(paste0(dir.model,gcn.file))

#set parameter values

#set initial conditions
  model <- initval_var(model, list(K_s = 3.5, C = 0.8, L_s = 0.3 , I = 0.2, Y = 1.0, A = 1.0))

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
  model_irf <- compute_irf(model = model, variables = c('C', 'K_s', 'A', 'Y', 'L_s', 'I'), sim_length = 40)


#Extract simulation values
  library(reshape2)
  out <- as.data.frame.table(model_irf@sim)
  out<-dcast(out,Var2  ~ Var1 , value.var="Freq")
  out$Case<-"base case"

#run another case
  model1 <- set_free_par(model, list(alpha = 0.25))
  model1 <- initval_var(model1, list(K_s = 3.5, C = 0.8, L_s = 0.3 , I = 0.2, Y = 1.0, A = 0.5))
  model1 <- steady_state(model1)
  model1 <- set_shock_distr_par(model = model1, distr_par = list("sd(epsilon_A)" = 0.01))
  model1 <- solve_pert(model1)
  model_irf1 <- compute_irf(model = model1, variables = c('C', 'K_s', 'A', 'Y', 'L_s', 'I'), sim_length = 40)
  out1 <- as.data.frame.table(model_irf1@sim)
  out1<-dcast(out1,Var2  ~ Var1 , value.var="Freq")
  out1$Case<-"alt case"

#rbind
  out<-rbind(out,out1)

#print simulation
  write.csv(out,paste0(dir.model,"out.csv"),row.names=FALSE)

