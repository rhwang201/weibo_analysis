README


1.
Intro

The following original tweets (and their English tags, attitude) are included in this dump:

http://www.weibo.com/1830438495/zmiE7pqq2	反共, 合法性  legitimacy	3
http://www.weibo.com/1779749705/y7ojc5ifZ	二会, 合法性 legitimacy	2
http://www.weibo.com/1182415487/zmxjHsvOf	被代表  legitimacy	2
http://www.weibo.com/1097414213/zmxaon8q9	计划生育  onechildpolicy	2
http://www.weibo.com/2892948025/zlZk4nzKq	计划生育 onechildpolicy	2
http://www.weibo.com/1602334920/zlRJAAQtn	计划生育  onechildpolicy	2
http://www.weibo.com/1602334920/zmrF6c3ZT	计划生育  onechildpolicy	1
http://www.weibo.com/1195818302/zmePg2CJY	计划生育  onechildpolicy	1
http://www.weibo.com/1721825977/znw3dyfOB	GDP, 合法性, 精神危机  legitimacy	1
http://e.weibo.com/1414148492/znZf1lJtc	被代表, 合法性  legitimacy	1
http://www.weibo.com/1748019141/zn5xgiMV0	合法性, legitimacy	1

Attitude:  1-2-3 nuetral - moderate - radical

Authors and reposters are both modeled as Weibo users. An original tweet is modeled as a feed. Retweets for a feed are modeled as reposts, which have the feed ID as a foreing key.

Tags are modeled separately. Currently we only tag feeds, so there object id's for tags refer only to feeds. 

2.
Create a MySQL database that supports unicode
mysql> create database netizenbase DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;


3. By using the following syntax:

mysql netizenbase < ~/cdt/seeding_wbuser_authors.sql

load the SQL dump in the following order (because of the dependencies):

seeding_wbuser_authors.sql
seeding_wbuser_reposters.sql
seeding_feed.sql
seeding_repost.sql
taggit_tag.sql
taggit_taggeditem.sql

