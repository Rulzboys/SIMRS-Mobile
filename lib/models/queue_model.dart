/// Model antrian pasien hari ini.
class QueueModel {
  final String myNumber;
  final String currentlyServing;
  final int estimatedMinutes;
  final int positionAhead;
  final String clinicName;

  const QueueModel({
    required this.myNumber,
    required this.currentlyServing,
    required this.estimatedMinutes,
    required this.positionAhead,
    required this.clinicName,
  });

  factory QueueModel.dummy() {
    return const QueueModel(
      myNumber: 'A-023',
      currentlyServing: 'A-018',
      estimatedMinutes: 15,
      positionAhead: 5,
      clinicName: 'Poli Penyakit Dalam',
    );
  }
}
