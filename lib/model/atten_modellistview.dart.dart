class Attenmodel {
  final date;
  final punchin;
  final punchout;
  final pics;

  Attenmodel(
    this.date,
    this.punchin,
    this.punchout,
    this.pics,
  );
}

List<Attenmodel> AttenData = [
  new Attenmodel('12 June 2022', '09.00 AM', '6.00 PM', 'assets/icon/01.png'),
  new Attenmodel('12 June 2022', '09.00 AM', '6.00 PM', 'assets/icon/02.png'),
  new Attenmodel('12 June 2022', '09.00 AM', '6.00 PM', 'assets/icon/01.png'),
  new Attenmodel('12 June 2022', '09.00 AM', '6.00 PM', 'assets/icon/01.png'),
  new Attenmodel('12 June 2022', '09.00 AM', '6.00 PM', 'assets/icon/02.png'),
];
