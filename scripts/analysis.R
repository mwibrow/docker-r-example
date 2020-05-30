library("lme4")

fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

print(fm1)
