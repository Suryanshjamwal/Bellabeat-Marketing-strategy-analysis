-- checking for distinct values

SELECT DISTINCT Id FROM `corded-sunlight-374118.dailyAct.Act`;

SELECT DISTINCT Id FROM `corded-sunlight-374118.dailyAct.Cal`;

SELECT DISTINCT Id FROM `corded-sunlight-374118.dailyAct.Int`;

SELECT DISTINCT Id FROM `corded-sunlight-374118.dailyAct.Steps`;

-- results after querying declare all users are present in the above tables

/* 
Unable to parse sleep and weight info data due to inconsistent date and time formatting
*/

-- Checking all dates are non-null values

SELECT  DISTINCT ActivityDate  FROM `corded-sunlight-374118.dailyAct.Act`;

SELECT DISTINCT ActivityDay FROM `corded-sunlight-374118.dailyAct.Cal`;

-- Checking if data sets are related

-- comparing activity and calories dataset

SELECT COUNT(a.Id)
    FROM `corded-sunlight-374118.dailyAct.Act` AS a
    LEFT JOIN `corded-sunlight-374118.dailyAct.Cal` AS c ON 
    a.Id = c.Id AND 
    a.ActivityDate = c.ActivityDay AND 
    a.Calories = c.Calories;

/* Output

Row	f0_
1	940

*/

-- comparing activity and intensities dataset

SELECT COUNT(a.ID)
    FROM `corded-sunlight-374118.dailyAct.Act` AS a
    LEFT JOIN `corded-sunlight-374118.dailyAct.Int` AS i  ON 
    a.Id = i.Id AND 
    a.ActivityDate = i.ActivityDay AND 
    a.SedentaryMinutes = i.SedentaryMinutes AND
    a.LightlyActiveMinutes = i.LightlyActiveMinutes AND
    a.FairlyActiveMinutes = i.FairlyActiveMinutes AND
    a.VeryActiveMinutes = i.VeryActiveMinutes AND
    a.SedentaryActiveDistance = i.SedentaryActiveDistance AND
    a.LightActiveDistance = i.LightActiveDistance AND
    a.ModeratelyActiveDistance = i.ModeratelyActiveDistance AND
    a.VeryActiveDistance = i.VeryActiveDistance;

/* Output

Row	f0_
1	940

*/

-- comparing activity and steps dataset

SELECT COUNT(a.Id)
    FROM `corded-sunlight-374118.dailyAct.Act` AS a
    LEFT JOIN `corded-sunlight-374118.dailyAct.Steps` AS s ON 
    a.Id = s.Id AND 
    a.ActivityDate = s.ActivityDay AND 
    a.TotalSteps = s.StepTotal;

/* Output

Row	f0_
1	940

*/





