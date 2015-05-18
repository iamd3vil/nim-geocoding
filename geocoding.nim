import json, os, httpclient, cgi

proc coordinates*(address: string): seq[float] = 
    ## Takes an address and returns a sequence of latitutde and longitude
    var baseurl = "http://maps.googleapis.com/maps/api/geocode/json"
    var path = baseurl & "?address=" & encodeUrl(address) & "&sensor=false"
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    var lat = getFNum(parsed_json["results"][0]["geometry"]["location"]["lat"])
    var long = getFNum(parsed_json["results"][0]["geometry"]["location"]["lng"])
    return @[lat, long]
proc formattedAddress*(address: string): string = 
    ## Takes an address and returns a nicely formatted address.
    var baseurl = "http://maps.googleapis.com/maps/api/geocode/json"
    var path = baseurl & "?address=" & encodeUrl(address) & "&sensor=false"
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    return getStr(parsed_json["results"][0]["formatted_address"])
     
if isMainModule:
    if paramStr(1) == "-c":
        echo(coordinates(paramStr(2)))
    elif paramStr(1) == "-fa":
        echo(formattedAddress(paramStr(2)))
