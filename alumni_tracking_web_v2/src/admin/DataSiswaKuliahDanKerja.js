import React, { useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { Button, Form } from "react-bootstrap";
import axios from "axios";
import Sidebar from "./Sidebar";
import "./DataSiswaKuliahDanKerja.css"; // Impor file CSS

const DataSiswaKuliahDanKerja = () => {
  const [data, setData] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterOption, setFilterOption] = useState("Semua");
  const history = useHistory();

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = () => {
    axios
      .get("http://localhost:5000/api/dataSiswaKuliahDanKerjaWithNamaSiswa")
      .then((response) => setData(response.data))
      .catch((err) => console.error(err));
  };

  const handleEdit = (id) => {
    history.push(`/dataSiswaKuliahDanKerja/editSiswaKuliahDanKerja/${id}`);
  };

  const handleTambah = () => {
    history.push(`/dataSiswaKuliahDanKerja/tambahSiswaKuliahDanKerja`);
  };

  const handleDelete = (id) => {
    const confirmDelete = window.confirm(
      "Anda yakin ingin menghapus data ini?"
    );
    if (confirmDelete) {
      axios
        .delete(`http://localhost:5000/api/dataSiswaKuliahDanKerja/${id}`)
        .then(() => {
          fetchData();
        })
        .catch((err) => console.error(err));
    }
  };

  const handleSearch = (e) => {
    setSearchTerm(e.target.value);
  };

  const handleFilter = (option) => {
    setFilterOption(option);
    setSearchTerm("");
  };

  const filteredData = data.filter(
    (item) =>
      (item.id_kuliah_kerja.toString().includes(searchTerm) ||
        item.id_siswa.toString().includes(searchTerm) ||
        item.id_login.toString().includes(searchTerm) ||
        item.nama.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.nama_perguruan_tinggi.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.alamat_perguruan_tinggi.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.kota_perguruan_tinggi.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.jurusan_perguruan_tinggi.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.jenjang_pendidikan.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.nama_perusahaan.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.alamat_perusahaan.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.kota_perusahaan.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.nama_hrd.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.no_telp_hrd.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.tahun_mulai_bekerja.toString().includes(searchTerm)) &&
      (filterOption === "Semua" || item.jenjang_pendidikan === filterOption || item.tahun_mulai_bekerja.toString() === filterOption) 
  );

  const uniqueTahunMulaiBekerja = [...new Set(data.map((item) => item.tahun_mulai_bekerja.toString()))].sort();

  return (
    <div className="d-flex">
      <Sidebar />
      <div className="flex-grow-1 content contentKuliahDanKerja">
        <div className="text-center my-5">
          <h1>Data Siswa Kuliah dan Kerja</h1>
          <Form.Control
            type="text"
            placeholder="Cari..."
            value={searchTerm}
            onChange={handleSearch}
          />
        </div>

        <div>
          <Form.Group className="mt-2 mb-2 w-25" style={{ marginLeft: 'auto' }}>
            <Form.Label>Filter Data : </Form.Label>
            <Form.Select
              value={filterOption}
              onChange={(e) => handleFilter(e.target.value)}
            >
              <option value="Semua">Semua</option>
              <option value="D3">Jenjang Pendidikan D3</option>
              <option value="D4">Jenjang Pendidikan D4</option>
              <option value="S1">Jenjang Pendidikan S1</option>
              <option value="S2">Jenjang Pendidikan S2</option>
              {uniqueTahunMulaiBekerja.map((tahunMulaiBekerja) => (
                <option key={tahunMulaiBekerja} value={tahunMulaiBekerja}>
                  Tahun Mulai Kerja {tahunMulaiBekerja}
                </option>
              ))}
            </Form.Select>
          </Form.Group>
        </div>

        <div className="mb-2">
          <Button
            onClick={() => handleTambah()}
            className="mb-2"
            variant="outline-primary"
          >
            Tambah Data Siswa Kuliah dan Kerja
          </Button>
        </div>

        <div className="table-responsive">
          <table className="table table-hover">
            <thead className="table-dark">
              <tr className="text-center">
                <th>ID Kuliah dan Kerja</th>
                <th>ID Siswa</th>
                <th>ID Login</th>
                <th>Nama Siswa</th>
                <th>Nama Perguruan Tinggi</th>
                <th>Alamat Perguruan Tinggi</th>
                <th>Kota Perguruan Tinggi</th>
                <th>Jurusan</th>
                <th>Jenjang Pendidikan</th>
                <th>Nama Perusahaan</th>
                <th>Alamat Perusahaan</th>
                <th>Kota Perusahaan</th>
                <th>Nama HRD Perusahaan</th>
                <th>No Telepon HRD Perusahaan</th>
                <th>Tahun Mulai Kerja</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
              {filteredData.map((item) => (
                <tr key={item.id_kuliah_kerja} className="text-center">
                  <td>{item.id_kuliah_kerja}</td>
                  <td>{item.id_siswa}</td>
                  <td>{item.id_login}</td>
                  <td>{item.nama}</td>
                  <td>{item.nama_perguruan_tinggi}</td>
                  <td>{item.alamat_perguruan_tinggi}</td>
                  <td>{item.kota_perguruan_tinggi}</td>
                  <td>{item.jurusan_perguruan_tinggi}</td>
                  {/* <td>
                  <img
                    src={`http://localhost:5000/images/${item.pic_siswa}`}
                    alt={item.nama}
                    style={{ width: 150 }}
                  />
                </td> */}
                  <td>{item.jenjang_pendidikan}</td>
                  <td>{item.nama_perusahaan}</td>
                  <td>{item.alamat_perusahaan}</td>
                  <td>{item.kota_perusahaan}</td>
                  <td>{item.nama_hrd}</td>
                  <td>{item.no_telp_hrd}</td>
                  <td>{item.tahun_mulai_bekerja}</td>
                  <td>
                    <Button
                      onClick={() => handleEdit(item.id_kuliah_kerja)}
                      className="btn btn-primary"
                    >
                      Edit
                    </Button>
                    <Button
                      onClick={() => handleDelete(item.id_kuliah_kerja)}
                      className="btn btn-danger"
                    >
                      Hapus
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default DataSiswaKuliahDanKerja;