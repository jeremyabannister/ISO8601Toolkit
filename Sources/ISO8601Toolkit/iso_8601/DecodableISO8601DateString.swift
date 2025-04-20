//
//  DecodableISO8601DateString.swift
//  
//
//  Created by Jeremy Bannister on 6/6/23.
//

///
public struct DecodableISO8601DateString: Decodable, Hashable, Sendable {
    
    ///
    public let date: Date
    
    ///
    private init (date: Date) {
        self.date = date
    }
}

///
extension DecodableISO8601DateString {
    
    ///
    public init (from decoder: Decoder) throws {
        
        ///
        let string =
            try decoder
                .singleValueContainer()
                .decode(String.self)
        
        ///
        guard let date =
            string
                .iso8601Date(
                    withFractionalSeconds: nil
                )
        else { throw "Could not decode date from string: \"\(string)\"".asErrorMessage() }
        
        ///
        self.init(
            date: date
        )
    }
}
