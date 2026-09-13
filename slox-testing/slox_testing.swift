//
//  slox_testing.swift
//  slox-testing
//
//  Created by Andres Ortiz Osorio on 9/12/26.
//

import Testing

@Suite struct slox_testing {
    
    @Suite struct ScannerTests {
        // Wrapper method for testing
        private func scan(_ source: String) -> [Token] {
            Scanner(source: Array(source)).scanTokens()
        }
        
        @Test("Scan Singular-Characters") func scanSingularCharacters(){
            let tokens = scan("(){}<>;,.+-!=*")
            #expect(tokens.map(\.tokenType) == [
                .LEFT_PAREN, .RIGHT_PAREN, .LEFT_BRACE, .RIGHT_BRACE,
                .LESS, .GREATER, .SEMICOLON, .COMMA, .DOT, .PLUS, .MINUS,
                .BANG_EQUAL, .STAR, .EOF
            ])
        }
        
        @Test("Scan Combinaion-Characters", arguments: [
            ("<=", TokenType.LESS_EQUAL),
            (">=", .GREATER_EQUAL),
            ("!=", .BANG_EQUAL),
            ("==", .EQUAL_EQUAL),
        ])
        func scanDualCharacterTokens(_ source: String, _ expected: TokenType) {
            let tokens = scan(source)
            #expect(tokens.map(\.tokenType) == [expected, .EOF])
        }
        
        
    }
}
