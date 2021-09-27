//
//  Medicine.swift
//  charity
//
//  Created by Daniyal Hussain on 20/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Medicine: Codable {
    let meta: Meta?
    let results: [Result]?
}

// MARK: - Meta
struct Meta: Codable {
    let disclaimer: String?
    let terms, license: String?
    let lastUpdated: String?
    let results: Results?

    enum CodingKeys: String, CodingKey {
        case disclaimer, terms, license
        case lastUpdated = "last_updated"
        case results
    }
}

// MARK: - Results
struct Results: Codable {
    let skip, limit, total: Int?
}

// MARK: - Result
struct Result: Codable {
    let receiptdateformat: String?
    let receiver: JSONNull?
    let seriousnessdeath, companynumb, receivedateformat: String?
    let primarysource: Primarysource?
    let transmissiondateformat, fulfillexpeditecriteria, safetyreportid: String?
    let sender: Sender?
    let receivedate: String?
    let patient: Patient?
    let transmissiondate, serious, receiptdate, seriousnesshospitalization: String?
    let seriousnesslifethreatening, seriousnessother: String?
}

// MARK: - Patient
struct Patient: Codable {
    let patientonsetage, patientonsetageunit, patientsex: String?
    let patientdeath: Patientdeath?
    let reaction: [Reaction]?
    let drug: [Drug]?
    let patientweight: String?
}

// MARK: - Drug
struct Drug: Codable {
    let drugcharacterization, medicinalproduct, drugauthorizationnumb, drugadministrationroute: String?
    let drugindication, drugstartdateformat, drugstartdate, drugenddateformat: String?
    let drugenddate, drugtreatmentduration: String?
    let drugtreatmentdurationunit: String?
    let openfda: [String: [String]]?
    let drugdosagetext: Drugdosagetext?
    let drugbatchnumb: String?
}

enum Drugdosagetext: String, Codable {
    case seeImage = "SEE IMAGE"
    case the55UDay = "55 U DAY"
}

// MARK: - Patientdeath
struct Patientdeath: Codable {
    let patientdeathdateformat, patientdeathdate: JSONNull?
}

// MARK: - Reaction
struct Reaction: Codable {
    let reactionmeddrapt: String?
}

// MARK: - Primarysource
struct Primarysource: Codable {
    let reportercountry, qualification: String?
}

// MARK: - Sender
struct Sender: Codable {
    let senderorganization: Senderorganization?
}

enum Senderorganization: String, Codable {
    case fdaPublicUse = "FDA-Public Use"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
