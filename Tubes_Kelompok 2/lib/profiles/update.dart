import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _NoTeleponController = TextEditingController(); 
  
  final String oldName = "Vincent Alexander Li";
  final String oldNoTelepon = "082234567892";

  void showCustomDialog({
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    bool isSuccess = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 36,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 20),
      
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (isSuccess) {
                        // Jika sukses, kembali ke halaman sebelumnya
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9900),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _validateAndUpdate() {
    String name = _nameController.text.trim();
    String noTelp = _NoTeleponController.text.trim();

    if (name.isEmpty) {
      showCustomDialog(
        title: "Peringatan",
        message: "Nama tidak boleh kosong!",
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.orange,
      );
      return;
    }

    if (noTelp.isEmpty) {
      showCustomDialog(
        title: "Peringatan",
        message: "Nomor Telepon tidak boleh kosong!",
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.orange,
      );
      return;
    }

    if (name.length < 3) {
      showCustomDialog(
        title: "Peringatan",
        message: "Nama harus minimal 3 karakter!",
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.orange,
      );
      return;
    }

    if(noTelp.length <12){
      showCustomDialog(
        title: "Peringatan", 
        message: "Nomor Telepon tidak boleh kurang dari 12 digit!", 
        icon: Icons.warning_amber_rounded, 
        iconColor: Colors.orange,
        );
        return;
    }

    if (name == oldName && noTelp == oldNoTelepon) {
      showCustomDialog(
        title: "Peringatan",
        message: "Data baru tidak boleh sama dengan data lama!",
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.orange,
      );
      return;
    }

    showCustomDialog(
      title: "Sukses",
      message: "Data berhasil diperbarui",
      icon: Icons.check_circle_outline,
      iconColor: Colors.green,
      isSuccess: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = oldName;
    _NoTeleponController.text = oldNoTelepon;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _NoTeleponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF0066CC),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Data Diri',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(width: 40),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: Icon(
                          Icons.person_outline,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Nama',
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(221, 184, 184, 184),
                                fontSize: 16,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No Telepon',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          TextField(
                            controller: _NoTeleponController,
                            decoration: InputDecoration(
                              hintText: 'No Telepon',
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(221, 184, 184, 184),
                                fontSize: 16,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    _validateAndUpdate();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9900),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Perbarui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}