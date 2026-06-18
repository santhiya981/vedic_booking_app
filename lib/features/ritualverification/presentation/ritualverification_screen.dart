import 'package:flutter/material.dart';

class RitualVerificationScreen extends StatelessWidget {
  const RitualVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the 4-digit OTP code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // A single TextField instead of 4 separate boxes saves you an hour of debugging
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, letterSpacing: 16),
                decoration: const InputDecoration(
                  hintText: '0000',
                  counterText: '', // Hides the character counter
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Direct navigation to simulate success instantly for your video
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verification Successful!')),
                  );
                  // TODO: Add your navigation to the next step or pop here
                  Navigator.of(context).pop(); 
                },
                child: const Text('Verify and Start Ritual'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}