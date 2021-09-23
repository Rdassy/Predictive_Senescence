# **<p align="center">Predictive Senescence</p>** <br/><br/>

## **<p align="center">Why did we choose Senescence?</p>**

In the early 1970's, Soviet theorist Alexei Olovnikov recognized that according to the scientific models of the time, chromosomes are not able to replicate their ends. The ends of the chromosomes are called telomeres, and they have been studied since this discovery to figure what the implications of this imperfect replication are. Through the years, it has been hypothesized that telomeres are associated with the process of aging, also called senescence.

We are interested in determining the relationship of health and environmental factors on telomere length or vice versa. To do so, we looked for a large dataset containing telomere measurments for individual of a species taken throughout their lifetime.

After looking finding a suitable data set, we decided to use a study of the warbler bird population on the Cousin Island of Seychelles, off the coast of Africa.
  <br/><br/>

## **<p align="center">Description of the data source</p>**

![Seychelles Warbler - Photo by Chong Boon Leong](https://user-images.githubusercontent.com/76575162/133174385-668707e5-8097-49fb-8998-21ec680a55eb.jpg)
<em>Photo by Chong Boon Leong</em>

The data came from [this source](https://data.world/datagov-uk/e102ccd7-cd2a-4e73-8fe2-ec3f5f415ae5). The supplemental information file contains the following description and sources:

"Detailed in (Sparks et al., 2021): “The Seychelles warbler is a small passerine endemic to the Seychelles archipelago (Komdeur et al., 1991). The entire population (~320 adult individuals in 115 territories) on Cousin island (29 ha; 04°20′S, 55°40′E) has been monitored intensively since 1985 (Hammers et al., 2019; Komdeur, 1992; Raj Pant et al., 2019; Richardson et al., 2007).”, “Since 1990, blood samples (~25 μl) have been taken and stored at room temperature in absolute ethanol, thus allowing …. telomere length measurement (Barrett et al., 2013).” “We used the telomere data set generated in Spurgin et al. (2018), which included birds caught and blood sampled between 1995 and 2014, when the data were most complete. RTL was estimated using qPCR (quantitative polymerase chain reaction; Barrett et al., 2013; Bebbington et al., 2016; Spurgin et al., 2018). DNA integrity (agarose gel) and 260/280 ratios were checked in all samples before running any qPCR, and any samples with signs of degradation were removed, reextracted and checked again.” "

The data set contains the data collected from all the the aforementioned studies and includes the telomere length measurements we are interested in.

<br/><br/>

## **<p align="center">Formulate hypotheses / questions to be answered with the data</p>**
---

### Hypothesis

There is a positive correlation between telomere length and survival

### Questions:

- How do environmental factors change telomere length?
- Does the presence of dominant birds influence survival rates of the other birds?
- Is there a correlation between telomere length and the age class of the birds?
- Does the telomere length decrease over time for each bird? If yes, is the rate similar?
- Does pedigree influence telomere length?

## **<p align="center">Presentation</p>**
---
Our presentation is in Google Slides and can be found here: [Predective Senescence Presentation](https://docs.google.com/presentation/d/1L9v7cA1KCoQ5ybVa5znx3wh-Nd-GpyE_nK2fvRqJfrA/edit?usp=sharing)

## **<p align="center">Database</p>**
---
![Database_ERD](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Data/Formatting/Schema_ERD.png?raw=true)

We have a postgreSQL database hosted in AWS. It is connected to our modeling code via psycopg2 for input of data.

### **<p align="center">Machine Learning Models</p>**
---

[Our Hierarchical Cluster model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/HierarchicalClusteronly.ipynb) uses telomere length to determine age class. It uses the hierarchical cluster model with KMeans. THe model includes class labels chick, juvenile, and adult. Our database is stored on AWS and connected via psycopg2.
<br/><br/>

[Our Categorical Machine Learning model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/RandomForest.ipynb) uses telomere length to determine age class. It uses the Random Forest model. The model includes class labels chick, juvenile, and adult, which out perfromed the [Logistic Regression](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/newLogisticRegression.ipynb) model that used Age class with only Young and Adult classification. Our database is stored on AWS and connected via psycopg2.
<br/><br/>

[Our Continuous Machine Learning model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/teloRateOfChange.ipynb) uses the rate at which Telomeres change in an individual to determine the amount of aging observed. It uses a linear regression model with some feaure engineering to optimize our correlation.
<br/><br/>

## **<p align="center">Dashboard</p>**
---
### The right tool to visualize our predictive senescence data

For this project we decided to build an interactive dashboard. The tool that we picked for this was Tableau given it's robust visualizations and it's native PostgresSQL integration capabilities.

Tableau is a visual analytics platform that allows people and organizations to be more data-driven. For more about Tableau please go [here.](https://www.tableau.com/why-tableau/what-is-tableau)

### Blueprint & Storyboard

In order to effectively build our dashboard, we decided to compare a few key indicators as shown below:

![Dashboard Blueprint](/Resources/Images/Dashboard_Blueprint.png)

### Dashboard

[Predictive Senescence - Tableau Story](https://public.tableau.com/views/Predictive_Senescence/PredictiveSenescence?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)

### Interactive elements

Tableau allows us to use interactive elements that provide analysts to further explore data without having to create new charts.

e.g. Within our Grouped Classes by Age dashboard, we can do a cursor selection to drill-down into the data. This allows us to "zoom in" into the scatter plot to further differentiate birds with high RTL and short average Age as shown below:

![Dashboard Blueprint](/Resources/Images/Interactive_Element1.png)
<br/><br/>

![Dashboard Blueprint](/Resources/Images/Interactive_Element2.png)
<br/><br/>

This is just one example of how Tableau allows users to interact with different elements in our data but there are many more. For more information please go [here.](https://help.tableau.com/current/pro/desktop/en-us/actions_dashboards.htm)

<br/><br/>

## **<p align="center">Contributors</p>**

### <p align="center">Our team ([emoji key](https://allcontributors.org/docs/en/emoji-key)):</p>

<table align= "center">
  <tr>
    <td align="center"><a href="https://github.com/Jamesrx33"><img src="https://avatars.githubusercontent.com/u/68870179?v=4?s=100" width="100px;" alt=""/><br /><sub><b>James Bell</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=Jamesrx33" title="Code">💻</a> <a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/pulls?q=is%3Apr+reviewed-by%3AJamesrx33" title="Reviewed Pull Requests">👀<a href="#ideas-Jamesrx33" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/kermitbravo"><img src="https://avatars.githubusercontent.com/u/24511616?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kermit Bravo</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=kermitbravo" title="Code">💻</a><a href="#design-kermitbravo" title="Design">🎨</a></td>
    <td align="center"><a href="https://github.com/MuzX9p088KKe"><img src="https://avatars.githubusercontent.com/u/76575162?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Robin Dassy</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=MuzX9p088KKe" title="Code">💻</a> <a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/pulls?q=is%3Apr+reviewed-by%3AMuzX9p088KKe" title="Reviewed Pull Requests">👀</a> <a href="#ideas-MuzX9p088KKe" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/Khodge15"><img src="https://avatars.githubusercontent.com/u/82460401?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kari Hodge</b></sub></a><br /><a href="https://github.com/MuzX9p088KKe/Predictive_Senescence/commits?author=Khodge15" title="Code">💻</a>
  
  </tr>
 </table>
 <br/><br/>
  
  ### <p align="center">Special Thanks:</p>
  
  <table align= "center">
    <tr>
      <td align="center"><sub><b>Jakob Akhmerov</b></td>
      <td align="center"><sub><b>Artem Bordetskiy</b></td>
      <td align="center"><sub><b>Trent Little</b></td>
      <td align="center"><sub><b>Jackson Sheppard</b></td>
      <td align="center"><sub><b>Klaus Smit</b></td>
    </tr>
  </table>
 
