#Deliverable 1
#Read in CSV file
MechaCar_mpg <- read_csv('MechaCar_mpg.csv')

#Use lm() to perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,MechaCar_mpg)

#Perform summary on the previous lm() function
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,MechaCar_mpg))




#Deliverable 2
#Read in CSV file
Suspension_Coil <- read_csv('Suspension_Coil.csv')

#Create dataframe that collects mean, median, variance, and standard deviation 
#of the suspension coil’s PSI column
total_summary <- summarize(Suspension_Coil, Mean=mean(PSI),Median=median(PSI),
Variance=var(PSI),Standard_Deviation=sd(PSI))

#Create dataframe that groups each Manufacturing Lot
#by the mean, median, variance, and standard deviation of the PSI column
lots <- group_by(Suspension_Coil, Manufacturing_Lot)
lot_summary <- summarize(lots, Mean=mean(PSI),Median=median(PSI),
                         Variance=var(PSI),Standard_Deviation=sd(PSI))



#Deliverable 3
#Use the t.test() function to determine if the PSI across all manufacturing lots is 
#statistically different from the population mean of 1,500 pounds per square inch.
t.test(Suspension_Coil$PSI,mu=1500)

#Perform a test on each manufacturing lot individually
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)