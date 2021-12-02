object VersionHist: TVersionHist
  Left = 264
  Top = 189
  BorderStyle = bsNone
  Caption = 'Riwayat Perubahan'
  ClientHeight = 441
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 0
    Top = 9
    Width = 965
    Height = 432
    Align = alClient
    Color = 15781045
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'v 1.11 (12/05/2021) :'
      '- All Menu Master : font Tahoma 9.'
      '- Master Harga : Harga Jual Std diupdate.'
      '- Master Kavling : Urutan No. Kavling diupdate.'
      ''
      'v 1.10 (07/05/2021) :'
      '- Semua Menu Master : Id tdk ditampilkan.'
      '- Semua Menu Master : Warna baris di tabel 1 warna.'
      
        '- Semua Menu Master : Fitur search di atas tabel data (jika dite' +
        'kan enter, berfungsi sebagai filter).'
      '- Semua Menu Master : ekspor data ke excel.'
      '- Master Kavling : horzontal scroll bar enabled.'
      '- Master Kavling : filter Proyek dan Tipe.'
      '- Master Harga : filter Proyek dan Revisi Ke '
      ''
      'v 1.09 (23/04/2021) :'
      '- Menu Master Kavling : fix bug edit Posisi.'
      '- Menu Master Bonus : fix bug edit bonus.'
      
        '- Menu Master Harga : - Cek Sertifikat/PNBP rate diubah nama men' +
        'jadi AJB, BBN, PNBP, Cek Sertifikat.'
      
        '                                 - AJB/BBN rate diubah nama menj' +
        'adi PPh (Kolom bisa kosongkan).'
      
        '                                 - Penambah PNPB, Penambah BBN d' +
        'an Biaya lain-lain (kolom bisa dikosongkan).'
      'v 1.08 (13/02/2021) :'
      
        '- Menu Master Kavling : tambahan kolom flag IsContoh (u/. Rumah ' +
        'Contoh), tambahan jenis progres "Kavling" (default value).'
      ''
      'v 1.07 (02/02/2021) :'
      
        '- Menu Master Kavling : kesalahan tampilan Kolom NIB Split, SHM ' +
        'Split dan H. AJB Rencana (password char).'
      ''
      'v 1.06 (12/01/2021) :'
      '- Menu Master Referensi KPR.'
      
        '- Master Harga : tambahan kolom PPN Rate, BPHTB (Rate & Penguran' +
        'g), BBN/AJB (Rate & Penambah), PNPB (Rate & Penambah), Biaya Lai' +
        'n-Lain dan Booking Fee.'
      
        '- Master Harga : tambah Revisi Harga Baru = mengkopi revisi sebe' +
        'lumnya.'
      '- Master Kavling : Harga AJB Rencana.'
      ''
      'v 1.05 (11/11/2020) :'
      
        '- Luas Tanah Lebih Kurang bisa bernilai - (negatif), sehingga me' +
        'ngurangi harga jual standar.'
      ''
      'v 1.04 (18/07/2020) :'
      '- Fix bug connection password.'
      ''
      'v 1.03 (17/07/2020) :'
      '- Master harga : harga standar/unit calculated'
      ''
      'v 1.02 (04/07/2020) :'
      '- Fix bug : OptId unposted.'
      ''
      'v 1.01 (09/06/2020) :'
      '- Modul Konsumen ditambahkan.'
      '- Informasi login di footer halaman utama.'
      ''
      'v 1.00 (06/06/2020) :'
      '- Initial Release.')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 9
    Align = alTop
    BevelOuter = bvNone
    Color = 13806984
    TabOrder = 1
  end
end
