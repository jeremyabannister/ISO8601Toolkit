//
//  Date+extensions.swift
//  
//
//  Created by Jeremy Bannister on 6/6/23.
//

///
extension Date {
    
    ///
    public func iso8601String
        (withFractionalSeconds: Bool = true)
    -> String {
        
        ///
        Formatter
            .iso8601(withFractionalSeconds: withFractionalSeconds)
            .string(from: self)
    }
}

///
extension String {
    
    ///
    public func iso8601Date
        (withFractionalSeconds: Bool?)
    -> Date? {
        
        ///
        if let explicitFracsec = withFractionalSeconds {
            
            ///
            return
                Formatter
                    .iso8601(withFractionalSeconds: explicitFracsec)
                    .date(from: self)
            
        } else {
            
            ///
            return
                iso8601Date(withFractionalSeconds: true)
                    ??
                iso8601Date(withFractionalSeconds: false)
        }
    }
}

///
fileprivate extension Formatter {
    
    ///
    static func iso8601
        (withFractionalSeconds: Bool)
    -> ISO8601DateFormatter {
        
        ///
        ISO8601DateFormatter(
            withFractionalSeconds
                ? [.withFractionalSeconds, .withInternetDateTime]
                : [.withInternetDateTime]
        )
    }
}

///
fileprivate extension ISO8601DateFormatter {
    
    ///
    convenience init
        (_ formatOptions: Options,
         timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
        
        ///
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone
    }
}
