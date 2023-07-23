import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  List<DropDownValueModel> items = [
    const DropDownValueModel(name: "Pending", value: "Pending"),
    const DropDownValueModel(name: "Completed", value: "Completed"),
  ];

  final SingleValueDropDownController controller =
      SingleValueDropDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clPrimary,
        title: const Text("Booking"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dropDown(context, controller, items),
              const SizedBox(
                height: 8,
              ),
              const Text(
                " Your Booking List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              boX(
                  "assets/images/servicecover1.png",
                  "#001",
                  "Apartment Cleaning with floors",
                  "123",
                  "10",
                  "1 Aug 2023",
                  "12:00:00",
                  "Mike",
                  "Online"),
              boX("assets/images/servicecover1.png", "#002", "Garden Cleaning",
                  "102", "5", "1 Aug 2023", "12:00:00", "Jems", "Cash"),
              boX(
                  "assets/images/servicecover1.png",
                  "#003",
                  "Fixing Electronic Devices",
                  "156",
                  "3",
                  "5 Aug 2023",
                  "12:00:00",
                  "Jashon",
                  "Cash"),
              boX(
                  "assets/images/servicecover1.png",
                  "#004",
                  "Apartment Cleaning with floors",
                  "200",
                  "8",
                  "2 Aug 2023",
                  "02:00:00",
                  "Michal",
                  "Online"),
              boX(
                  "assets/images/servicecover1.png",
                  "#005",
                  "Apartment Cleaning with floors",
                  "150",
                  "6",
                  "6 Aug 2023",
                  "15:00:00",
                  "Alex",
                  "Cash"),
              boX(
                  "assets/images/servicecover1.png",
                  "#006",
                  "Apartment Cleaning with floors",
                  "50",
                  "10",
                  "1 Aug 2023",
                  "09:00:00",
                  "Tom",
                  "Cash"),
            ],
          ),
        ),
      ),
    );
  }

  dropDown(context, SingleValueDropDownController controller,
      List<DropDownValueModel> items) {
    return Container(
      color: Colors.grey[200],
      child: DropDownTextField(
        clearOption: false,
        controller: controller,
        dropDownItemCount: items.length,
        dropDownList: items,
        dropdownRadius: 0,
        textFieldDecoration: InputDecoration(
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  boX(String photo, String id, String lable, String price, String offer,
      String date, String time, String provider, String payment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.8),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(photo)),
                    // color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                id,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(lable),
              const SizedBox(
                height: 8,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "\$$price",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: " ($offer% off)",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green))
              ])),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Date",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(date),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Time",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(time),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Provider",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(provider),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Payment",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(payment),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
