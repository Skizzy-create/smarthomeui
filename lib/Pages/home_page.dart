import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/Util/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // List of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath, powerStatus ]
    ["Smart Light","Assets/icons/light-bulb.png", true],
    ["Smart Ac","Assets/icons/air-conditioner.png", false],
    ["Smart TV","Assets/icons/smart-tv.png", false],
    ["Smart Fan","Assets/icons/fan.png", false],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index){
   setState(() {
     mySmartDevices[index][2] = value;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        //Custom App Bar
            Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              // menu icon
              Image.asset(
                'Assets/icons/menu.png',
                height: 45,
                color: Colors.grey[800],
              ),
              // account icon
              Icon(
                Icons.person,
                size: 45,
                color: Colors.grey[800],
              )
              ],
            ),
          ),
            const SizedBox(height: 10.00),
        // welcome home Kartik Aslia
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                'Welcome Home',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                  "Kartik Aslia",
              style: GoogleFonts.bebasNeue(
                fontSize: 75,
              ),
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        //smart device + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding,),
              child: Text(
                "Smart Devices",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.grey[800],
              ),
              ),
            ),

            Expanded(child:
            GridView.builder(
              itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(25.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 1/1.3
                ),
                itemBuilder: (context,index){
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerStatus: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index) ,
                  ); // inside smart_device_box
                }
            ))
        ],
        ),
      ),
    );
  }
}
