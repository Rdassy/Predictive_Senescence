# **<p align="center">Predictive Senescence</p>** 
---
<br/><br/>
## **<p align="center">Why choose Senescence?</p>**

In the early 1970's, Soviet theorist Alexei Olovnikov recognized that according to the scientific models of the time, chromosomes are not able to replicate their ends. The ends of the chromosomes are called telomeres, and they have been studied since this discovery to figure what the implications of this imperfect replication are. Through the years, it has been hypothesized that telomeres are associated with the process of aging, also called senescence. Studying senescence could lead to discoveries in advanced Age Therapy as well as potentially the reversal of the aging process.

This project was an attempt to determine the relationship of health and environmental factors on telomere length and vice versa. To do so, a large dataset containing telomere measurments for individual of a species taken throughout their lifetime was needed. This project used a study of the warbler bird population on the Cousin Island of Seychelles, off the coast of Africa. For more context on this study, please see [this document](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Data/Bird_Data/BirdData_README.docx)
  <br/><br/>

## **<p align="center">Description of the data source</p>**

![Seychelles Warbler - Photo by Chong Boon Leong](https://user-images.githubusercontent.com/76575162/133174385-668707e5-8097-49fb-8998-21ec680a55eb.jpg)
<em>Seychelles Warbler - Photo by Chong Boon Leong</em>

The data came from [this source](https://data.world/datagov-uk/e102ccd7-cd2a-4e73-8fe2-ec3f5f415ae5). The supplemental information file contains the following description and sources:

"Detailed in (Sparks et al., 2021): “The Seychelles warbler is a small passerine endemic to the Seychelles archipelago (Komdeur et al., 1991). The entire population (~320 adult individuals in 115 territories) on Cousin island (29 ha; 04°20′S, 55°40′E) has been monitored intensively since 1985 (Hammers et al., 2019; Komdeur, 1992; Raj Pant et al., 2019; Richardson et al., 2007).”, “Since 1990, blood samples (~25 μl) have been taken and stored at room temperature in absolute ethanol, thus allowing …. telomere length measurement (Barrett et al., 2013).” “We used the telomere data set generated in Spurgin et al. (2018), which included birds caught and blood sampled between 1995 and 2014, when the data were most complete. RTL was estimated using qPCR (quantitative polymerase chain reaction; Barrett et al., 2013; Bebbington et al., 2016; Spurgin et al., 2018). DNA integrity (agarose gel) and 260/280 ratios were checked in all samples before running any qPCR, and any samples with signs of degradation were removed, reextracted and checked again.” "

The data set contains the data collected from all the the aforementioned studies and includes the telomere length measurements we are interested in.

<br/><br/>

## **<p align="center">Hypotheses and questions to be answered with the data</p>**

### Hypothesis

There is a positive correlation between telomere length and survival

### Questions:

- Does the telomere length decrease over time for each bird? If yes, is the rate similar?
- Is there a correlation between telomere length and the age class of the birds?

<br/><br/>
## **<p align="center">Presentation</p>**
---
This project includes a Google Slides which can be found here: [Predective Senescence Presentation](https://docs.google.com/presentation/d/1L9v7cA1KCoQ5ybVa5znx3wh-Nd-GpyE_nK2fvRqJfrA/edit?usp=sharing)

## **<p align="center">Database</p>**

After acquiring the aforementioned data file, the following ERD was used to create the postgreSQL database the project required. The SQL code to set up the database can be found [in the SQL files folder](https://github.com/MuzX9p088KKe/Predictive_Senescence/tree/main/Resources/Data/Formatting/SQL%20Files).
![Database_ERD](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Data/Formatting/Schema_ERD.png?raw=true)

The database hosted in AWS RDS and it is connected to our modeling code via psycopg2 for input of data. In order to access the data stored on their RDS instance, the user would have to rename [this text file](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/RENAME_ME.txt) "config.py" located in the notebook folder and fill the database password as intructed in the document. It will also be necessary to change the psycopg2.connect arguments to match the user's RDS instance. The connection steps are shown in [this video](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Data/How%20to%20connect%20to%20AWS%20Server.mp4).

The code in the [telomere rate of change notebook](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/teloRateOfChange.ipynb) includes two sections that are commented out as it is only needed for the first time the script is run.

<br/><br/>
## **<p align="center">Machine Learning Models</p>**

[Hierarchical Cluster model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/HierarchicalClusteronly.ipynb) uses telomere length to determine age class. It uses the hierarchical cluster model with KMeans. The model includes class labels chick, juvenile, and adult. 
<br/><br/>

[Categorical Machine Learning model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/RandomForest.ipynb) uses telomere length to determine age class. It uses the Random Forest model. The model includes class labels chick, juvenile, and adult, which out perfromed the [Logistic Regression](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/newLogisticRegression.ipynb) model that used Age class with only Young and Adult classification. 
<br/><br/>

[Continuous Machine Learning model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/teloRateOfChange.ipynb) initially used the rate at which Telomeres change in an individual to determine the amount of aging observed. It used a linear regression model with some feaure engineering to optimize our correlation. After noticing a megaphone data distribution, the Box Cox algorithm was applied to best demonstrate the linear correlation between telomere lengthe rate of change and bird age.
<br/><br/>

## **<p align="center">Tableau</p>**

### Dashboard

In order to effectively present findings, some key indicators were displayed in the following Tableau dashboard:

[Predictive Senescence - Tableau Story](https://public.tableau.com/views/Predictive_Senescence/PredictiveSenescence?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)

### Interactive elements

Tableau allows the use of interactive elements that provide tools to further explore data without the need for new charts.

e.g. Within our Grouped Classes by Age dashboard,  a cursor selection is possible to be more selective with the data. This allows users to "zoom in" into the scatter plot to further differentiate birds with high RTL and short average Age as shown below:

![Dashboard Blueprint](/Resources/Images/Interactive_Element1.png)
<br/><br/>

![Dashboard Blueprint](/Resources/Images/Interactive_Element2.png)

<br/><br/>

## **<p align="center">Potential future research</p>**

For the sake of meeting deadlines, this project was fairly limited in scope. There are still many questions which may require further investigation among which are the following:

- How do environmental factors change telomere length?
- Does the presence of dominant birds influence survival rates of the other birds?
- Does pedigree influence telomere length?

<br/><br/>

## **<p align="center">Contributors</p>**

### <p align="center">Our team ([emoji key](https://allcontributors.org/docs/en/emoji-key)):</p>

<table align= "center">
  <tr>
    <td align="center"><a href="https://github.com/Jamesrx33"><img src="https://avatars.githubusercontent.com/u/68870179?v=4?s=100" width="100px;" alt=""/><br /><sub><b>James Bell</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=Jamesrx33" title="Code">💻</a> <a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/pulls?q=is%3Apr+reviewed-by%3AJamesrx33" title="Reviewed Pull Requests">👀<a href="#ideas-Jamesrx33" title="Ideas, Planning, & Feedback">🤔</a><span title="Data">🔣</span><span title="Research">🔬</span></td>
    <td align="center"><a href="https://github.com/kermitbravo"><img src="https://avatars.githubusercontent.com/u/24511616?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kermit Bravo</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=kermitbravo" title="Code">💻</a><a href="#design-kermitbravo" title="Design">🎨</a><a href="#ideas-kermitbravo" title="Ideas, Planning, & Feedback">🤔</a><span title="Research">🔬</span></td>
    <td align="center"><a href="https://github.com/MuzX9p088KKe"><img src="https://avatars.githubusercontent.com/u/76575162?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Robin Dassy</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=MuzX9p088KKe" title="Code">💻</a> <a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/pulls?q=is%3Apr+reviewed-by%3AMuzX9p088KKe" title="Reviewed Pull Requests">👀</a> <a href="#ideas-MuzX9p088KKe" title="Ideas, Planning, & Feedback">🤔</a><span title="Research">🔬</span></td>
    <td align="center"><a href="https://github.com/Khodge15"><img src="https://avatars.githubusercontent.com/u/82460401?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kari Hodge</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=Khodge15" title="Code">💻</a><a href="#ideas-Khodge15" title="Ideas, Planning, & Feedback">🤔</a><span title="Data">🔣</span><span title="Research">🔬</span></td>
  
  </tr>
 </table>
 <br/><br/>
  
  ### <p align="center">Special Thanks:</p>
  
  <table align= "center">
    <tr>
      <td align="center"><sub><b>Jakob Akhmerov</b></sub><br /><span title="Ideas, Planning, & Feedback">🤔</span></td>
      <td align="center"><sub><b>Artem Bordetskiy</b></sub><br /><span title="Mentoring">🧑‍🏫</a><Span title="Ideas, Planning, & Feedback">🤔</span></td>
      <td align="center"><sub><b>Trent Little</b></sub><br /><span title="Ideas, Planning, & Feedback">🤔</span></td>
      <td align="center"><sub><b>Jackson Sheppard</b></sub><br /><span title="Ideas, Planning, & Feedback">🤔</span></td>
      <td align="center"><sub><b>Klaus Smit</b></sub><br /><span title="Mentoring">🧑‍🏫</span><span title="Ideas, Planning, & Feedback">🤔</span></td>
    </tr>
  </table>
 
