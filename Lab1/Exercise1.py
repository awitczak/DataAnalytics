import pandas as pd
import matplotlib.pyplot as plt

# importing the csv file, 1st column set as index
data = pd.read_csv(r'C:\Users\awitc\Desktop\DataAnalytics\Lab1\Data1.csv', index_col = 0, parse_dates=True)

# plot columns as time series
data.plot()
plt.show()

# plot histograms
data.hist()
plt.show()

# plot Kernel Density Estimators
data.plot.kde()
plt.show()

# filtering columns
filtered_data = data.loc['20180101':'20181231', 'theta_1':'theta_4']

# repeat plots
filtered_data.plot()
plt.show()

filtered_data.hist()
plt.show()

filtered_data.plot.kde()
plt.show()

