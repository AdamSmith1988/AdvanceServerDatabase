CREATE VIEW (Training Passed Example) AS

SELECT        
Salon.HairAndBeautySalon.Name, Employee.Employee.First_Name, Training.TrainingActivity.ActivityName, 
Training.EmployeeTraining.DateCoached, Training.EmployeeTraining.TrainingPassed

FROM            
Training.TrainingActivity INNER JOIN
Training.EmployeeTraining ON Training.TrainingActivity.TrainingActivityID = Training.EmployeeTraining.TrainingActivityID INNER JOIN
Employee.Employee ON Training.EmployeeTraining.EmployeeID = Employee.Employee.EmployeeID INNER JOIN
Salon.HairAndBeautySalon ON Employee.Employee.SalonID = Salon.HairAndBeautySalon.SalonID AND Employee.Employee.SalonID = Salon.HairAndBeautySalon.SalonID

WHERE        
(Training.EmployeeTraining.TrainingPassed = 1)