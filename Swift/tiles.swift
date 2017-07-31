//From terminal requieres library 
import Foundation

var response:String?
var strTemp: String 
var array = [String]()
var count = 0

//read Values
while count<2 {
    response = readLine()
    if response == "" {
        count+=1
    }else{
        response = response?.replacingOccurrences(of: " ", with: "")
        response = response?.replacingOccurrences(of: "m:", with: "")
        response = response?.replacingOccurrences(of: "d:", with: "")
        response = response?.replacingOccurrences(of: "\"", with: "")
        response = response?.replacingOccurrences(of: "]", with: "")
        response = response?.replacingOccurrences(of: "[", with: "")
        response = response?.replacingOccurrences(of: "\n", with: "")
        response = response?.replacingOccurrences(of: " ", with: "")
        response = response?.replacingOccurrences(of: ",", with: "")
        response = response?.replacingOccurrences(of: "Input:", with: "")
        if response != "" {
            array.append(response ?? "nil")
        }

    }
}

//print (array ?? "sin valor")


//let arguments = CommandLine.arguments

//print (arguments)
//for argument in CommandLine.arguments {
    //switch argument {
    //case "arg1":
        //print("first argument");
//
    //case "arg2":
        //print("second argument");
//
    //default:
        //print(argument);
    //}
//}