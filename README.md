# nim-geocoding
This is a Library for Google Maps Geocoding API.
Currently it only supports getting Coordinates, a formatted address and reverse Geocoding. You can use an public API key if you want (Optional).
You can find addtional documentation at http://saratchandra92.github.io/nim-geocoding

Example Program 1:

```nimrod
from geocoding import coordinates
from os import paramStr

var address = paramStr(1)
echo("The latittude is: ", coordinates(address)[0])
echo("The longitude is: ", coordinates(address)[1])
```

Example Program 2:

```nimrod
from geocoding import coordinates
from os import paramStr

var address = paramStr(1)
apiKey = "Ab2ksk2nHSh2kkk2k1kk2jakw"
echo("The latittude is: ", coordinates(address=address, apiKey=apiKey)[0])
echo("The longitude is: ", coordinates(address=address, apiKey=apiKey)[1])
```

Example Program 3:

```nimrod
from geocoding import formattedAddress
from os import paramStr

var address = paramStr(1)
apiKey = "Ab2ksk2nHSh2kkk2k1kk2jakw"
echo("The formatted address is: ", formattedAddress(address=address, apiKey=apiKey))
```

Example Program 4:

```nimrod
from geocoding import reverseGeocode

apiKey = "Ab2ksk2nHSh2kkk2k1kk2jakw"
latitude = 24.2354
longitude = 12.56923
echo("The address is: ", reverseGeocode(lat=latitude, lng=longitude, apiKey=apiKey))
```