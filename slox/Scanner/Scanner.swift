//
//  Scanner.swift
//  slox
//
//  Created by Andres Ortiz Osorio on 9/12/26.
//

class Scanner {
    private let source: [Character]
    private var tokens: [Token]
    private var start: Int
    private var current: Int
    private var line: Int

    
    init(source: [Character]) {
        self.source = source
        self.tokens = []
        self.start = 0
        self.current = 0
        self.line = 1
    }
    
    // HELPER METHODS
    
    @discardableResult
    private func advance() -> Character {
        // We increment our current counter.
        let c: Character = source[current]
        current += 1
        return c
    }
    
    private func substr(_ from: Int, to: Int) -> String {
        return String(source[from ... to])
    }
    
    private func addToken(_ type: TokenType, _ literal: Any?) -> Void {
        let text: String = substr(start, to: current - 1)
        tokens.append(Token(type, text, literal, atLine: line))
    }
    
    private func addToken(_ type: TokenType) -> Void {
        addToken(type, nil)
    }
    
    private func match(_ c: Character) -> Bool {
        if(isAtEnd()) {return false}
        if(source[current] != c) { return false }
        current += 1
        return true
    }
    
    private func peek() -> Character {
        if(isAtEnd()) {return "\0"}
        return source[current]
    }
    
    // Check if it's a singular lexeme and append it as a token
    private func scanToken() -> Void {
        let c: Character = advance()
        switch c {
        case "(": addToken(.LEFT_PAREN)
        case ")": addToken(.RIGHT_PAREN)
        case "{": addToken(.LEFT_BRACE)
        case "}": addToken(.RIGHT_BRACE)
        case ",": addToken(.COMMA)
        case ".": addToken(.DOT)
        case "-": addToken(.MINUS)
        case "+": addToken(.PLUS)
        case ";": addToken(.SEMICOLON)
        case "*": addToken(.STAR)
        case "!": addToken(match("=") ? .BANG_EQUAL : .BANG)
        case "=": addToken(match("=") ? .EQUAL_EQUAL : .EQUAL)
        case "<": addToken(match("=") ? .LESS_EQUAL : .LESS)
        case ">": addToken(match("=") ? .GREATER_EQUAL : .GREATER)
        case "/":
            if(match("/")){
                while(peek() != "\n" && !isAtEnd()) { advance() }
            }
            else {
                addToken(.SLASH)
            }
        default:
            error("Unexpected Behavior", atLine: line)
        }
    }
    
    // Check if we consumed all of the characters in the source
    private func isAtEnd() -> Bool {
        return self.current >= self.source.count
    }
    
    private func displayTokens(_ tokens: [Token]) -> Void {
        tokens.forEach { print ("\($0) ") }
    }
    
    // Methods
    
    func scanTokens() -> [Token] {
        while(!isAtEnd()) {
            start = current
            scanToken()
        }
        
        tokens.append(Token(.EOF, "", atLine: line))
        return tokens
    }
}
