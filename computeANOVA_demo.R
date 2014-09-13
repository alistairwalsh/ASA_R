#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)


#Run an ANOVA on the mean correct RT data.
rt_anova = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt
  , wid = subnum
  , within = .(cue,flank)
  , between = group
)

#Show the ANOVA and assumption tests.
print(rt_anova)

## Not run: 
#Run an ANOVA on the mean correct RT data, ignoring group.
rt_anova2 = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt
  , wid = subnum
  , within = .(cue,flank)
)

#Show the ANOVA and assumption tests.
print(rt_anova2)

## End(Not run)

#Run a purely between-Ss ANOVA on the mean_rt data.
#NOTE use of within_full to ensure that the data are
# collapsed properly
rt_anova3 = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt
  , wid = subnum
  , within_full = .(cue,flank)
  , between = group
)

#Show the ANOVA and assumption tests.
print(rt_anova3)


#add a within-Ss effect to be used as a covariate
ANT$rt2 = ANT$rt + ANT$block*1000 #additive with and independent of the other predictors!

## Not run: 
#Run an anova that doesn't use the covariate
rt_anova4a = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt2
  , wid = subnum
  , within = .(cue,flank)
  , between = group
)

#Show the ANOVA and assumption tests. 
# Note loss of power to observe the within effects
print(rt_anova4a)

## End(Not run)

#Run an anova that does use the covariate
rt_anova4b = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt2
  , wid = subnum
  , within = .(cue,flank)
  , within_covariates = block
  , between = group
)

#Show the ANOVA and assumption tests. 
# Note power to observe the within effects has returned
print(rt_anova4b)


#add a between-Ss effect to be used as a covariate
ANT$bc = as.numeric(as.character(ANT$subnum))%%10 #Note that the effect is balanced across groups
ANT$rt3 = ANT$rt + ANT$bc*1000 #additive with and independent of the other predictors!

## Not run: 
#Run an anova that doesn't use the covariate
rt_anova5a = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt2
  , wid = subnum
  , within = .(cue,flank)
  , between = group
)

#Show the ANOVA and assumption tests. 
# Note loss of power to observe the between effects
print(rt_anova5a)

## End(Not run)

#Run an anova that does use the covariate
rt_anova5b = ezANOVA(
  data = ANT[ANT$error==0,]
  , dv = rt2
  , wid = subnum
  , within = .(cue,flank)
  , between = group
  , between_covariates = bc
)

#Show the ANOVA and assumption tests. 
# Note power to observe the between effects has returned
print(rt_anova5b)