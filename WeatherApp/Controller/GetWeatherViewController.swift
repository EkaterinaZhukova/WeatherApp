//
//  GetWeatherViewController.swift
//  WeatherApp
//
//  Created by Екатерина on 01.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//

import UIKit

class GetWeatherViewController: UIViewController, UISearchBarDelegate{
    
    var urlString: String = "http://api.openweathermap.org/data/2.5/weather?q="
    var appid = "&APPID=3c7c6440876f63db87401b8ac41ee0d6"
    var imageURL = "http://openweathermap.org/img/w/"
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var describtionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func sendRequest(urlString:String){
        print(urlString)
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        var weather:WeatherObject?
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {[weak self] (data, response, error) -> Void in
            if let error = error{
                print(error)
                return
            }
            if let data = data{
                weather = try? WeatherObject(data:data)
            }
            DispatchQueue.main.async{
                if(weather == nil){
                    
                    self?.cityLabel.text = "Oops...Try later :("
                    self?.temperatureLabel.text = "Something went wrong :("
                    self?.describtionLabel.text = ""
                    
                    return
                }
                self?.cityLabel.text = weather!.nameCity
                self?.temperatureLabel.text = String(weather!.degree!)+"ºC"
                self?.imageView.image = UIImage(named: weather!.iconString!)
                self?.describtionLabel.text = weather!.main! + "\n" + weather!.describtion!
            }
        })
        task.resume()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
        
        searchBar.endEditing(true)
        var str = searchBar.text!
        str = str.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let resStr = urlString + str + appid + "&units=metric"
        sendRequest(urlString: resStr)
        
    }
}
