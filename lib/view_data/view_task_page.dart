import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp/authentication/signupPage.dart';
import 'package:todoapp/controler/login_controler.dart';
import 'package:todoapp/controler/productData_controler.dart';
import 'package:todoapp/model/model.dart';
import 'package:todoapp/utilities/constants/colors.dart';
import 'package:todoapp/utilities/helperfuction/helperfuction.dart';
import 'package:todoapp/view_data/bodySectionsWIdgets/appBar.dart';
import 'package:todoapp/view_data/notification/notification.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({super.key});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    // textfield textediting veriables ..
    final updateName = TextEditingController();
    final updatePrice = TextEditingController();
    final name = TextEditingController();
    final price = TextEditingController();
    // get put logcontroler .. 
    final logcontroler = Get.put(LoginControler());

    //dark mode bool veriable  ..
    final bool isdark = Phelperfuction.isdark(context);
    //Get put productControler .. 
    final productControler = Get.put(ProductdataControler());
    return Scaffold(
      backgroundColor: isdark ? Pcolors.darkgrey : Pcolors.light,
     // Profile drawer  ..
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Pcolors.darkgrey),
              accountName: Text('APronoy Sarkar'),
              accountEmail: Text('@apronoy17'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/suit.jpeg'),
              ),
            ),
            ListTile(
              title: const Text('Notification'),
              leading: const Icon(Iconsax.notification),
              onTap: () {
                Get.to(() => const NotificationPages());
              },
            ),
            ListTile(
              title: const Text('Add Account'),
              leading: const Icon(Iconsax.user_add),
              onTap: () {
                Get.offAll(() => const Signuppage());
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Iconsax.logout),
              onTap: () {
                logcontroler.logout();
              },
            ),
          ],
        ),
      ),

      // show data after fatching ....
      body: Column(
        children: [
          //appbar ..
          const Appbar(),
          // task ..
          Expanded(
            child: FutureBuilder(
                future: productControler.getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      return Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: isdark
                                ? Colors.blue.withOpacity(0.8)
                                : Colors.blue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(product.name),
                          // data update and delete from user interface ..
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(product.price.toString()),
                              const SizedBox(width: 10),
                              // Update button...
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // show in edit field ..
                                        updateName.text = product.name;
                                        updatePrice.text = product.price;
                                        // Alert section ..
                                        return AlertDialog(
                                          title: const Text('Update Item'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // update product name field.. 
                                              TextFormField(
                                                controller: updateName,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Name',
                                                        prefixIcon:
                                                            Icon(Icons.edit)),
                                              ),
                                              const SizedBox(height: 15),
                                              // update product price field ..
                                              TextFormField(
                                                controller: updatePrice,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Price',
                                                        prefixIcon:
                                                            Icon(Icons.edit)),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            // Update product..
                                            TextButton(
                                                onPressed: () {
                                                  productControler.updateData(
                                                      product.id, {
                                                    'Name': updateName.text,
                                                    'Price': updatePrice.text
                                                  });
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: const Text('Update'))
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),

                              // product delete button ..
                              IconButton(
                                  onPressed: () {
                                    productControler.deleteData(product.id);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      // floating add button to add product list .. 
      floatingActionButton: FloatingActionButton(
        backgroundColor: isdark ? Pcolors.blue : Pcolors.blue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Product Data '),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //name field ..
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                            labelText: 'Name', prefixIcon: Icon(Iconsax.text)),
                      ),
                      const SizedBox(height: 15),
                      // price field ..
                      TextFormField(
                        controller: price,
                        decoration: const InputDecoration(
                            labelText: 'Price',
                            prefixIcon: Icon(Icons.price_change)),
                      ),
                    ],
                  ),
                  // add button to add item  ..
                  actions: [
                    TextButton(
                        onPressed: () {
                          productControler.postUser(ProductModel(
                              name: name.text, id: '', price: price.text));

                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
