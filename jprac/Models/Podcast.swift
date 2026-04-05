import Foundation

// MARK: - Genre Model
struct Genre {
    let name: String
    let imageName: String
    let emoji: String
}

// MARK: - Podcast Model
struct Podcast {
    let title: String
    let description: String
    let imageName: String
    let genre: String
    let host: String
    let duration: String
    let fullDescription: String
}
