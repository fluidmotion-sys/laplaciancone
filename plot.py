import plotly.express as px
import pandas as pd
import numpy as np
from IPython.display import display
df = pd.read_csv('heat_map_data.csv')
j = 0
b = 0
z = [[ 3,  3,  1,  2,  3,  4],  #float(a.split()[1])
     [ 5,  6,  7,  8,  9, 10],
     [11, 12, 13, 14, 15, 16],
     [17, 18, 19, 20, 21, 22],
     [23, 24, 25, 26, 27, 28],
     [29, 30, 31, 32, 33, 34]]
y=z
l=0
#display(df)
for x in df.to_numpy():
  a = str(df.to_numpy()[j])
  b = float(a.split()[1])
  #print("map =", b)
  j += 1
  for l in range(6-l):
      y = z[l][j]
  #print("y = ", y)
fig = px.imshow(z)
fig.show()
