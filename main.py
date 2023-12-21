from bs4 import BeautifulSoup
import lxml
import requests


reponse=requests.get('https://www.citypopulation.de/en/india/telangana/')
yc_web_page=reponse.text

soup=BeautifulSoup(yc_web_page,"html.parser")
#print(soup.title)
title=soup.find(name="span",class_="smalltext")
#print(title.text)
#data_frame_col_heading=soup.select('#tr #tsh')

data_frame_col_heading=soup.find(name="tr",id="tsh").find_all("th")
#print(data_frame_col_heading)
column_head=[]
for col in data_frame_col_heading:
    column_head.append(col.text)

column_head=column_head[0:len(column_head)-1]
print(column_head)

rows=soup.find(name="table",id="ts").find(name="tbody").select("tr")
#print(rows[0].findAll("td")[5].text)

data=[]
row=[]
for r in range(0,len(rows)):

    for c in range(0,len(rows[r].find_all("td"))-1):

        row.append(rows[r].find_all("td")[c].text)

    data.append(row)
    row=[]


print(data)

import pandas as pd

df=pd.DataFrame(data,columns=column_head)
#print(df.head())
df=df[['District','PopulationCensus2011-03-01']]
print(df.head())
population_data_csv=df.to_csv('population_data_csv.CSV',index=True)
"""""
columnns=[]
data=[]
row=[]
count=0
i=0
j=0
item=0
data_frame_rows=soup.find_all(name="td",class_="ds-min-w-max")

while item < len(data_frame_rows):
    if count==0 and i<7:
        columnns.append(data_frame_rows[item].text)
        item+=1
        i+=1
    elif j<7:
        row.append(data_frame_rows[item].text)
        j+=1
        item+=1
    elif len(row)>=7:
        data.append(row)
        j=0
        row=[]

print(columnns)
print(data)

import pandas as pd

df=pd.DataFrame(data,columns=columnns)
print(df.head())
final_data_csv=df.to_csv('T20_MATCH_RESULTS.CSV',index=True)
"""""


