//
//  slox_testing.swift
//  slox-testing
//
//  Created by Andres Ortiz Osorio on 9/10/26.
//

import Testing
@testable import slox


@Suite struct slox_testing {
    
    @Suite struct LexerTesting {
        @Test("Create Token") func example(){
            let user_answer = 10
            let expected_answer = 10
            #expect(user_answer == expected_answer)
        }
    }
}
