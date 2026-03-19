import Cocoa

let albums = ["Red", "Fearless", "Red", "Speak Now", "Fearless"]

print("Number of items in the array:\(albums.count)")

let uniqueAlbums = Set(albums)
print("Number of unique items in the array:\(uniqueAlbums.count)")
