import Foundation

struct MockData {

    static let genres: [Genre] = [
        Genre(name: "Horror", imageName: "horror", emoji: "👻"),
        Genre(name: "Comedy", imageName: "comedy", emoji: "😂"),
        Genre(name: "Sci-Fi", imageName: "scifi", emoji: "🚀"),
        Genre(name: "Technology", imageName: "technology", emoji: "💻"),
        Genre(name: "Fantasy", imageName: "fantasy", emoji: "🧙"),
        Genre(name: "Finance", imageName: "finance", emoji: "💰")
    ]

    static let podcasts: [Podcast] = [
        Podcast(
            title: "Midnight Screams",
            description: "True horror stories that will keep you up at night.",
            imageName: "person1",
            genre: "Horror",
            host: "Sarah Kane",
            duration: "45 min",
            fullDescription: "Dive deep into the world of true horror with Sarah Kane as she narrates chilling stories collected from around the globe. Each episode explores paranormal encounters, haunted places, and unexplained phenomena that will make you question reality. Listener discretion advised."
        ),
        Podcast(
            title: "The Dark Hour",
            description: "Spine-chilling tales from around the world.",
            imageName: "person2",
            genre: "Horror",
            host: "Marcus Reid",
            duration: "38 min",
            fullDescription: "Marcus Reid brings you stories from the darkest corners of the world. From urban legends to documented supernatural events, The Dark Hour is your weekly dose of terror. Based on real reports and eyewitness accounts."
        ),
        Podcast(
            title: "Shadow Files",
            description: "Unsolved mysteries and paranormal investigations.",
            imageName: "person3",
            genre: "Horror",
            host: "Elena Cross",
            duration: "52 min",
            fullDescription: "Join investigator Elena Cross as she digs into unsolved mysteries, cold cases with a paranormal twist, and locations that defy explanation. Shadow Files is where true crime meets the unexplained."
        ),
        Podcast(
            title: "Laugh Out Loud",
            description: "Stand-up comedy bits and hilarious interviews.",
            imageName: "person4",
            genre: "Comedy",
            host: "Tom Briggs",
            duration: "60 min",
            fullDescription: "Tom Briggs hosts the funniest comedians on the planet for an hour of pure, unfiltered laughs. Expect stand-up sets, behind-the-scenes stories, and interviews that go completely off the rails in the best possible way."
        ),
        Podcast(
            title: "The Giggle Factory",
            description: "Weekly comedy sketches and funny takes on life.",
            imageName: "person5",
            genre: "Comedy",
            host: "Amy Chan",
            duration: "35 min",
            fullDescription: "Amy Chan and her rotating cast of comedy writers bring you fresh sketches every week. From office life to parenting chaos, The Giggle Factory finds humor in the everyday moments that drive us all a little crazy."
        ),
        Podcast(
            title: "Beyond the Stars",
            description: "Exploring the future of humanity in space.",
            imageName: "person6",
            genre: "Sci-Fi",
            host: "Dr. Neil Voss",
            duration: "55 min",
            fullDescription: "Astrophysicist Dr. Neil Voss blends real science with science fiction to explore what the future of space exploration could look like. From Mars colonies to faster-than-light travel, no idea is too far-fetched to explore on Beyond the Stars."
        ),
        Podcast(
            title: "Robot Uprising",
            description: "AI, robotics, and the science fiction that predicts it.",
            imageName: "person1",
            genre: "Sci-Fi",
            host: "Zara Patel",
            duration: "48 min",
            fullDescription: "Zara Patel examines how science fiction has predicted—and continues to predict—the future of artificial intelligence and robotics. Each episode compares a classic sci-fi story to current technological developments."
        ),
        Podcast(
            title: "Tech Decoded",
            description: "Breaking down the latest in tech, simply explained.",
            imageName: "person2",
            genre: "Technology",
            host: "Kevin Park",
            duration: "40 min",
            fullDescription: "Kevin Park makes complex technology accessible to everyone. From quantum computing to blockchain, Tech Decoded strips away the jargon and gives you clear, practical understanding of the technologies shaping our world."
        ),
        Podcast(
            title: "Startup Stories",
            description: "Founders share their journey from idea to IPO.",
            imageName: "person3",
            genre: "Technology",
            host: "Priya Nair",
            duration: "65 min",
            fullDescription: "Priya Nair interviews founders of the world's most successful tech startups. Each episode is a raw, honest account of what it really takes to build a company from scratch—the failures, the pivots, and the moments that changed everything."
        ),
        Podcast(
            title: "Dragon's Keep",
            description: "Epic fantasy world-building and lore deep dives.",
            imageName: "person4",
            genre: "Fantasy",
            host: "Owen Blake",
            duration: "70 min",
            fullDescription: "Owen Blake is your guide through the most expansive fantasy universes ever created. Dragon's Keep goes deep into the lore, history, and magic systems of beloved fantasy series, while also spotlighting hidden gems you haven't discovered yet."
        ),
        Podcast(
            title: "Money Mindset",
            description: "Personal finance strategies for the modern world.",
            imageName: "person5",
            genre: "Finance",
            host: "Claire Thompson",
            duration: "30 min",
            fullDescription: "Claire Thompson, certified financial planner, shares actionable strategies for managing money, building wealth, and achieving financial freedom. Each episode focuses on a specific financial topic with clear takeaways you can apply immediately."
        ),
        Podcast(
            title: "Market Pulse",
            description: "Weekly stock market analysis and investment tips.",
            imageName: "person6",
            genre: "Finance",
            host: "James Wong",
            duration: "45 min",
            fullDescription: "James Wong breaks down weekly market movements, analyzes trends, and interviews financial experts. Whether you're a seasoned investor or just starting out, Market Pulse gives you the context and insight to make smarter financial decisions."
        )
    ]

    static func podcasts(for genre: String) -> [Podcast] {
        podcasts.filter { $0.genre == genre }
    }
}
