import squarify
import matplotlib.pyplot as plt

def lab9c():
    sizes=[663267.26, 268580.82, 163695.57, 147042.40, 121589.48, 113998.30, 110560.71, 104093.57, 98380.64, 97813.56]
    label=["Alaska","Texas","California","Montana","NewMexico","Arizona","Nevada","Colorado","Oregon","Wyoming"]
    color=['red','palegreen','green','lawngreen','yellow','orange','lightskyblue','cyan','purple','aquamarine']
    squarify.plot(sizes=sizes,label=label,color=color,alpha=0.6)
    plt.title('Treemap of 10 Largest States of US')
    plt.axis('off')
    plt.show()

