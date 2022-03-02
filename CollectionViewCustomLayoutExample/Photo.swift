//
//  Photo.swift
//  CollectionViewCustomLayoutExample
//
//  Created by Taehoon Kim on 2022/03/02.
//

struct Photo {
    var title: String
    var imageHeight: Int
    
    init(title: String, imageHeight: Int) {
        self.title = title
        self.imageHeight = imageHeight
    }
    
    init?(dictionary: [String: Any]) {
        guard
            let title = dictionary["Title"] as? String,
            let imageHeight = dictionary["ImageHeight"] as? Int
            else {
                return nil
            }
        self.init(title: title, imageHeight: imageHeight)
    }
    
    static func allPhotos() -> [Photo] {
        var photos: [Photo] = []
        let photosList = [["Title": "One", "ImageHeight": 180],["Title": "Two", "ImageHeight": 120], ["Title": "Three", "ImageHeight": 110], ["Title": "Four", "ImageHeight": 100], ["Title": "Five", "ImageHeight": 50]]
        
        for dictionary in photosList {
            if let photo = Photo(dictionary: dictionary) {
                photos.append(photo)
            }
        }
        
        return photos
    }
}
