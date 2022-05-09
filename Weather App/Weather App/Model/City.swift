//
//  City.swift
//  Weather App
//
//  Created by Itzik Bar-Noy on 08/06/2020.
//  Copyright © 2020 Itzik Bar-Noy. All rights reserved.
//

import Foundation

// MARK: - Day in the week (enum)
enum DayInTheWeek: String {
    case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, None
}

// MARK: - Country short name (enum)
enum CountryShortName: String {
    case SK, IE, SZ, FO, MU, RO, VA, GG, PM, GY, BE, BI, TW, BL, GD, RS, GM, NL, KR, TV, CN, TK, CM, GB, BS, DK, CY,
    CL, PY, BD, LB, MN, FM, HK, ZM, TN, PG, CU, YT, SL, SO, JO, MA, BO, RU, MP, CR, UG, KP, BQ, SY, KW, MY, HR,
    GH, MZ, FJ, IL, AU, SA, TM, KI, SV, PE, CF, NP, XK, CV, NA, ZW, AT, ER, AO, LT, BM, AF, GL, KZ, MW, SN, LA,
    AS, DM, DE, KE, AZ, NC, NZ, SJ, SS, BF, MR, AM, SI, MH, LI, SC, WS, PH, SD, ID, UA, AQ, LU, GI, HN, KN, KG,
    YE, DO, PK, CG, TC, QA, VI, JE, BH, MT, GA, VG, NO, TZ, EE, GR, IR, PS, IT, BG, MK, VU, WF, VN, KY, CX, SH,
    LV, LR, SE, LK, MM, GW, KH, PA, PN, BB, TT, PL, NI, PF, MQ, CA, BY, ML, MF, GF, MX, RE, UY, LC, MS, HU, FI,
    EC, KM, SM, NG, FK, BZ, MV, IS, ST, NR, HT, AD, VC, DZ, GE, OM, SX, SR, BT, CH, AL, EG, CZ, TF, TH, MD, TD,
    BA, PW, TL, GU, AX, TR, CI, GQ, AE, EH, SG, BJ, DJ, NE, MG, GS, PR, JP, ME, AR, AI, SB, BW, NF, BN, ZA, IN,
    UZ, IM, GP, RW, US, CD, MO, ET, NU, CO, BR, TO, CW, TG, CC, ES, AW, LY, GT, AG, JM, LS, VE, CK, FR, PT, MC,
    GN, TJ, IQ
}

// MARK: - Capital city
struct CapitalCity: Codable {
    let city: String?
}

// MARK: - Group of cities
struct GroupOfCities: Codable {
    let count: Int
    let cities: [City]
    
    enum CodingKeys: String, CodingKey {
        case count = "cnt"
        case cities = "list"
    }
}

// MARK: - Five days forecast
struct FiveDaysForecast: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: CityClass
}

// MARK: - Three hours forecast
struct ThreeHoursForecast {
    let dayInTheWeek: DayInTheWeek
    var list: [List]
}

// MARK: - City
struct City: Codable {
    let country: String?
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone: Int?
    let id: Int
    let name: String
    let cod: Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    let seaLevel, grndLevel: Int?
    let tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type: Int?
    let id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
    let pod: Pod?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed, deg: Double?
}

// MARK: - City class
struct CityClass: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let timezone, sunrise, sunset: Int
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}
