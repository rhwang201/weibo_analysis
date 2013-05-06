


# select top 30 reposts, show user_id and feed_id
top30reposts = """SELECT wbuser_id, feed_id, reposts_count FROM seeding_repost ORDER BY reposts_count DESC LIMIT 30;"""

# Query for joining tagged_items with their tags
"""SELECT name, taggit_taggeditem.id, taggit_taggeditem.content_type_id, taggit_tag.id FROM taggit_taggeditem INNER JOIN taggit_tag ON taggit_taggeditem.tag_id=taggit_tag.id;"""

# Query to get, for each feed,
feed_columns = ["object_id", 
                "attitude", 
                "author_id", 
                "name", 
                "taggit_tag.id", 
                "reposts_count"]
feeds = """SELECT %s FROM seeding_feed INNER JOIN taggit_taggeditem ON seeding_feed.wbfeedid=taggit_taggeditem.object_id INNER JOIN taggit_tag ON taggit_taggeditem.tag_id=taggit_tag.id;""" % (", ".join(feed_columns))

#
users_columns = "wbuserid, screen_name, gender, lang, city, province, verified_type, bi_followers_count, followers_count, friends_count, statuses_count"
users = """SELECT %s FROM seeding_wbuser LIMIT 100;""" % (users_columns)




#####
# WTF

cols = "text, wbfeedmid"
test = """SELECT %s FROM seeding_feed""" % (cols)

t_cols = "id, name, slug"
t_test = """SELECT %s FROM taggit_tag""" % (t_cols)

tt_cols = "id, tag_id, object_id, content_type_id" 
tt_test = """SELECT %s FROM taggit_taggeditem""" % (tt_cols)

u_cols = "province, city, location"
u_test = """SELECT %s FROM seeding_wbuser""" % (u_cols)
