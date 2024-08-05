import csv
import numpy as np
import plotly
import plotly.express as px
d=np.zeros((6,6))
k=0
with open('heat_map_data.csv', newline='') as f:
    reader = csv.reader(f)
    for row in reader:
        #print(len(str(row)))
        b=str(row)[3:104]
        c=b.split()
        for i in range(len(c)):
            d[k,i]=c[i]
        k+=1
fig = px.imshow(d,text_auto=True)
#fig.show()
plotly.offline.plot(fig, filename='temperature.html')
