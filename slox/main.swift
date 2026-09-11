//
//  main.swift
//  slox
//
//  Created by Andres Ortiz Osorio on 9/9/26.
//


import Foundation

let args = CommandLine.arguments

guard args.count > 1 else {
    FileHandle.standardError.write("Usage: \(args[0]) <name>\n".data(using: .utf8)!)
    exit(1)
}

print("args \(args[1])")
