//
//  Error.swift
//  slox
//
//  Created by Andres Ortiz Osorio on 9/10/26.
//

import Foundation
struct ErrorMessage {
    var message: String = ""
    var line: Int
}

private func report_error(line: Int, where: String, message: String) -> Void{
    print("Error at line: \(line): \(message)")
}

func error(_ message: String, atLine: Int) -> Void {
    report_error(line: atLine, where: "",  message: message)
}
