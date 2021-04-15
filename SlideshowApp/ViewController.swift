//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 橋本晃矢 on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Go: UIButton!
    
    @IBOutlet weak var Back: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var start: UIButton!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    //スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "kinoko")!,
        UIImage(named: "pinkbin")!,
        UIImage(named: "suraimu")!
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func go(_ sender: Any) {
        //indexを表示して表示する画像を切り替える
        nowIndex += 1
        
        //indexが表示予定の画像と同じ場合
        if nowIndex == imageArray.count {
            //indexの画像を一番最初の数字に戻す
            nowIndex = 0
        }
        //indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        nowIndex -= 1
        
        if nowIndex  == -1 {
            nowIndex = 2
        }
        
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func startpause(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(Startpause(_:)), userInfo: nil, repeats: true)
            
            start.setTitle("停止", for: .normal)
            
            Go.isEnabled = false
            Back.isEnabled = false
        }else if timer != nil{
            timer.invalidate()
            
            timer = nil
            start.setTitle("再生", for: .normal)
            
            Go.isEnabled = true
            Back.isEnabled = true
        }
        
    }
    @objc func Startpause(_ value:UIImage) {
        nowIndex += 1
        if nowIndex == imageArray.count {
            nowIndex = 0
        }
        
        
        imageView.image = imageArray[nowIndex]
    }
    
    
    @IBAction func Imagesegue(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: nil)
        
        timer.invalidate()
        
        timer = nil
        
        start.setTitle("再生", for: .normal)
        
        Go.isEnabled = true
        Back.isEnabled = true
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewcontroller: NextViewController = segue.destination as! NextViewController
        
        nextViewcontroller.images = imageView.image
    }
    
    @IBAction func back2 (_ sender: UIStoryboardSegue) {
        
    }
}

