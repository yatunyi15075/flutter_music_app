import 'package:flutter/material.dart';
import 'package:music_app/views/pages/playing.dart';
import 'package:music_app/views/pages/theme_selection.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedStreamingQuality = 'HD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text('Music Language(s)',
                style: TextStyle(color: Colors.white)),
            trailing:
                Text('English, Tamil', style: TextStyle(color: Colors.white)),
            onTap: () => _showLanguageSelection(context),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Streaming Quality',
                style: TextStyle(color: Colors.white)),
            trailing: Text(_selectedStreamingQuality,
                style: TextStyle(color: Colors.white)),
            onTap: () => _showStreamingQualitySelection(context),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title:
                Text('Download Quality', style: TextStyle(color: Colors.white)),
            trailing: Text('HD', style: TextStyle(color: Colors.white)),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Equalizer', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              // Navigate to Equalizer settings
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Auto-Play', style: TextStyle(color: Colors.white)),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // Handle Auto-Play switch change
              },
            ),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Show Lyrics on Player',
                style: TextStyle(color: Colors.white)),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // Handle Show Lyrics switch change
              },
            ),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Connect to a Device',
                style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              // Navigate to Connect to a Device settings
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Change theme', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThemeSelectionPage(),
                  ));
            },
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Others',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title:
                Text('Help & Support', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              // Navigate to Help & Support
            },
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('Select Language(s)',
                        style: TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  _buildLanguageOption(context, 'International'),
                  _buildLanguageOption(context, 'Tamil'),
                  _buildLanguageOption(context, 'Telugu'),
                  _buildLanguageOption(context, 'Kannada'),
                  _buildLanguageOption(context, 'Hindi'),
                  _buildLanguageOption(context, 'Malayalam'),
                  _buildLanguageOption(context, 'Punjabi'),
                  _buildLanguageOption(context, 'Bengali'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Done'),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext context, String language) {
    return CheckboxListTile(
      title: Text(language, style: TextStyle(color: Colors.white)),
      value: false,
      onChanged: (bool? value) {
        // Handle language selection change
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.pink,
      checkColor: Colors.black,
    );
  }

  void _showStreamingQualitySelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('Select Streaming Quality',
                        style: TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  _buildQualityOption(context, 'HD', 'High Definition'),
                  _buildQualityOption(
                      context, 'Auto', 'Automatic Quality Adjustment'),
                  _buildQualityOption(context, 'High', 'High Quality'),
                  _buildQualityOption(context, 'Medium', 'Medium Quality'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Done'),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQualityOption(
      BuildContext context, String quality, String subtitle) {
    return RadioListTile<String>(
      title: Text(quality, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      value: quality,
      groupValue: _selectedStreamingQuality,
      onChanged: (String? value) {
        setState(() {
          _selectedStreamingQuality = value!;
        });
      },
      activeColor: Colors.pink,
    );
  }
}
