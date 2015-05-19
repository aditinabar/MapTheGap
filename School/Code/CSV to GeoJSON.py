import csv

# Read in raw data from csv
rawData = csv.reader(open('Aditi_Addresses.csv', 'rb'), dialect='excel')

# the template. where data from the csv will be formatted to geojson
template = \
    ''' \
    { "type" : "Feature",
        "geometry" : {
            "type" : "Point",
            "coordinates" : ["Latitude","Longitude"]},
        "properties" : { "Address" : "Address", "City" : "City",
                        "State" : "State", "Zip" : "Zip"}
        }
    '''

# the head of the geojson file
output = \
    ''' \
{ "type" : "Feature Collection",
    {"features" : [
    {
    "type": "Feature",
    "geometry": {
        "type" : "Point",
        "coordinates" : ["Latitude" : "Longitude"]
        },
        "properties" : {"Address" : "Address", "City" : "City",
                        "State" : "State", "Zip" : "Zip"}
        }
    }
    '''

# loop through the csv by row skipping the first
iter = 0
for row in rawData:
    iter += 1
    if iter >= 2:
        lat = row[4]
        lon = row[5]
        add = row[0]
        pop = row[4]
        output += template % (row[0], row[2], row[1], row[3], row[4])
        
# the tail of the geojson file
output += \
    ''' \
    ]
}
    '''
    
# opens an geoJSON file to write the output to
outFileHandle = open("output.geojson", "w")
outFileHandle.write(output)
outFileHandle.close()