import 'package:flutter/material.dart';
import 'package:hellobalemoya_app/Itu/models/job.dart';
import 'package:hellobalemoya_app/Itu/services/job_service.dart';

class JobListScreen extends StatelessWidget {
  final JobService jobService = JobService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Jobs')),
      body: FutureBuilder<List<Job>>(
        future: jobService.getAvailableJobs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final jobs = snapshot.data!;
          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return ListTile(
                title: Text(job.title),
                trailing: ElevatedButton(
                  onPressed: () async {
                    await jobService.completeJob(job.id as int);
                    // Update UI accordingly
                  },
                  child: Text('Complete Job'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
