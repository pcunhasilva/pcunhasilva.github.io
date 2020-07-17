library(brms)

# Load Data
load('frprData.RData')

#------------ District Level -------------#
set.seed(123)
m1d <- brm(dvotes_perc ~ female * distTop 
	+ incumbent  
	+ fcopartisan_p
	+ female_perc
	+ prerank_mag
	+ log(magnitude)	
	+ (1|party)
	+ (1|dy)
	, control = list(adapt_delta = 0.995, max_treedepth = 11)
	, prior = c(set_prior('normal (0, 6)'))
	, iter = 4000
	, family = 'gaussian'
	, cores = 4
	, data = frPRData[frPRData$topTierInd != 1, ]) 
summary(m1d)

set.seed(123)
m2d <- brm(pvotes_perc ~ female * distTop 
	+ incumbent  
	+ fcopartisan_p
	+ female_perc
	+ prerank_mag
	+ log(magnitude)
	+ (1|party)
	+ (1|dy)
	, control = list(adapt_delta = 0.995, max_treedepth = 11)
	, prior = c(set_prior('normal (0, 6)'))
	, iter = 4000
	, family = 'gaussian'
	, cores = 4
	, data =  frPRData[frPRData$topTierInd != 1, ]) 
summary(m1d)

set.seed(123)
m3d <- brm(rankdif_mag ~ female * distTop 
	+ incumbent  
	+ fcopartisan_p
	+ female_perc
	+ roomUPmag	
	+ (1|party)
	+ (1|dy)
	, control = list(adapt_delta = 0.995, max_treedepth = 11)
	, prior = c(set_prior('normal (0, 6)'))
	, family = 'gaussian'
	, iter = 4000	
	, cores = 4
	, data = frPRData[frPRData$topTierInd != 1, ]) 
summary(m1d)

# ------------ Party Level ----------------#
set.seed(123)
m1 <- brm(dvotes_perc ~ female * topTier 
	+ incumbent  
	+ fcopartisan_p
	+ female_perc
	+ prerank_mag
	+ log(magnitude)	
	+ (1|dpy)
	, control = list(adapt_delta = 0.995, max_treedepth = 11)
	, prior = c(set_prior('normal (0, 6)'))
	, iter = 4000
	, family = 'gaussian'
	, cores = 4
	, data = frPRData[frPRData$topTierInd != 1, ]
	) 
summary(m1)

set.seed(123)
m2 <- brm(pvotes_perc ~  female * topTier  
	+ incumbent  
	+ fcopartisan_p
	+ female_perc
	+ prerank_mag
	+ log(magnitude)
	+ (1|dpy)
	, control = list(adapt_delta = 0.995, max_treedepth = 11)
	, prior = c(set_prior('normal (0, 6)'))
	, iter = 4000
	, family = 'gaussian'
	, cores = 4
	, data = frPRData[frPRData$topTierInd != 1, ]
	) 
summary(m2)

set.seed(123)
m3 <- brm(rankdif_mag ~ female * topTier 
	+ incumbent  
	+ fcopartisan_p
	+ female_perc
	+ roomUPmag	
	+ (1|dpy)
	, control = list(adapt_delta = 0.995, max_treedepth = 11)
	, prior = c(set_prior('normal (0, 6)'))
	, family = 'gaussian'
	, iter = 4000	
	, cores = 4
	, data = frPRData[frPRData$topTierInd != 1, ]) 
summary(m3)
