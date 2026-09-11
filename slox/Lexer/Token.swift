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
    let line: Int
    
    init(tokenType: TokenType, lexeme: String, literal: Any? = nil, line: Int) {
        self.tokenType = tokenType
        self.lexeme = lexeme
        self.literal = literal
        self.line = line
    }
    
    convenience init() {
        self.init(tokenType: .IDENTIFIER, lexeme: "", literal: TokenType.ANY, line: 0)
    }
}

extension Token: CustomStringConvertible {
    var description: String {
        return "\(tokenType) + ' ' + \(lexeme) + ' ' + \(String(describing: literal))"
    }
}
