import 'package:flutter/material.dart';
import 'package:tugas4praktikum2024/model/produk.dart';

class ProdukForm extends StatefulWidget {
  Produk? produk;

  ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk Nicholas";
  String tombolSubmit = "Simpan";

  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  void initState() {
    super.initState();
      isUpdate();
  }

  isUpdate(){
    if(widget.produk != null){
      setState((){
        judul = "Ubah Produk Nicholas";
        tombolSubmit = "Ubah";
        _kodeProdukController.text = widget.produk!.kodeProduk!;
        _namaProdukController.text = widget.produk!.namaProduk!;
        _hargaProdukController.text = widget.produk!.hargaProduk.toString();
      });
    } else{
      judul = "Tambah Produk Nicholas";
      tombolSubmit = "Simpan";
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      )
    );
  }


  //Membuat Textbox Kode Produk
  Widget _kodeProdukTextField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukController,
      validator: (value){
        if(value!.isEmpty){
          return 'Kode Produk harus diisi';
        }
        return null;
      },
    );
  }

  //Membuat Textbox Nama Produk
  Widget _namaProdukTextField(){
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukController,
      validator: (value){
        if(value!.isEmpty){
          return 'Nama Produk harus diisi';
        }
        return null;
      },
    );
  }

  //Membuat Textbox Harga Produk
  Widget _hargaProdukTextField(){
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga Produk"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukController,
      validator: (value){
        if(value!.isEmpty){
          return 'Harga Produk harus diisi';
        }
        return null;
      },
    );
  }

  //Membuat Tombol Simpan
  Widget _buttonSubmit(){
    return OutlinedButton(
      child: Text(tombolSubmit),
      onPressed: (){
        var validate = _formKey.currentState!.validate();
      });
  }

}
