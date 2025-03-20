//
//  Experience.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import RealmSwift

public struct Experience: Identifiable, Hashable, Codable {
    public var id: String
    public let title: String
    public let coverPhoto: String
    public let description: String
    public let viewsCount: Int
    public var numberOfLikes: Int
    public let detailedDescription: String
    public var isLiked: Bool?
    public let tourHtml: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case coverPhoto = "cover_photo"
        case description
        case viewsCount = "views_no"
        case numberOfLikes = "likes_no"
        case detailedDescription = "detailed_description"
        case isLiked = "is_liked"
        case tourHtml = "tour_html"
    }
}

extension Experience {
    public init(realmExperience: RealmExperience) {
        self.id = realmExperience.id
        self.title = realmExperience.title
        self.coverPhoto = realmExperience.coverPhoto
        self.description = realmExperience.shortDescription
        self.viewsCount = realmExperience.viewsCount
        self.numberOfLikes = realmExperience.numberOfLikes
        self.detailedDescription = realmExperience.detailedDescription
        self.isLiked = realmExperience.isLiked
        self.tourHtml = realmExperience.tourHtml
    }
}

// MARK: - Mocks

#if DEBUG
extension Experience {
    public static var mockedExperience: Experience {
        Experience(
            id: "7f209d18-36a1-44d5-a0ed-b7eddfad48d6",
            title: "Abu Simbel Temples",
            coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/29/PmA89sBqFNkjDZUVOOaQ8PyEtlIXi7-metaSzNBVFFsaFU4VHhMVmkxZ253emdVNlczTEJRS3BuM1paWDg0MHIzci5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250318%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250318T092622Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=76336a3343db14ed4b699b42a1ce9ae804c85a433516bbd462982ce4abaa7f6a",
            description: "The Abu Simbel temples are two massive rock temples at Abu Simbel, a village in Nubia, southern Egypt, near the border with Sudan. They are situated on the western bank of Lake Nasser, about 230 km southwest of Aswan. The complex is part of the UNESCO World Heritage Site known as the \"Nubian Monuments\", which run from Abu Simbel downriver to Philae.",
            viewsCount: 678,
            numberOfLikes: 2696,
            detailedDescription: "Carved out of the mountain on the west bank of the Nile between 1274 and 1244 BC, this imposing main temple of the Abu Simbel complex was as much dedicated to the deified Ramses II himself as to Ra-Horakhty, Amun and Ptah. The four colossal statues of the pharaoh, which front the temple, are like gigantic sentinels watching over the incoming traffic from the south, undoubtedly designed as a warning of the strength of the pharaoh.  Over the centuries both the Nile and the desert sands shifted, and this temple was lost to the world until 1813, when it was rediscovered by chance by the Swiss explorer Jean-Louis Burckhardt. Only one of the heads was completely showing above the sand, the next head was broken off and, of the remaining two, only the crowns could be seen. Enough sand was cleared away in 1817 by Giovanni Belzoni for the temple to be entered.\n\nFrom the temple’s forecourt, a short flight of steps leads up to the terrace in front of the massive rock-cut facade, which is about 30m high and 35m wide. Guarding the entrance, three of the four famous colossal statues stare out across the water into eternity – the inner left statue collapsed in antiquity and its upper body still lies on the ground. The statues, more than 20m high, are accompanied by smaller statues of the pharaoh’s mother, Queen Tuya, his wife Nefertari and some of his favourite children. Above the entrance, between the central throned colossi, is the figure of the falcon-headed sun god Ra-Horakhty.\n\nThe roof of the large hall is decorated with vultures, symbolising the protective goddess Nekhbet, and is supported by eight columns, each fronted by an Osiride statue of Ramses II. Reliefs on the walls depict the pharaoh’s prowess in battle, trampling over his enemies and slaughtering them in front of the gods. On the north wall is a depiction of the famous Battle of Kadesh (c 1274 BC), in what is now Syria, where Ramses inspired his demoralised army so that they won the battle against the Hittites. The scene is dominated by a famous relief of Ramses in his chariot, shooting arrows at his fleeing enemies. Also visible is the Egyptian camp, walled off by its soldiers’ round-topped shields, and the fortified Hittite town, surrounded by the Orontes River.\n\nThe next hall, the four-columned vestibule where Ramses and Nefertari are shown in front of the gods and the solar barques, leads to the sacred sanctuary, where Ramses and the triad of gods of the Great Temple sit on their thrones.\n\nThe original temple was aligned in such a way that each 21 February and 21 October, Ramses’ birthday and coronation day, the first rays of the rising sun moved across the hypostyle hall, through the vestibule and into the sanctuary, where they illuminate the figures of Ra-Horakhty, Ramses II and Amun. Ptah, to the left, was never supposed to be illuminated. Since the temples were moved, this phenomenon happens one day later",
            isLiked: false,
            tourHtml: ""
        )
    }
    
    public static var mockedExperiences: [Experience] {
        [
            Experience(
                id: "7f209d18-36a1-44d5-a0ed-b7eddfad48d6",
                title: "Abu Simbel Temples",
                coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/29/PmA89sBqFNkjDZUVOOaQ8PyEtlIXi7-metaSzNBVFFsaFU4VHhMVmkxZ253emdVNlczTEJRS3BuM1paWDg0MHIzci5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250318%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250318T092622Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=76336a3343db14ed4b699b42a1ce9ae804c85a433516bbd462982ce4abaa7f6a",
                description: "The Abu Simbel temples are two massive rock temples at Abu Simbel, a village in Nubia, southern Egypt, near the border with Sudan. They are situated on the western bank of Lake Nasser, about 230 km southwest of Aswan. The complex is part of the UNESCO World Heritage Site known as the \"Nubian Monuments\", which run from Abu Simbel downriver to Philae.",
                viewsCount: 567,
                numberOfLikes: 2696,
                detailedDescription: "Carved out of the mountain on the west bank of the Nile between 1274 and 1244 BC, this imposing main temple of the Abu Simbel complex was as much dedicated to the deified Ramses II himself as to Ra-Horakhty, Amun and Ptah. The four colossal statues of the pharaoh, which front the temple, are like gigantic sentinels watching over the incoming traffic from the south, undoubtedly designed as a warning of the strength of the pharaoh.  Over the centuries both the Nile and the desert sands shifted, and this temple was lost to the world until 1813, when it was rediscovered by chance by the Swiss explorer Jean-Louis Burckhardt. Only one of the heads was completely showing above the sand, the next head was broken off and, of the remaining two, only the crowns could be seen. Enough sand was cleared away in 1817 by Giovanni Belzoni for the temple to be entered.\n\nFrom the temple’s forecourt, a short flight of steps leads up to the terrace in front of the massive rock-cut facade, which is about 30m high and 35m wide. Guarding the entrance, three of the four famous colossal statues stare out across the water into eternity – the inner left statue collapsed in antiquity and its upper body still lies on the ground. The statues, more than 20m high, are accompanied by smaller statues of the pharaoh’s mother, Queen Tuya, his wife Nefertari and some of his favourite children. Above the entrance, between the central throned colossi, is the figure of the falcon-headed sun god Ra-Horakhty.\n\nThe roof of the large hall is decorated with vultures, symbolising the protective goddess Nekhbet, and is supported by eight columns, each fronted by an Osiride statue of Ramses II. Reliefs on the walls depict the pharaoh’s prowess in battle, trampling over his enemies and slaughtering them in front of the gods. On the north wall is a depiction of the famous Battle of Kadesh (c 1274 BC), in what is now Syria, where Ramses inspired his demoralised army so that they won the battle against the Hittites. The scene is dominated by a famous relief of Ramses in his chariot, shooting arrows at his fleeing enemies. Also visible is the Egyptian camp, walled off by its soldiers’ round-topped shields, and the fortified Hittite town, surrounded by the Orontes River.\n\nThe next hall, the four-columned vestibule where Ramses and Nefertari are shown in front of the gods and the solar barques, leads to the sacred sanctuary, where Ramses and the triad of gods of the Great Temple sit on their thrones.\n\nThe original temple was aligned in such a way that each 21 February and 21 October, Ramses’ birthday and coronation day, the first rays of the rising sun moved across the hypostyle hall, through the vestibule and into the sanctuary, where they illuminate the figures of Ra-Horakhty, Ramses II and Amun. Ptah, to the left, was never supposed to be illuminated. Since the temples were moved, this phenomenon happens one day later",
                isLiked: true,
                tourHtml: ""
            ),
            Experience(
                id: "3e168a21-bfaa-4628-a8af-f08acf96b189",
                title: "Alexandria Opera house",
                coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/10/Tv5a1h6wsiDr6NHtXTbQlVqINABWpp-metaZk9WYkN5NlZyMTFmNWhnaUZqbzFOOU9HOWlnN2Z0ejNWaDhKZWlJSy5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250318%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250318T092622Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=74bf859ca91ca529dd27fcfd9ce5392c5b97a4eded41c94e38b89ac209a1973d",
                description: "Alexandria Opera House or Sayyid Darwish Theatre was built in 1918 and opened in 1921 in the city of Alexandria, Egypt. When it opened, it was named Teatro Mohamed Ali.",
                viewsCount: 456,
                numberOfLikes: 986,
                detailedDescription: "Alexandria Opera House was constructed in 1918 during the era of Sultan Fouad 1st. It was called Muhammad Ali theater. The original owner of Alexandria opera house called Badr El Din Kerdany. He appointed a french architect who's name is Georges Baroque to do the design of it. In 1962 Alexandria opera House renamed \"Sayed Darwish Theater\" to honor Mr.Sayed Darwish.  Sayed Darwish a famous Egyptian musician. Moreover Sayed Darwish is the one who composed the Egyptian national anthem. Unfortunately, the ravages of time destroyed the exquisite beauty of Alexandria opera house building.",
                isLiked: false,
                tourHtml: ""
            ),
            Experience(
                id: "afb664ab-3597-4a37-89fd-f8275f96613f",
                title: "Karnak Temple",
                coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/47/JZZpKABmnSzUVrn2nGeFKTBlUHMntG-metaTnZPMlR5N0ZjTU5KS0E0Ymg4RHg0S2pSbFI3SFdXZWd6eDU1YXRMSy5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250318%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250318T092622Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=762301e13317f54e7bd28dc2bd9d294b96e0ebe163a5e92657eccdcfecc3ab8b",
                description: "The Karnak Temple Complex, commonly known as Karnak, comprises a vast mix of decayed temples, chapels, pylons, and other buildings in Egypt. Construction at the complex began during the reign of Senusret I in the Middle Kingdom and continued into the Ptolemaic period, although most of the extant buildings date from the New Kingdom.",
                viewsCount: 345,
                numberOfLikes: 1026,
                detailedDescription: "\"Karnak is an extraordinary complex of sanctuaries, kiosks, pylons and obelisks dedicated to the Theban triad but also to the greater glory of pharaohs. The site covers more than 2 sq km; it's large enough to contain about 10 cathedrals. At its heart is the Temple of Amun, the earthly 'home' of the local god. Built, added to, dismantled, restored, enlarged and decorated over nearly 1500 years, Karnak was the most important place of worship in Egypt during the New Kingdom.        The complex is dominated by the great Temple of Amun-Ra – one of the world's largest religious complexes – with its famous hypostyle hall, a spectacular forest of giant papyrus-shaped columns. This main structure is surrounded by the houses of Amun's wife Mut and their son Khonsu, two other huge temple complexes on this site. On its southern side, the Mut Temple Enclosure was once linked to the main temple by an avenue of ram-headed sphinxes. To the north is the Montu Temple Enclosure, which honoured the local Theban war god.\n\nThe 3km paved avenue of human-headed sphinxes that once linked the great Temple of Amun at Karnak with Luxor Temple is now again being cleared. Most of what you can see was built by the powerful pharaohs of the 18th to 20th dynasties (1570–1090 BC), who spent fortunes on making their mark in this most sacred of places, which was then called Ipet-Sut, meaning 'The Most Esteemed of Places'. Later pharaohs extended and rebuilt the complex, as did the Ptolemies and early Christians. The further into the complex you venture, the older the structures.\n\nThe light is most beautiful in the early morning or later afternoon, and the temple is quieter then, as later in the morning tour buses bring day trippers from Hurghada. It pays to visit more than once, to make sense of the overwhelming jumble of ancient remains.\"",
                isLiked: false,
                tourHtml: ""
            ),
            Experience(
                id: "5f189edf-586c-4be9-b77a-866d152118e1",
                title: "Red Sea Beaches & Safari",
                coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/15/5lZIjBKuV1XbFeOHXRYHnAkN61dcFu-metadFpmSkpBSVlEWjY5b0x4S01oZ2haanBtVTR6eFlTV0wyaldMRTA5UC5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250318%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250318T092622Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=7c3f37c495fa213a5d5100c5242c7c7779bec7e5df6e204be7f2f49264280ad2",
                description: "Breathtaking views for the Red Sea Egypt from different locations",
                viewsCount: 234,
                numberOfLikes: 2443,
                detailedDescription: "",
                isLiked: false,
                tourHtml: ""
            ),
            Experience(
                id: "f9525025-949f-4fae-ab4a-e94f39a2ce62",
                title: "Pyramids of Giza - Aerial View",
                coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/66/DJXbihuxERpwQita9IxayglT92Li36-metaanc2TjZPb2lGN251c1VDZkg2cWIxU0YxUzd1SU5vdGJOc3lxTTNWZC5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250318%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250318T092622Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=39588765daac26d6811a8012ef72e30574beffd61f9d26d8d485809c7bbe7bee",
                description: "The Great Pyramid of Giza is the oldest monument on the list of the seven wonders of the Ancient world. It was built for the fourth dynasty pharaoh Khufu and was completed around 2560 BCE. ... Some evidence and theories suggest that 20,000 workers over the course of 20 years built the great pyramid.",
                viewsCount: 123,
                numberOfLikes: 3238,
                detailedDescription: "The last remaining wonder of the ancient world; for nearly 4000 years, the extraordinary shape, impeccable geometry and sheer bulk of the Giza Pyramids have invited the obvious questions: ‘How were we built, and why?’. Centuries of research have given us parts of the answer. Built as massive tombs on the orders of the pharaohs, they were constructed by teams of workers tens-of-thousands strong. Today they stand as an awe-inspiring tribute to the might, organisation and achievements of ancient Egypt.      Ongoing excavations on the Giza Plateau, along with the discovery of a pyramid-builders' settlement, complete with areas for large-scale food production and medical facilities, have provided more evidence that the workers were not the slaves of Hollywood tradition, but an organised workforce of Egyptian farmers. During the flood season, when the Nile covered their fields, the same farmers could have been redeployed by the highly structured bureaucracy to work on the pharaoh’s tomb. In this way, the Pyramids can almost be seen as an ancient job-creation scheme. And the flood waters made it easier to transport building stone to the site.\n\nBut despite the evidence, some still won’t accept that the ancient Egyptians were capable of such achievements. So-called pyramidologists point to the carving and placement of the stones, precise to the millimeter, and argue the numerological significance of the structures’ dimensions as evidence that the Pyramids were constructed by angels or aliens. It’s easy to laugh at these out-there ideas, but when you see the monuments up close, especially inside, you’ll better understand why so many people believe such awesome structures must have unearthly origins.\n\nMost visitors will make a beeline straight to the four most famous sights; the Great Pyramid of Khufu, the Pyramid of Khafre, the Pyramid of Menkaure and the Sphinx. But for those who want to explore further, the desert plateau surrounding the pyramids is littered with tombs, temple ruins and smaller satellite pyramids.",
                isLiked: true,
                tourHtml: ""
            )
        ]
    }
}
#endif
