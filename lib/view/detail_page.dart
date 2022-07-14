import 'package:doctor_app/Widget/detail_widget.dart';
import 'package:doctor_app/Widget/custom_icons_icons.dart';
import 'package:doctor_app/Widget/he_color.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Doctor doctor;

  const DetailPage({Key? key, required this.doctor}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String MopileNumber = '+972595659707';
  String whatsapp = 'https://wa.me/00970595659707?text=hello';
  SendMessageByWhatsApp(String phone, String message) {
    String url = 'whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}';
    launchUrl(Uri.parse(url));
  }

  ShareNews() {
    Share.share(
      'Dr.' + widget.doctor.firstName + ' ' + widget.doctor.lastName,
    );
  }

  _sendingSMS() async {
    var url = Uri.parse("sms:972595659707");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendingMails() async {
    var url = Uri.parse("mailto:joseph.ana.19221@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr.' +
                        widget.doctor.firstName +
                        ' ' +
                        widget.doctor.lastName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        CustomIcons.pin_location,
                        size: 14,
                        color: HexColor('#C6C6CD'),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'GazaStrip, Palestine',
                        style: TextStyle(
                          color: HexColor('#C6C6CD'),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: HexColor('#FFF9EA'),
                      border: Border.all(color: HexColor('#FFEDBE'), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${widget.doctor.type} Specialist',
                      style: TextStyle(
                        color: HexColor('#FFBF11'),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Dr. Yousef Al-Jazzar a Renal Physician who has comprehensive expertise in the fields of Renal Medicine and Internal Medicine. While Dr Ho specializes in dialysis and critical care nephrology, years of extensive training have also equipped him with skills to effectively handle a wide range of other kidney diseases, including kidney impairment, inflammation, infection and transplantation.',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 91,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const detail_widget(title: '162', subTitle: 'Patients'),
                        const detail_widget(
                            title: '4+', subTitle: 'Exp. Years'),
                        const detail_widget(title: '4273', subTitle: 'Rating'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Apart from kidney-related conditions, Dr Ho also offers care and consultation in various medical conditions that are related to kidney disease, such as hypertension, diabetes and vascular diseases.',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.green,
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      primary: Theme.of(context).colorScheme.errorContainer,
                    ),
                    onPressed: () {
                      _makePhoneCall(MopileNumber);
                    },
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.phone_forwarded,
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text('Contact with phone'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.green,
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      primary: Theme.of(context).colorScheme.errorContainer,
                    ),
                    onPressed: (() {
                      SendMessageByWhatsApp('+970595659707', 'Hello world!');
                    }),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.whatsapp,
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text('Contact with whatsapp'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.green,
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      primary: Theme.of(context).colorScheme.errorContainer,
                    ),
                    onPressed: (() {
                      _sendingMails();
                    }),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.email,
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text('Contact with Email'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.green,
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      primary: Theme.of(context).colorScheme.errorContainer,
                    ),
                    onPressed: (() {
                      _sendingSMS();
                    }),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.chat_rounded),
                        SizedBox(
                          width: 70,
                        ),
                        Text('Contact with SMS'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blue,
                    ),
                    onPressed: (() {
                      ShareNews();
                    }),
                    child: Row(
                      children: const [
                        Icon(Icons.share),
                        SizedBox(
                          width: 70,
                        ),
                        Text('Share'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#D5545A'),
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(CustomIcons.arrow_left, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Container _titleSection() {
    return Container(
      height: 250,
      color: HexColor('#D5545A'),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 207,
              height: 178,
              child: Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg_shape.png'),
              ),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 15,
            child: SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 196 / 285,
                child: Hero(
                  tag: widget.doctor.firstName + widget.doctor.lastName,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/' + widget.doctor.image),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 15,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 32,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: HexColor('#FFBB23'),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    widget.doctor.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    CustomIcons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
