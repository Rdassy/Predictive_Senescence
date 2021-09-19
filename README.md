# **<p align="center">Predictive Senescence</p>** <br/><br/>

## **<p align="center">Why did we choose Senescence?</p>**

We are interested in determining the relationship of health and environmental factors on telomere length or vice versa.

- In particular, we will be exploring the warbler bird population on the Cousin Island of Seychelles of the coast of Africa.
  <br/><br/>

## **<p align="center">Describe the source of the data</p>**

![Seychelles Warbler - Photo by Chong Boon Leong](https://user-images.githubusercontent.com/76575162/133174385-668707e5-8097-49fb-8998-21ec680a55eb.jpg)
<em>Photo by Chong Boon Leong</em>

The data came from [this source](https://data.world/datagov-uk/e102ccd7-cd2a-4e73-8fe2-ec3f5f415ae5). The supplemental information file contains the following description and sources:

"Detailed in (Sparks et al., 2021): “The Seychelles warbler is a small passerine endemic to the Seychelles archipelago (Komdeur et al., 1991). The entire population (~320 adult individuals in 115 territories) on Cousin island (29 ha; 04°20′S, 55°40′E) has been monitored intensively since 1985 (Hammers et al., 2019; Komdeur, 1992; Raj Pant et al., 2019; Richardson et al., 2007).”, “Since 1990, blood samples (~25 μl) have been taken and stored at room temperature in absolute ethanol, thus allowing …. telomere length measurement (Barrett et al., 2013).” “We used the telomere data set generated in Spurgin et al. (2018), which included birds caught and blood sampled between 1995 and 2014, when the data were most complete. RTL was estimated using qPCR (quantitative polymerase chain reaction; Barrett et al., 2013; Bebbington et al., 2016; Spurgin et al., 2018). DNA integrity (agarose gel) and 260/280 ratios were checked in all samples before running any qPCR, and any samples with signs of degradation were removed, reextracted and checked again.” "

The data set we used contains the data collected from all the the aforementioned studies and includes the telomere length measurements we are interested in.

<br/><br/>

## **<p align="center">Formulate hypotheses / questions to be answered with the data</p>**

### Hypothesis

Alternative Hypothesis - There is a positive correlation between telomere length and survival

### Questions:

- How do environmental factors change telomere length?
- Does the presence of dominant birds influence survival rates of the other birds?
- Is there a correlation between telomere length and the age class of the birds?
- Does the telomere length decrease over time for each bird? If yes, is the rate similar?
- Does pedigree influence telomere length?

### Machine Learning Model

[The provisional Machine Learning model](https://github.com/MuzX9p088KKe/Predictive_Senescence/blob/main/Resources/Notebook/hierarchicalCluster.ipynb) uses telomere length to determine age class. It uses the hierarchical cluster model with KMeans. THe model includes class labels chick, juvenile, and adult. Our database is stored on AWS and connected via psycopg2.
<br/><br/>

### Dashboard

## The right tool to visualize our predictive senescence data

For this project we decided to build an interactive dashboard. The tool that we picked for this was Tableau given it's robust visualizations and it's native PostgresSQL integration capabilities.

Tableau is a visual analytics platform that allows people and organizations to be more data-driven. For more about Tableau please go [here.](https://www.tableau.com/why-tableau/what-is-tableau)

## Blueprint & Storyboard

In order to effectively build our dashboard, we decided to compare a few key indicators as shown below:

![Dashboard Blueprint](/Resources/Images/Dashboard_Blueprint.png)

## Dashboard

[Predictive Senescence - Tableau Story](https://public.tableau.com/views/Predictive_Senescence/PredictiveSenescence?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)

# Interactive elements

Tableau allows us to use interactive elements that provide analysts to further explore data without having to create new charts.

e.g. Within our Grouped Classes by Age dashboard, we can do a cursor selection to drill-down into the data. This allows us to "zoom in" into the scatter plot to further differentiate birds with high RTL and short average Age as shown below:

![Dashboard Blueprint](/Resources/Images/Interactive_Element1.png)
<br/><br/>

![Dashboard Blueprint](/Resources/Images/Interactive_Element2.png)
<br/><br/>

This is just one example of how Tableau allows users to interact with different elements in our data but there are many more. For more information please go [here.](https://help.tableau.com/current/pro/desktop/en-us/actions_dashboards.htm)

<br/><br/>

## **<p align="center">Communication Protocols </p>**

For this project, our main communication protocols are:

1. Slack - Used for most information sharing and group communication

2. Colaborative Google Docs - These will be use to keep track of information exchanged during brainstorming sessions and to build of presentation elements. The files can be viewed using the following links:

- [Brainstorming](https://docs.google.com/document/d/1MGxBJxMPExYl-iUV2lnuVSc6y_O8LIk3iAu2WnsP-tg/edit).
- [Presentation](https://docs.google.com/presentation/d/1L9v7cA1KCoQ5ybVa5znx3wh-Nd-GpyE_nK2fvRqJfrA/edit?usp=sharing).

4. Class Time - Zoom meetings every Monday and Friday 7-9 PM CST. This time will be used to brainstorm and work on elements needing more interaction between team members.

5. [Github](https://github.com/MuzX9p088KKe/Predictive_Senescence) - This repository will be used to gather all the code and data relevant to the project.
