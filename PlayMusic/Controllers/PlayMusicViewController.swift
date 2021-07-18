
import UIKit
import AVFoundation

class PlayMusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    @IBOutlet weak var pause_options: UIButton!
    @IBOutlet weak var slider_Volume: UISlider!
    @IBOutlet weak var volume: UIButton!
    @IBOutlet weak var mute: UIButton!
    @IBOutlet weak var slider_time: UISlider!
    @IBOutlet weak var tbv_music: UITableView!
    @IBOutlet weak var lbl_tenbaihat: UILabel!
    @IBOutlet weak var image_Xoay: UIImageView!
    @IBOutlet weak var image_mh: UIImageView!
    
    var images = true
    var image = true
    var player:AVAudioPlayer!
    var timer:Timer!
    
    var tenbaihat:[String] =
        ["Hoa Hải Dường - Jack", "Bong Hoa Dep Nhat", "Hoa Nở Không Màu - Hoài Lâm",  "Rượu Ngon Cũng Không Bằng - GeminiBand", "Nói Chia Tay Thật Khó - Thuỳ Chi", "Một Là Cười Hai Là Chia Tay - Dương Edward", "Dối Lòng - Tuấn Hưng", "Ai Mang Em Đi - KICMAPJ", "Xin Lỗi Vì Đã Yêu Nhau - Hoài Lâm", "Đánh Mất Em - Quang Đăng Trần", "Đúng Cũng Thành Sai-Bénino", "Rượu Tình - Nam Đức", "Tự Tại - Phan Ngọc Luân"]
    var baihat:[String] = ["HoaHaiDuong.mp3", "BongHoaDepNhat.mp3", "HoaNoKhongMau1-HoaiLam-6281704.mp3", "RuouNgonCungKhongBang-GeminiBand-6773686.mp3", "NoiChiaTayThatKho-TranThanhThuyChi-6738009.mp3", "MotLaCuoiHaiLaChiaTay-DuongEdward-6791301.mp3", "DoiLong-TuanHung-5385147.mp3", "AiMangEmDi-KICMAPJ-6714486.mp3", "XinLoiViDaYeuNhau-HoaiLam-5524738.mp3", "DanhMatEm-QuangDangTran-6677870.mp3", "DungCungThanhSaiCover-BenSino-6714432.mp3", "RuouTinh-NamDuc-6207636_hq.mp3", "TuTai-PhanNgocLuan-6655960.mp3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play_music(tenbaihat_s: baihat[0])
        lbl_tenbaihat.text =  tenbaihat[0]
        play_options.isHidden = false
        pause_options.isHidden = true
        slider_Volume.maximumValue = 1
        slider_Volume.minimumValue = 0
        slider_Volume.value = 0.5
        mute.isHidden = true
        volume.isHidden = false
        tbv_music.dataSource = self
        tbv_music.delegate = self
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        self.slider_time.maximumValue = Float(self.player.duration)
        self.slider_time.minimumValue = 0
        image_Xoay.layer.cornerRadius = 200/2
        var i:CGFloat = 1
        timer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true, block: { (time) in
        if(i>1800){
            i = 1
        }
            self.image_Xoay.transform = CGAffineTransform(rotationAngle: i*CGFloat(M_PI)/100)
            i += 1
        })
    }
    
    func play_music(tenbaihat_s: String){
        let path = Bundle.main.path(forResource: tenbaihat_s, ofType: nil)
        var url = URL(fileURLWithPath: path!)
        //var data = NSData(contentsOf: url)
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error")
        }
    }
    
    @IBAction func play_Clicked(_ sender: Any) {
        player.play()
        play_options.isHidden = true
        pause_options.isHidden = false
    }
    
    @IBAction func pause_Clicked(_ sender: Any) {
        player.pause()
        pause_options.isHidden = true
        play_options.isHidden = false
    }
    
    @IBAction func stop_Clicked(_ sender: Any) {
        player.pause()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        self.player.currentTime = 0
        pause_options.isHidden = true
        play_options.isHidden = false
    }
    
    @IBAction func volume_action(_ sender: Any) {
        player.volume = slider_Volume.value
        if(slider_Volume.value == 0){
            volume.isHidden = true
            mute.isHidden = false
        } else {
            volume.isHidden = false
            mute.isHidden = true
        }
    }
    
    @IBAction func volume_Clicked(_ sender: Any) {
        volume.isHidden = true
        mute.isHidden = false
        player.volume = 0
    }
    
    @IBAction func mute_Clicked(_ sender: Any) {
        mute.isHidden = true
        volume.isHidden = false
        player.volume = slider_Volume.value
    }
    
    @IBAction func time_action(_ sender: Any) {
        
        player.currentTime = TimeInterval(slider_time.value)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        if self.player.currentTime == 0 {
            pause_options.isHidden = true
            play_options.isHidden = false
        } else if(player.play()) {
            pause_options.isHidden = false
            play_options.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tenbaihat.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = tenbaihat[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lbl_tenbaihat.text = tenbaihat[indexPath.row]
        play_music(tenbaihat_s: baihat[indexPath.row])
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        self.slider_time.maximumValue = Float(self.player.duration)
        self.slider_time.minimumValue = 0
        play_options.isHidden = false
        pause_options.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
          cell.transform = CGAffineTransform(translationX: 0, y: 60)
            UIView.animate(
                withDuration: 1,
                delay: 0.05 * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
    }
    
    @IBAction func changes_Clicked(_ sender: UITapGestureRecognizer) {
        if images {
            image_Xoay.image = UIImage(named: "xoay5")
        } else {
            image_Xoay.image = UIImage(named: "b")
        }
        images = !images
    }
    
    @IBAction func change(_ sender: UITapGestureRecognizer) {
        if image {
            image_mh.image = UIImage(named: "mh")
        } else {
            image_mh.image = UIImage(named: "nen")
        }
        image = !image
    }
    
    @IBAction func music_Online(_ sender: Any) {
        player.pause()
        pause_options.isHidden = true
        play_options.isHidden = false
    }
}

