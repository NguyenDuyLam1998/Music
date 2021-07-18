//
//  MyMusic.swift
//  PlayMusic
//
//  Created by Lâm Nguyễn on 08/07/2021.
//  Copyright © 2021 Lâm Nguyễn. All rights reserved.
//

import Foundation

var myMusic: [Music] = [
    Music(nameSong: "Hoa Hải Dường", song: "HoaHaiDuong.mp3", nameSinger: "~ Jack ~", imageSinger: "imgJack.jpeg"),
    Music(nameSong: "Bong Hoa Dep Nhat", song: "BongHoaDepNhat.mp3", nameSinger: "~ Quân AP ~", imageSinger: "imgQuanAP.jpeg"),
    Music(nameSong: "Hoa Nở Không Màu", song: "HoaNoKhongMau1-HoaiLam-6281704.mp3", nameSinger: "~ Hoài Lâm ~", imageSinger: "imgHoailam.jpeg"),
    Music(nameSong: "Rượu Ngon Cũng Không Bằng", song: "RuouNgonCungKhongBang-GeminiBand-6773686.mp3", nameSinger: "~ GeminiBand ~", imageSinger: "imgGemini.jpeg"),
    Music(nameSong: "Nói Chia Tay Thật Khó", song: "NoiChiaTayThatKho-TranThanhThuyChi-6738009.mp3", nameSinger: "~ Thuỳ Chi ~", imageSinger: "imgThuychi.jpg"),
    Music(nameSong: "Một Là Cười Hai Là Chia Tay", song: "MotLaCuoiHaiLaChiaTay-DuongEdward-6791301.mp3", nameSinger: "~ Dương Edward ~", imageSinger: "imgDuongEdward.jpeg"),
    Music(nameSong: "Dối Lòng", song: "DoiLong-TuanHung-5385147.mp3", nameSinger: "~ Tuấn Hưng ~", imageSinger: "imgTuanhung.jpeg"),
    Music(nameSong: "Ai Mang Em Đi", song: "AiMangEmDi-KICMAPJ-6714486.mp3", nameSinger: "~ KICM - APJ ~", imageSinger: "imgKICMAPJ.jpeg"),
    Music(nameSong: "Xin Lỗi Vì Đã Yêu Nhau", song: "XinLoiViDaYeuNhau-HoaiLam-5524738.mp3", nameSinger: "~ Hoài Lâm ~", imageSinger: "imgHoailam1.jpeg"),
    Music(nameSong: "Đánh Mất Em", song: "DanhMatEm-QuangDangTran-6677870.mp3", nameSinger: "~ Quang Đăng Trần ~", imageSinger: "imgQuangdang.jpeg"),
    Music(nameSong: "Đúng Cũng Thành Sai", song: "DungCungThanhSaiCover-BenSino-6714432.mp3", nameSinger: "~ BenSino ~", imageSinger: "imgBensino.jpeg"),
    Music(nameSong: "Rượu Tình", song: "RuouTinh-NamDuc-6207636_hq.mp3", nameSinger: "~ Nam Đức ~", imageSinger: "imgNamduc.jpeg"),
    Music(nameSong: "Tự Tại", song: "TuTai-PhanNgocLuan-6655960.mp3", nameSinger: "~ Phan Ngọc Luân ~", imageSinger: "imgPhamthanhluan.jpeg"),
    Music(nameSong: "Em không sai chúng ta sai", song: "EmKhongSaiChungTaSaiQuynhIDRemix-ERIK-6282373.mp3", nameSinger: "~ ERIK ~", imageSinger: "imgErik.jpeg"),
    Music(nameSong: "Hơn cả yêu", song: "HonCaYeuEntidiRemix-DucPhuc-6229851.mp3", nameSinger: "~ Đức Phúc ~", imageSinger: "imgDucphuc.jpeg"),
    Music(nameSong: "Thiệp hồng người dưng", song: "ThiepHongNguoiDungOrinnRemix-X2X-6203675.mp3", nameSinger: "~ X2X ~", imageSinger: "imgX2X.jpeg"),
    Music(nameSong: "Chân ái", song: "ChanAiOrinnRemix-OrangeKhoiChauDangKhoa-6228503.mp3", nameSinger: "~ Châu Đăng Khoa ~", imageSinger: "imgChaudangkhoa.jpeg"),
    Music(nameSong: "Thích thì đến", song: "ThichThiDenAndyRemix-LeBaoBinh-6261109.mp3", nameSinger: "~ Lê Bảo Bình ~", imageSinger: "imgLeaoinh.jpeg"),
    Music(nameSong: "Tan Remix", song: "TanRemix-TuanHung-4602901.mp3", nameSinger: "~ Tuấn Hưng ~", imageSinger: "imgTuanhung.jpeg"),
    Music(nameSong: "Hãy trao cho anh", song: "HayTraoChoAnhHtrolRemix-SonTungMTPSnoopDogg-6023798.mp3", nameSinger: "~ Sơn Tùng MTP ~", imageSinger: "imgSontung.jpeg"),
    Music(nameSong: "Buồn của anh", song: "BuonCuaAnhRemix-KICMDatGMasew-5327036.mp3", nameSinger: "~ ĐạtG ~", imageSinger: "imgDatG.jpeg"),
    Music(nameSong: "Hồng nhan Remix", song: "HongNhanTruogXuRemix-JackG5R-5950370.mp3", nameSinger: "~ Jack ~", imageSinger: "imgJack.jpeg"),
    Music(nameSong: "Hồng trận vương sầu cay", song: "HongTranVuongSauCay-HuyVac-7036434.mp3", nameSinger: "~ Huy Vạc ~", imageSinger: "imgHuyVac.jpeg"),
    Music(nameSong: "Hiện đại", song: "HienDai-KhacViet-7022864.mp3", nameSinger: "~ Khắc Việt ~", imageSinger: "imgKhacViet.jpeg"),
    Music(nameSong: "Thang Nam", song: "ThangNamSpecialPerformance-SoobinHoangSonSlimV-7020121.mp3", nameSinger: "~ Soobin Hoàng Sơn ~", imageSinger: "imgSoobin.jpeg"),
    Music(nameSong: "Tình yêu ngủ quên", song: "TinhYeuNguQuen-HoangTonLyhan-7030537.mp3", nameSinger: "~ Hoàng Tôn ~", imageSinger: "imgHoangTon.jpeg"),
    Music(nameSong: "Cố giang tình", song: "CoGiangTinhDinhlongRemix-X2X-6246845.mp3", nameSinger: "~ X2X ~", imageSinger: "imgX2X.jpeg"),
    Music(nameSong: "Chắc họ có thương em", song: "ChacHoCoThuongEm-KiunGiaTuan-7038201.mp3", nameSinger: "~ Kiun Gia Tuấn ~", imageSinger: "imgGiaTuan.jpeg"),
    Music(nameSong: "Người thương thương người", song: "NguoiThuongThuongNguoi-TuanHii-7031654.mp3", nameSinger: "~ Tuấn Hii ~", imageSinger: "imgTuanHii.jpeg"),
    Music(nameSong: "Nước mắt đóng băng", song: "NuocMatDongBang-HoQuangHieu-7029473.mp3", nameSinger: "~ Hồ Quang Hiếu ~", imageSinger: "imgHoQuangHieu.jpeg"),
    Music(nameSong: "Nàng thơ", song: "NangTho-HoangDung-6413381.mp3", nameSinger: "~ Hoàng Dũng ~", imageSinger: "imgHoangDung.jpeg")
]
