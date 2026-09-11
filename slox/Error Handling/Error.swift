//
//  Error.swift
//  slox
//
//  Created by Andres Ortiz Osorio on 9/10/26.
//
import Foundation

struct ErrorMessage {
    var message: String
    var line: Int
}

func report_error(line: Int, where: String, message: String) {
    print("Error at line: \(line): \(message)")
}

func error(line: Int, message: String){
    report_error(line: line, where: "",  message: message)
}

