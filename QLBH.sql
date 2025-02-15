CREATE DATABASE QLBH
ON PRIMARY
(NAME = QLBH_data1, FILENAME = 'D:\CSDL\BTCSDL_T1\QLBH_data1', SIZE = 10MB, MAXSIZE = 40MB, FILEGROWTH = 1MB)
LOG ON
(NAME = QLBH_Log, FILENAME = 'D:\CSDL\BTCSDL_T1\QLBH.ldf', SIZE = 6MB, MAXSIZE = 8MB, FILEGROWTH = 1MB);
EXEC sp_helpdb QLBH;
EXEC sp_spaceused;
EXEC sp_helpfile;
ALTER DATABASE QLBH ADD FILEGROUP DuLieuQLBH;
ALTER DATABASE QLBH ADD FILE ( NAME = QLBH_data2, FILENAME = 'D:\CSDL\BTCSDL_T1\QLBH_data2.ndf',
    SIZE = 5MB, MAXSIZE = 20MB, FILEGROWTH = 2MB) TO FILEGROUP DuLieuQLBH;
EXEC sp_helpfilegroup; --- XEM CAC FILEGROUP TRONG DU LIEU
ALTER DATABASE QLBH SET READ_ONLY;
EXEC sp_helpdb QLBH;
ALTER DATABASE QLBH SET READ_WRITE;
ALTER DATABASE QLBH MODIFY FILE ( NAME = QLBH_data1, SIZE = 50MB );
ALTER DATABASE QLBH MODIFY FILE ( NAME = QLBH_Log, SIZE = 10MB );
ALTER DATABASE QLBH MODIFY FILE ( NAME = QLBH_Log, SIZE = 15MB );
--- Neu thay doi kich thuoc nho hon ban da se khong tien hanh duoc, neu thay doi maxsize cung khong duoc vi maxsize phai luon >= size nen SQL khong cho phep.
EXEC sp_addtype Mavung, 'char(10)', NULL;
EXEC sp_addtype STT, 'int', NULL;
EXEC sp_addtype SoDienThoai, 'char(13)', NULL;
EXEC sp_addtype Shortstring, 'varchar(15)', NULL;
CREATE TABLE ThongTinKH (
    MaKH STT PRIMARY KEY,
    Vung Mavung,
    Diachi Shortstring,
    DienThoai SoDienThoai
);
INSERT INTO ThongTinKH VALUES ('23714', '77','Binh Dinh', '0352498400');
EXEC sp_droptype SoDienThoai;
BACKUP DATABASE QLBH
TO DISK = 'C:\Backup\QLBH.bak';
RESTORE DATABASE QLBH
FROM DISK = 'C:\Backup\QLBH.bak'
WITH REPLACE;
