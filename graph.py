
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv('csvdataBB.csv')

df.plot(kind='bar')

plt.title('Blue Bikes M.Hendrikaplein')
plt.xlabel('Tijd')
plt.ylabel('Aantal fietsen')

plt.xticks(rotation=360)

plt.show()
