# nim-geocoding
This is a Library for Google Maps Geocoding API.
Currently it only supports getting Coordinates for a given address.

Example Program:
```nimrod
from geocoding import coordinates
from os import paramStr

var address = paramStr(1)
echo("The latittude is: ", coordinates(address)[0])
echo("The longitude is: ", coordinates(address)[1])
```
