\\ post2.gp -- POST HOC continuation of post.gp (first five items in post_out_part1.txt; l = 23, m = 345 and l = 59, m = 177 dropped as too slow).
default(parisizemax, 6000000000);
read("vectors/vG_level/gl2.gp");
{ foreach([[31, 93], [37, 37], [17, 17], [19, 19], [17, 51], [23, 23], [31, 31], [17, 21], [19, 15]], it, gone("POST", it[1], it[2], 100)); }
