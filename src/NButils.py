import MySQLdb
import numpy as np
from numpy import array, zeros, asarray, empty

from queries import *

# Connect to database, query data, convert to numpy array
# return or optionally save if save_as filename is included
def nb2np(query,columns, lamb=lambda x: x, host="localhost", user="root",
          password="eleikobull", db_name="netizenbase", save_as=None):
    db = MySQLdb.connect(host, user, password, db_name)

    cursor = db.cursor()
    num_rows = cursor.execute(query)

    data = zeros((num_rows,columns))

    i = 0
    for row in cursor:
        row_array = asarray(row).T
        row_arr = lamb(row_array)
        if row_arr != empty(0):
            data[i,:] = row_arr
        i += 1
    
    db.close()

    if save_as is not None:
        np.save(save_as,data)

    return data

def post_locations():
    """
    Returns and saves a nx3 matrix, with each row corresponding to a post.
    The columns are topic, attitude, latitude, and longitude.
    """
    # Construct query
    cols = "taggit_tag.name, seeding_feed.attitude, seeding_wbuser.city"
    item_join = "INNER JOIN taggit_taggeditem" + \
            " ON taggit_taggeditem.object_id=seeding_repost.feed_id"
    tag_join = \
            "INNER JOIN taggit_tag ON taggit_tag.id=taggit_taggeditem.tag_id"
    user_join = "INNER JOIN seeding_wbuser" + \
            " ON seeding_wbuser.wbuserid=seeding_repost.wbuser_id"
    feed_join = "INNER JOIN seeding_feed" + \
            " ON seeding_feed.wbfeedid=seeding_repost.feed_id"

    query = "SELECT %s FROM seeding_repost %s %s %s %s;" \
            % (cols, item_join, tag_join, user_join, feed_join)

    return nb2np(query, 4, expand_location, save_as="locations")

def load_city_coords(city_path):
    city_coords = {}
    with open(city_path, 'r') as f: 
        for line in f:
            _, province, city, _, _, lat, lon, _, _, _ = \
                line.split(',')
            city = city.strip("\"")
            lat = lat.strip("\"")
            lon = lon.strip("\"")

            if city and lat and lon:
                city_coords[city] = (float(lat), float(lon))
    return city_coords
    
city_path="/Users/richard/classes/294-1/project/sql/meta_cities.txt"
city_coords = load_city_coords(city_path)

tag_dict = {"legitimacy": 0, "onechildpolicy": 1}

def expand_location(row):
    new = row
    tag = new[0]
    city = new[2]

    if tag in tag_dict:
        lat, lon = city_coords[city]

        new[0] = tag_dict[tag]
        new[2] = lat
        new = np.append(new, lon)
        return new
    else:
        return np.empty(0)




if __name__ == "__main__":
    post_locations()
