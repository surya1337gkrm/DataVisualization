import pandas
import matplotlib.pyplot as plt
from pandas.plotting import parallel_coordinates

def lab9d():
    data=pandas.read_csv('iris.csv',sep=',')
    parallel_coordinates(data,'Name',color=('red','blue','yellow'))
    plt.title('Parallel Coordinates of IRIS Data')
    plt.show()

lab9d()