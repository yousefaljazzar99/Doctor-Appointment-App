import 'package:doctor_app/Widget/category_widget.dart';
import 'package:doctor_app/Widget/header_widget.dart';
import 'package:doctor_app/Widget/topRate_widget.dart';
import 'package:doctor_app/Widget/custom_icons_icons.dart';
import 'package:doctor_app/Widget/he_color.dart';
import 'package:doctor_app/models/category.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/view/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> _headerDoctors = <Doctor>[];
  List<Category> _categories = <Category>[];
  List<Doctor> _TopRateDoctors = <Doctor>[];
  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(doctor: doctor),
        ));
  }

  @override
  void initState() {
    super.initState();
    _headerDoctors = _getHeaderDoctors();
    _categories = _getCategories();
    _TopRateDoctors = _getTopRateDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //////////////////////
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/albert.png'),
                ),
                accountName: Text('Yousef Aljazzar'),
                accountEmail: Text('Yousef.n.aljazzar@gmail.com')),
            ListTile(
              subtitle: Text('Go to heme'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);

                setState(() {});
              },
            ),
            ListTile(
              subtitle: Text('Go to favorite'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
            ),
            ListTile(
              subtitle: Text('Go to Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);

                setState(() {});
              },
            ),
            ListTile(
              subtitle: Text('Go to pationts'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.h_mobiledata),
              title: Text('Patients'),
              onTap: () {
                // Content = 'profile';
                Navigator.pop(context);

                setState(() {});
              },
            ),
            ListTile(
              subtitle: Text('Go to wallet'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.wallet),
              title: Text('wallet'),
              onTap: () {
                Navigator.pop(context);

                setState(() {});
              },
            ),
            ListTile(
              subtitle: Text('Go to Reports'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.report),
              title: Text('Reports'),
              onTap: () {
                Navigator.pop(context);

                setState(() {});
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.logout),
              title: Text('sign out'),
              onTap: () {
                Navigator.pop(context);

                setState(() {});
              },
            ),
          ],
        ),
        ///////////////////
      ),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hDoctorsSection(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(),
                  const SizedBox(
                    height: 32,
                  ),
                  _trDoctorsSection(),
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
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: HexColor('#150047')),
      /*leading: IconButton(
        icon: const Icon(
          CustomIcons.menu,
          size: 14,
        ),
        onPressed: () {},
      ),*/
      actions: [
        IconButton(
          icon: const Icon(
            CustomIcons.search,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  SizedBox _hDoctorsSection() {
    return SizedBox(
      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: _headerDoctors.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(indent: 16),
        itemBuilder: (BuildContext context, int index) => HeaderWidget(
          doctor: _headerDoctors[index],
          onTap: () => _onCellTap(_headerDoctors[index]),
        ),
      ),
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                Category_Widget(category: _categories[index]),
          ),
        ),
      ],
    );
  }

  Column _trDoctorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Rated Doctor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: _TopRateDoctors.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              TopRateDrWidget(doctor: _TopRateDoctors[index]),
        ),
      ],
    );
  }

  List<Doctor> _getHeaderDoctors() {
    List<Doctor> headerDoctors = <Doctor>[];

    headerDoctors.add(Doctor(
      firstName: 'Yousef',
      lastName: 'Al-Jazzar',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    headerDoctors.add(Doctor(
      firstName: 'Husaam',
      lastName: 'Al-Kahlout',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    headerDoctors.add(Doctor(
      firstName: 'Smay',
      lastName: 'Sabbah',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));

    return headerDoctors;
  }

  List<Category> _getCategories() {
    List<Category> categories = <Category>[];
    categories.add(Category(
      icon: CustomIcons.cardiologist,
      title: 'Cardiologist',
    ));
    categories.add(Category(
      icon: CustomIcons.eyes,
      title: 'Eyes',
    ));
    categories.add(Category(
      icon: CustomIcons.pediatrician,
      title: 'Pediatrician',
    ));
    return categories;
  }

  List<Doctor> _getTopRateDoctors() {
    List<Doctor> TopRateDoctors = <Doctor>[];

    TopRateDoctors.add(Doctor(
      firstName: 'Ahmed',
      lastName: 'Atif',
      image: 'albert.png',
      type: 'Bone',
      rating: 4.3,
    ));
    TopRateDoctors.add(Doctor(
        firstName: 'Sami',
        lastName: 'Sabbah',
        image: 'mathew.png',
        type: 'Kidney',
        rating: 4.7));
    TopRateDoctors.add(Doctor(
        firstName: 'Moutaz',
        lastName: 'Ajwa',
        image: 'albert.png',
        type: 'Kidney',
        rating: 4.3));
    TopRateDoctors.add(Doctor(
      firstName: 'Yazn',
      lastName: 'Al-khas',
      image: 'albert.png',
      type: 'Bone',
      rating: 4.5,
    ));
    TopRateDoctors.add(Doctor(
      firstName: 'Ahmed',
      lastName: 'Atif',
      image: 'albert.png',
      type: 'Bone',
      rating: 4.3,
    ));
    TopRateDoctors.add(Doctor(
        firstName: 'Moutaz',
        lastName: 'Ajwa',
        image: 'albert.png',
        type: 'Kidney',
        rating: 4.3));
    TopRateDoctors.add(Doctor(
        firstName: 'Sami',
        lastName: 'Sabbah',
        image: 'mathew.png',
        type: 'Kidney',
        rating: 4.7));
    return TopRateDoctors;
  }
}
