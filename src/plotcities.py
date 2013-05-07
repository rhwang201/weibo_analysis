from matplotlib.mlab import prctile_rank
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap as Basemap

import numpy as np

from NButils import load_city_coords

import sys
from random import shuffle

tude_colors = {1.0:(0,0,1), 2.0:(1,1,0), 3.0:(1,0,0)}

# TODO Maybe add noise to avoid overlap...is that why no reds show up?
def plot_weibo(where):
    if where == "world":
        m = Basemap(projection='merc',
                llcrnrlat=-60,urcrnrlat=75,
                llcrnrlon=-180,urcrnrlon=180,lat_ts=20)
        m.drawmapboundary(fill_color='aqua')
        m.drawcountries()
        m.fillcontinents(color='coral',lake_color='aqua')
        m.drawcoastlines()
        s = 50
    elif where == "china":
        m = Basemap(projection='mill',
                llcrnrlon=73. ,llcrnrlat=20,
                urcrnrlon=135. ,urcrnrlat=55.)
        m.drawcountries()
        m.shadedrelief()
        s = 20
    elif where == "cuba":
        m = Basemap(projection='mill',
                llcrnrlon=-85. ,llcrnrlat=15,
                urcrnrlon=-63. ,urcrnrlat=30)
        m.drawcountries()
        m.shadedrelief()
        s = 20
    elif where == "europe":
        m = Basemap(projection='mill',
                llcrnrlon=-14. ,llcrnrlat=33,
                urcrnrlon=34. ,urcrnrlat=62)
        m.drawcountries()
        m.shadedrelief()
        s = 20
    plt.title('Weibo Post Locations')

    locations = np.load('/Users/richard/classes/294-1/project/src/locations.npy')

    lon, lat = locations[:, 3], locations[:, 2]
    x, y = m(lon, lat)

    colors = []
    for row in locations:
        attitude = row[1]
        if row[0] == 0:
            colors.append(tude_colors[attitude])
            #colors.append((1,1-attitude/3, 0))
            #colors.append((0,0, 0.3 + 7*attitude/30))
        #else:
        #    colors.append((0.3 + 7*attitude/30,0,0))
        #    colors.append((0.3 + 7*attitude/30,0,0))

    m.scatter(x,y,color=colors,s=s,marker=".")
    print 'scattered'

    if where == "china":
        lats = [23, 30, 30, 40]
        lons = [113, 106, 120, 116]
        cities = ['Guangzhou', 'Chongqing', 'Shanghai', 'Beijing']
        x,y = m(lons, lats)
        m.plot(x,y,'wo')
        for name,xpt,ypt in zip(cities,x,y):
            plt.text(xpt+50000,ypt-250000,name,color='black')
        print 'cities plotted'

    plt.show()

def plot_cities():
    path = "/Users/richard/classes/294-1/project/sql/meta_cities.txt"
    city_coords = load_city_coords(path)
    coords = city_coords.values()

    m = Basemap(projection='mill',
            llcrnrlon=70. ,llcrnrlat=20,
            urcrnrlon=135. ,urcrnrlat=53.)

    m.drawcountries()
    m.shadedrelief()

    unzipped = [list(t) for t in zip(*coords)]
    lat, lon = unzipped[0], unzipped[1]
    x, y = m(lon, lat)
    m.scatter(x,y,s=25)
    plt.show()

def plot_evolution():
    m = Basemap(projection='mill',
            llcrnrlon=73. ,llcrnrlat=20,
            urcrnrlon=135. ,urcrnrlat=55.)
    m.shadedrelief()
    plt.title('Evolution of a Feed')

    evolution = np.load('/Users/richard/classes/294-1/project/src/locations.npy')

    lon, lat = locations[:, 3], locations[:, 2]
    x, y = m(lon, lat)

    #zipped = zip(x,y)
    #shuffle(zipped)
    #unzipped = [list(t) for t in zip(*zipped)]
    #x, y = unzipped[0], unzipped[1]

    colors = []
    i = 0
    for row in locations:
        if row[0] == 0:
            colors.append('b')
        else:
            i += 1
            colors.append('r')

    m.scatter(x,y,color=colors,s=20,marker="o")

    plt.show()


if __name__ == "__main__":
    argv = sys.argv
    if argv[1] == "posts":
        plot_weibo(argv[2])
    elif argv[1] == "cities":
        plot_cities()
