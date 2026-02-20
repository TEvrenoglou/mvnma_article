
## Read model results

mvNMA.standard <- readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/mvNMA.standard.rds",sep = ""))
mvNMA.DM <- readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/mvNMA.DM.rds",sep = ""))
net1 <- readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/net1.rds",sep = ""))
net2 <- readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/net2.rds",sep = ""))
net3 <-readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/net3.rds",sep = ""))
net4 <- readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/net4.rds",sep = ""))
net5 <- readRDS(paste(getwd(),"/Analysis_antidepressants/Model_files/net5.rds",sep = ""))   


###### Early Response 

res1_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Early_Response$basic_estimates),
                                  "est" = mvNMA.standard$Early_Response$basic_estimates$mean,
                                  "se" = mvNMA.standard$Early_Response$basic_estimates$sd
                                  )

res1_mvnma_TE$mod <- "mvNMA(standard)"

res1_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Early_Response$basic_estimates),
                                  "est" = mvNMA.DM$Early_Response$basic_estimates$mean,
                                  "se" = mvNMA.DM$Early_Response$basic_estimates$sd
                                  )

res1_mvnmaDM_TE$mod <- "mvNMA(DM)"

res1_nma_TE <- cbind.data.frame("treat" = names(net1$TE.random[,which(colnames(net1$TE.random)=="Placebo")]),
                                "est" =  unname(net1$TE.random[,which(colnames(net1$TE.random)=="Placebo")]),
                                "se" =  unname(net1$seTE.random[,which(colnames(net1$seTE.random)=="Placebo")])
                                )              
                                                
                                                
res1_nma_TE$mod <- "NMA"                                              

res1 <- rbind.data.frame(res1_mvnma_TE,res1_mvnmaDM_TE,res1_nma_TE)

res1$outcome = "Early_Response"

###### Early Remission

res2_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Early_Remission$basic_estimates),
                                  "est" = mvNMA.standard$Early_Remission$basic_estimates$mean,
                                  "se" = mvNMA.standard$Early_Remission$basic_estimates$sd
)

res2_mvnma_TE$mod <- "mvNMA(standard)"

res2_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Early_Remission$basic_estimates),
                                    "est" = mvNMA.DM$Early_Remission$basic_estimates$mean,
                                    "se" = mvNMA.DM$Early_Remission$basic_estimates$sd
)

res2_mvnmaDM_TE$mod <- "mvNMA(DM)"

res2_nma_TE <- cbind.data.frame("treat" = names(net2$TE.random[,which(colnames(net2$TE.random)=="Placebo")]),
                                "est" =  unname(net2$TE.random[,which(colnames(net2$TE.random)=="Placebo")]),
                                "se" =  unname(net2$seTE.random[,which(colnames(net2$seTE.random)=="Placebo")])
)              


res2_nma_TE$mod <- "NMA"                                              

res2 <- rbind.data.frame(res2_mvnma_TE,res2_mvnmaDM_TE,res2_nma_TE)

res2$outcome = "Early_Remission"

###### ADVERSE EVENTS 

res3_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Adverse_events$basic_estimates),
                                  "est" = mvNMA.standard$Adverse_events$basic_estimates$mean,
                                  "se" = mvNMA.standard$Adverse_events$basic_estimates$sd
)

res3_mvnma_TE$mod <- "mvNMA(standard)"

res3_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Adverse_events$basic_estimates),
                                    "est" = mvNMA.DM$Adverse_events$basic_estimates$mean,
                                    "se" = mvNMA.DM$Adverse_events$basic_estimates$sd
)

res3_mvnmaDM_TE$mod <- "mvNMA(DM)"

res3_nma_TE <- cbind.data.frame("treat" = names(net3$TE.random[,which(colnames(net3$TE.random)=="Placebo")]),
                                "est" =  unname(net3$TE.random[,which(colnames(net3$TE.random)=="Placebo")]),
                                "se" =  unname(net3$seTE.random[,which(colnames(net3$seTE.random)=="Placebo")])
)              


res3_nma_TE$mod <- "NMA"                                              

res3 <- rbind.data.frame(res3_mvnma_TE,res3_mvnmaDM_TE,res3_nma_TE)

res3$outcome = "Adverse_events"

###### Loss to follow up

res4_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Loss_to_follow_up$basic_estimates),
                                  "est" = mvNMA.standard$Loss_to_follow_up$basic_estimates$mean,
                                  "se" = mvNMA.standard$Loss_to_follow_up$basic_estimates$sd
)

res4_mvnma_TE$mod <- "mvNMA(standard)"

res4_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Loss_to_follow_up$basic_estimates),
                                    "est" = mvNMA.DM$Loss_to_follow_up$basic_estimates$mean,
                                    "se" = mvNMA.DM$Loss_to_follow_up$basic_estimates$sd
)

res4_mvnmaDM_TE$mod <- "mvNMA(DM)"

res4_nma_TE <- cbind.data.frame("treat" = names(net4$TE.random[,which(colnames(net4$TE.random)=="Placebo")]),
                                "est" =  unname(net4$TE.random[,which(colnames(net4$TE.random)=="Placebo")]),
                                "se" =  unname(net4$seTE.random[,which(colnames(net4$seTE.random)=="Placebo")])
)              


res4_nma_TE$mod <- "NMA"                                              

res4 <- rbind.data.frame(res4_mvnma_TE,res4_mvnmaDM_TE,res4_nma_TE)

res4$outcome = "Loss_to_follow_up"

###### Loss to follow up due to AE

res5_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Loss_to_follow_up_AE$basic_estimates),
                                  "est" = mvNMA.standard$Loss_to_follow_up_AE$basic_estimates$mean,
                                  "se" = mvNMA.standard$Loss_to_follow_up_AE$basic_estimates$sd
)

res5_mvnma_TE$mod <- "mvNMA(standard)"

res5_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Loss_to_follow_up_AE$basic_estimates),
                                    "est" = mvNMA.DM$Loss_to_follow_up_AE$basic_estimates$mean,
                                    "se" = mvNMA.DM$Loss_to_follow_up_AE$basic_estimates$sd
)

res5_mvnmaDM_TE$mod <- "mvNMA(DM)"

res5_nma_TE <- cbind.data.frame("treat" = names(net5$TE.random[,which(colnames(net5$TE.random)=="Placebo")]),
                                "est" =  unname(net5$TE.random[,which(colnames(net5$TE.random)=="Placebo")]),
                                "se" =  unname(net5$seTE.random[,which(colnames(net5$seTE.random)=="Placebo")])
)              


res5_nma_TE$mod <- "NMA"                                              

res5 <- rbind.data.frame(res5_mvnma_TE,res5_mvnmaDM_TE,res5_nma_TE)

res5$outcome = "Loss_to_follow_up_AE"


### Combine everything

res_all <- rbind.data.frame(res1,res2,res3,res4,res5)

write.csv(res_all,paste(getwd(),"/Analysis_antidepressants/Results/all_TE.csv",sep = ""),row.names = FALSE)
   
