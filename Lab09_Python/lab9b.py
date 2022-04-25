from matplotlib import pyplot as plt
def lab9b():
    x=[5,2,4,9,7]
    y=[10,5,8,4,2]

    plt.subplot(1,2,1)
    plt.bar(x,y)
    plt.title('Bar Graph Demonstration')
    plt.subplot(1, 2, 2)
    plt.plot(x,y)
    plt.title('Line Chart Representation')
    plt.show()


