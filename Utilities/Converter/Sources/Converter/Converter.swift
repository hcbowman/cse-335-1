import Foundation
import SQLite3

struct Converter {
    var text = "Hello, World!"
}


//let resourcesURLString = "file:///var/folders/hs/6fcy_pwx4tj8s45yyw0qq4n40000gn/T/com.apple.dt.Xcode.pg/resources/A100C23E-C2F7-491F-AA64-87C91C56CCB3/"

//let fileURL = Bundle.main.
//let databaseURL = URL(string: resourcesURLString)?.appendingPathComponent("Cities.sqlite")

var databasePointer: OpaquePointer?

// Stuff used to find the Resources URL
let csvPath = Bundle.main.path(forResource: "sub-est2019_all", ofType: "csv")
let csvURL = Bundle.main.url(forResource: "sub-est2019_all", withExtension: "csv")!.absoluteString
let resourceDirectory = Bundle.main.resourceURL!.absoluteString
let bundleDirectory = Bundle.main.bundleURL.absoluteString
let bundles = Bundle.allBundles

//print("Main.path = \(csvPath!)\nMain.url = \(csvURL)\nResource.url = \(resourceDirectory)\nBundle.url = \(bundleDirectory)")
//print("sqliteURL: \(String(describing: databaseURL!))")


func start() {
    
    /*
     if sqlite3_open(databaseURL?.path, &databasePointer) != SQLITE_OK {
     print("Error: Cannot open database.")
     }
     
     let createTableQuery = "CREATE TABLE IF NOT EXISTS Cities (name TEXT NOT NULL, stateName TEXT NOT NULL)"
     
     if sqlite3_exec(databasePointer, createTableQuery, nil, nil, nil) != SQLITE_OK {
     print("Error: Cannot execute createTableQuery command.")
     }
     
     */
    
    print("Database created.")
}






