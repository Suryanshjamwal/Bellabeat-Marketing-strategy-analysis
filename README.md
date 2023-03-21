# Bellabeat Marketing strategy - Case Study

This case study focuses on providing high-level marketing recommendations for one of the renowned fitness and wellness brands, Bellabeat. 

## About the company 

Bellabeat encourages women to rediscover their inner strength, tap into it, and become who they were meant to be. Giving women the tools to live in harmony with themselves is their main goal. Their selected product range includes, but not limited to, fitness tracking wristbands, pendants, yoga mats and a user-friendly app.

<table align = "center">
  <tr>
    <td><img src="images/girl.png"  width="200" height="250" />
    <td><img src="images/leaf.png"  width="200" height="200" />
 </table>

## Motivation for Analysis

Bellabeat’s cofounder and Chief Creative Officer, Urška Sršen wishes to gain insight about how users interact with their smart devices. She believes that examining fitness data from smart devices could help the business find new growth prospects. By focusing on one of the company's product, this case study shall provide a clear, insightful analysis of smart device users' daily habits using a public dataset.

For the analysis we use the following dataset: 
FitBit Fitness Tracker Data : https://www.kaggle.com/arashnic/fitbit
	
## Technologies

* Python 3 - using pandas and numpy
    * Data Cleaning 
    * Data Transformation
* SQL - using BigQuery
    * Data querying
* Tableau 
    * Data visualisation

## Analysis Process

### <ins> Ask phase </ins>

#### Business Task

Using the smart device data, we get an insight on how data fetched from the consumers essentially informs about their usage and lifestyle. This is vital for developing a sense about what marketing strategies would help focus on certain aspects of the app to foster healthy practices for the overall well-being of the end user.

High-level recommendations for effective marketing strategies will be provided to the stakeholders in the form of interactive visuals and conclusions.

#### Key Stakeholders

* Urška Sršen: cofounder and Chief Creative Officer.

* Sando Mur: cofounder and a key member of the Bellabeat executive team.

* Bellabeat marketing analytics team.

### <ins> Prepare phase </ins>

#### Identifying dataset organisation

The dataset used here includes 18 CSV file. According to the dataset, 33 users' multi-level data has been recorded on a daily, hourly and minute basis on their physical activity, heartrate, sleep cycles and weight tracking. 

To query about the data structure, we use sql queries as you can never go wrong with identifying the dataset structure with SQL!

Key descriptors, assumptions and limitations:

* Each table has an ID header having values depicting individual users. Using the following sql command on each table:

```
SELECT  COUNT(DISTINCT ID)  FROM `dailyActivity_merged` 

O/P:
Row	f0_
1	33

```

* Data recorded for 31 days from 12th April, 2016 to 12th May, 2016. Using the following sql command on each table:

```
SELECT  COUNT(DISTINCT ActivityDate)  FROM `dailyActivity_merged`

O/P:

Row	f0_
1	31

```

* The data is from 2016. The pandemic has certainly affected peoples' lifestyles drastically. An updated version of the dataset would be better to provide insights.

* The dataset doesn't include the users demographics such as age and sex. Bellabeats' target audience is females and this poses as a limitation about the dataset.

#### Filtering Data

* For a high-level analysis, we shall only focus on the daily and hourly trends, not a deep-level performance tracking minute-by-minute analysis.

* After thorough comparison, turns out the datasets 'dailyCalories_merged', 'dailyIntensities_merged' and 'dailySteps_merged' are all subsets of the dataset 'dailyActivity_merged'. For the analysis, using 'dailyActivity_merged' is sufficient. More on these findings can be found in this [sql file](SQL_script.sql).

### <ins> Process Phase </ins>

#### Data transformation and cleaning

Using pandas and numpy, this process can be found here: [ipynb file](DataClean.ipynb)

Key Takeaways:
* Average(Mean) Sedentry minutes is 991.2 minutes or 16.5 hours/day! That's almost close to 70% of a day.

* Most users are lightly active users.

* Average total steps per day is 7637. Recommended total steps is 10,000 according to Centers for Disease Control and Prevention (CDC).

* Average sleep hours is 7 Hours.

### <ins> Share Phase </ins>

Using Tableau to visualise our datasets. 

[Dashboard](https://public.tableau.com/views/CaseStudyBellabeat_16792758135870/Dashboard2?:language=en-US&:display_count=n&:origin=viz_share_link)

#### Total Steps vs Calories

<table align = "center">
  <tr>
    <td><img src="images/Sheet 1.png" width="688" height="400" />
</table>

* Quite obvious that more Active the users are, more calories they burn.

#### Total time in Bed vs Total Minutes Asleep

<table align = "center">
  <tr>
    <td><img src="images/Sheet 2.png" width="688" height="400" />
</table>

* Total Minutes Asleep and Total Hours in Bed appear to be linearly related. So, the app should notify to go to sleep if Bellabeat users want to improve their sleep.

#### Average Steps vs Hour of the day

<table align = "center">
  <tr>
    <td><img src="images/Sheet 3.png" width="688" height="400" />
</table>

* Most users are active from 5 pm to 7 pm. We can encourage and notify users to be active or go for a run during those hours!

#### Total Minutes Asleep vs Sedentary Minutes

<table align = "center">
  <tr>
    <td><img src="images/Sheet 4.png" width="688" height="400" />
</table>

* Clearly a negative relation between the two metrics. The app itself can notify and recommend users to minimize sedentary minutes.

#### User type vs Calories

* We classify user type as:
1. avg_daily_steps < 5000 then "sedentary",
2. 7500 < avg_daily_steps >= 5000 then "lightly active",
3. 10000 < avg_daily_steps >= 7500 then "fairly active",
4. avg_daily_steps >= 10000 then "very active".

<table align = "center">
  <tr>
    <td><img src="images/Sheet 5.png" width="450" height="535" />
</table>

* Clearly, Very active users tend to burn most amount of calories with lower hinge calories burnt < 2000. What that essentially implies is that the very active users tend to burn more than the average daily calories burnt overall compared to the other types. This assumption is indeed a fair proposition.

#### User type vs Sleep Quality

<table align = "center">
  <tr>
    <td><img src="images/Sheet 6.png" width="450" height="535" />
</table>


* Interestingly, total minutes asleep turns out to be inversely propostional to activity level. However, most fairly active users tend to have a quality sleep pattern.

#### App Usage

<table align = "center">
  <tr>
    <td><img src="images/Sheet 7.png" width="462" height="348" />
</table>

* App usage has declined on average at the end of the 31 day interval. Users tend to not wear the tracker after a period of time.


### <ins> Act Phase </ins>

#### Key Takeaways to consider

* Users typically walk 7,637 steps per day, which is less than the 10,000 steps per day that the CDC advises. Users are sedentary/inactive for 70% of each day.

* The very active type sleeps the least whereas, the lightly active type sleeps the longest.

* 5pm - 7pm on average tends to be the most active time for most users.

* Users tend to wear the tracking devices the most for two weeks in a one month interval. Th usage decreases after the two week mark.

#### Recommendations for marketing

* Average sendentary time, as analysed, is too high (in the ballpark of 16-17 hours). The marketers must discover target oriented strategies to encourage clients to walk more by tracking their daily steps. These could include regular after-office-hours (5-7pm) alerts and target-oriented demographic statistical health goals.

* According to the dataset, an average person takes 7637 total steps every day, which is a touch too low considering daily Centers for Disease Control and Prevention/CDC (USA) recommendation of 10k steps a day. CDC discovered that walking 8,000 steps per day reduced the chance of death from all causes by 51%. A 65% decreased risk was linked to 12,000 steps per day compared to 4,000 steps per day. Bellabeat can persuade them to take at least 8,000 by highlighting the advantages to staying active for their overall health benefit.

* Controlling daily calorie intake is the best suggestion for people who want to lose weight. For daily meals, Bellabeat can offer some low-calorie recipe suggestions.

* As discovered that the more active a user is, the lower the sleep quality tends to be. The marketing team can emphasize on sleep alerts to the users having poor sleep patterns and vice versa. Optimal sleep hours for adults is 7 hours. Reducing sedentary times can also help with sleep quality.

* Bellabeat trackers may be more likely to be worn all day and night if they promote product design and qualities like light weight, long lasting batteries, water resistance etc.

This concludes our findings and few recommendations for our client Bellabeat.







