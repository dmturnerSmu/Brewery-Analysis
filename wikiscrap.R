library('rvest')

html = read_html('https://en.wikipedia.org/wiki/List_of_railway_stations_in_India')

a_list = html_nodes(html, ".wikitable")

a_df= html_table(a_list[[2]][2])

print(a_df)l