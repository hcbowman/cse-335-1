//: [Previous](@previous)

import PlaygroundSupport
import Foundation
import SQLite3

var databasePointer: OpaquePointer?
//var databaseURL: URL?

createFile()



func createFile() {
    
    let databaseFileName = "Cities.sqlite"
    
    // The URL to the location in which the created file will reside
    //let fileURL = PlaygroundSupport.playgroundSharedDataDirectory
    //let databaseURL = fileURL.appendingPathComponent(databaseFileName)
    
    
    if let databaseURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendPathComponent(databaseFileName) {
        print(databaseURL)
        setupDatabase(for: databaseURL)
    }
    
    
    //let fileManager = FileManager()
//    if FileManager.default.fileExists(atPath: databaseURL!.path) != true {
//        print("Error: File does not exist.")
//    }
//
//    if FileManager.default.createFile(atPath: databaseURL!.path, contents: nil, attributes: nil) != true {
//        print("Error: Cannot create database.")
//    }
    
    //return databaseURL
}

func setupDatabase(for database: URL) {
    
    if sqlite3_open(database.path, &databasePointer) != SQLITE_OK {
        print("Error: Cannot open database.")
        return
    }
    
    let createTableQuery = "CREATE TABLE IF NOT EXISTS Cities (name TEXT NOT NULL, stateName TEXT NOT NULL)"
    
    if sqlite3_exec(databasePointer, createTableQuery, nil, nil, nil) != SQLITE_OK {
        print("Error: Cannot execute createTableQuery command.")
        return
    }
    
    print("Database created.")
    
}





/*
 func openDatabase() -> OpaquePointer? {
 var db: OpaquePointer?
 guard let databasePath = databasePath else {
 print("part1DbPath is nil.")
 return nil
 }
 if sqlite3_open(part1DbPath, &db) == SQLITE_OK {
 print("Successfully opened connection to database at \(part1DbPath)")
 return db
 } else {
 print("Unable to open database.")
 PlaygroundPage.current.finishExecution()
 }
 }
 
 let db = openDatabase()
 */

// Stuff used to find the Resources URL
//let csvPath = Bundle.main.path(forResource: "sub-est2019_all", ofType: "csv")
//let csvURL = Bundle.main.url(forResource: "sub-est2019_all", withExtension: "csv")!.absoluteString
//let resourceDirectory = Bundle.main.resourceURL!.absoluteString
//let bundleDirectory = Bundle.main.bundleURL.absoluteString
//let bundles = Bundle.allBundles
//print("Main.path = \(csvPath!)\nMain.url = \(csvURL)\nResource.url = \(resourceDirectory)\nBundle.url = \(bundleDirectory)")
//print("sqliteURL: \(String(describing: databaseURL!))")

//: [Next](@next)
