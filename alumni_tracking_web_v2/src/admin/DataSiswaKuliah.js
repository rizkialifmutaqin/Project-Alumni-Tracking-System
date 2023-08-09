import React, { useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { Button, Form } from "react-bootstrap";
import axios from "axios";
import Sidebar from "./Sidebar";

const DataSiswaKuliah = () => {
  const [data, setData] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterOption, setFilterOption] = useState("Semua");
  const history = useHistory();

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = () => {
    axios
      .get("http://localhost:5000/api/dataSiswaKuliahWithNamaSiswa")
      .then((response) => setData(response.data))
      .catch((err) => console.error(err));
  };

  const handleEdit = (id) => {
    history.push(`/dataSiswaKuliah/editSiswaKuliah/${id}`);
  };

  const handleTambah = () => {
    history.push(`/dataSiswaKuliah/tambahSiswaKuliah`);
  };

  const handleDelete = (id) => {
    const confirmDelete = window.confirm(
      "Anda yakin ingin menghapus data ini?"
    );
    if (confirmDelete) {
      axios
        .delete(`http://localhost:5000/api/dataSiswaKuliah/${id}`)
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
      (item.id_kuliah.toString().includes(searchTerm) ||
        item.id_siswa.toString().includes(searchTerm) ||
        item.id_login.toString().includes(searchTerm) ||
        item.nama.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.nama_perguruan_tinggi_tgl.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.alamat_perguruan_tinggi_tgl.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.kota_perguruan_tinggi_tgl.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.jurusan_perguruan_tinggi_tgl.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.jenjang_pendidikan_tgl.toLowerCase().includes(searchTerm.toLowerCase())) &&
      (filterOption === "Semua" || item.jenjang_pendidikan_tgl === filterOption)
  );

  return (
    <div className="d-flex">
      <Sidebar />
      <div className="flex-grow-1 content">
        <div className="text-center my-5">
          <h1>Data Siswa Kuliah</h1>
          <Form.Control
            type="text"
            placeholder="Cari..."
            value={searchTerm}
            onChange={handleSearch}
          />
        </div>

        <div>
          <Form.Group className="mt-2 mb-2 w-25" style={{marginLeft: 'auto'}}>
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
            </Form.Select>
          </Form.Group>
        </div>

        <div className="mb-2">
          <Button
            onClick={() => handleTambah()}
            className="mb-2"
            variant="outline-primary"
          >
            Tambah Data Siswa Kuliah
          </Button>
        </div>

        <table className="table table-hover">
          <thead className="table-dark">
            <tr className="text-center">
              <th>ID Kuliah</th>
              <th>ID Siswa</th>
              <th>ID Login</th>
              <th>Nama Siswa</th>
              <th>Nama Perguruan Tinggi</th>
              <th>Alamat Perguruan Tinggi</th>
              <th>Kota</th>
              <th>Jurusan</th>
              <th>Jenjang Pendidikan</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            {filteredData.map((item) => (
              <tr key={item.id_kuliah} className="text-center">
                <td>{item.id_kuliah}</td>
                <td>{item.id_siswa}</td>
                <td>{item.id_login}</td>
                <td>{item.nama}</td>
                <td>{item.nama_perguruan_tinggi_tgl}</td>
                <td>{item.alamat_perguruan_tinggi_tgl}</td>
                <td>{item.kota_perguruan_tinggi_tgl}</td>
                <td>{item.jurusan_perguruan_tinggi_tgl}</td>
                <td>{item.jenjang_pendidikan_tgl}</td>
                <td>
                  <Button
                    onClick={() => handleEdit(item.id_kuliah)}
                    className="btn btn-primary"
                  >
                    Edit
                  </Button>{" "}
                  <Button
                    onClick={() => handleDelete(item.id_kuliah)}
                    className="btn btn-danger"
                  >
                    Hapus
                  </Button>{" "}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default DataSiswaKuliah;
