//
//  Token.swift
//  slox
//
//  Created by Andres Ortiz Osorio on 9/10/26.
//

class Token {
    let tokenType: TokenType
    let lexeme: String
    let literal: Any?
    let atLine: Int
    
    init(_ tokenType: TokenType, _ lexeme: String, _ literal: Any? = nil, atLine: Int) {
        self.tokenType = tokenType
        self.lexeme = lexeme
        self.literal = literal
        self.atLine = atLine
    }
    
    convenience init() {
        self.init(.IDENTIFIER, "", TokenType.ANY, atLine: 0)
    }
}

extension Token: CustomStringConvertible {
    var description: String {
        return "\(tokenType) + ' ' + \(lexeme) + ' ' + \(String(describing: literal))"
    }
}
