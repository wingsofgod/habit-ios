//
//  FavouriteAnimalResponseModel.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import Foundation

struct FavouriteAnimalResponseModel : Codable {
    let id : Int?
    let name : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
