//
//  ISO8601DateString.swift
//  
//
//  Created by Jeremy Bannister on 6/6/23.
//

///
public struct ISO8601DateString: Codable, Hashable {
    
    ///
    public var date: Date
    
    ///
    public var shouldEncodeWithFractionalSeconds: Bool
    
    ///
    public init
        (date: Date,
         shouldEncodeWithFractionalSeconds: Bool = true) {
        
        ///
        self.date = date
        self.shouldEncodeWithFractionalSeconds = shouldEncodeWithFractionalSeconds
    }
}

///
extension ISO8601DateString {
    
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
    
    ///
    public func encode (to encoder: Encoder) throws {
        
        ///
        var container = encoder.singleValueContainer()
        
        ///
        try container.encode(
            date.iso8601String(
                withFractionalSeconds: shouldEncodeWithFractionalSeconds
            )
        )
    }
}

///
extension ISO8601DateString {
    
    ///
    public func hash (into hasher: inout Hasher) {
        hasher.combine(date)
    }
}

///
extension ISO8601DateString {
    
    ///
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.date == rhs.date
    }
}
