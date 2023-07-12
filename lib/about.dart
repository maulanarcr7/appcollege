import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  final String githubUrl = 'https://maulanarcr7.github.io/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 80,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Maulana Rahman',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Junior Programmer',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Halo namaku Maulana Rahman biasa dipanggil Alan!'
              ' Aku berprofesi sebagai Junior Web Programmer dan IT Support.'
              ' Namun tidak hanya sampai situ, aku juga memiliki antusias tinggi pada bidang Cyber Security!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                child: Text('College Application'),
                onPressed: () {
                  Navigator.pushNamed(context, '/readData');
                }),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('My GitHub!'),
              onPressed: () => _launchURL(githubUrl),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
