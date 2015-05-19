import json, os, httpclient, cgi, strutils
    

proc coordinates*(address: string): seq[float] = 
    ## Takes an address and returns a sequence of latitutde and longitude
    var baseurl = "https://maps.googleapis.com/maps/api/geocode/json"
    var path = baseurl & "?address=" & encodeUrl(address) & "&sensor=false"
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    var lat = getFNum(parsed_json["results"][0]["geometry"]["location"]["lat"])
    var long = getFNum(parsed_json["results"][0]["geometry"]["location"]["lng"])
    return @[lat, long]

proc coordinates*(address: string, apiKey: string): seq[float] = 
    ## This proc takes an address and the API Key and returns a sequence of latitude and longitude
    var baseurl = "https://maps.googleapis.com/maps/api/geocode/json"
    var path = baseurl & "?address=" & encodeUrl(address) & "&key=" & encodeUrl(apiKey)
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    var lat = getFNum(parsed_json["results"][0]["geometry"]["location"]["lat"])
    var long = getFNum(parsed_json["results"][0]["geometry"]["location"]["lng"])
    return @[lat, long]

proc formattedAddress*(address: string): string = 
    ## Takes an address and returns a nicely formatted address.
    var baseurl = "https://maps.googleapis.com/maps/api/geocode/json"
    var path = baseurl & "?address=" & encodeUrl(address) & "&sensor=false"
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    return getStr(parsed_json["results"][0]["formatted_address"])

proc formattedAddress*(address: string, apiKey: string): string = 
    ## Takes an address and an API key and returns a nicely formatted address.
    var baseurl = "https://maps.googleapis.com/maps/api/geocode/json"
    var path = baseurl & "?address=" & encodeUrl(address) & "&sensor=false" & "&key=" & encodeUrl(apiKey)
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    return getStr(parsed_json["results"][0]["formatted_address"])
     
proc reverseGeocode*(lat: float, lng: float): string = 
    ## Takes latitude and longitude, returns a formatted address.
    var baseurl = "https://maps.googleapis.com/maps/api/geocode/json"
    var path = "$#?latlng=$#,$#&sensor=false".format(baseurl, encodeUrl($lat), encodeUrl($lng))
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    return getStr(parsed_json["results"][0]["formatted_address"])

proc reverseGeocode*(lat: float, lng: float, apiKey: string): string = 
    ## Takes latitude,longitude and an API key, returns a formatted address.
    var baseurl = "https://maps.googleapis.com/maps/api/geocode/json"
    var path = "$#?latlng=$#,$#&sensor=false&key=$#".format(baseurl, encodeUrl($lat), encodeUrl($lng), encodeUrl(apiKey))
    var response_json = getContent(path)
    var parsed_json = parseJson(response_json)
    return getStr(parsed_json["results"][0]["formatted_address"])

if isMainModule:
    if paramStr(1) == "-c":
        echo(coordinates(paramStr(2)))
    elif paramStr(1) == "-fa":
        echo(formattedAddress(paramStr(2)))
