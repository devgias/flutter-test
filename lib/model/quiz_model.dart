part of 'models.dart';

class QuizModel extends Equatable {
  final int? id;
  final String? question;
  final List<String>? options;
  final int? trueAnswer;
  String? selectedAnswer;
  bool? answered;

  QuizModel({
    this.id,
    this.question,
    this.options,
    this.trueAnswer,
    this.answered,
    this.selectedAnswer,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        options,
        trueAnswer,
        answered,
        selectedAnswer,
      ];

  QuizModel copyWith({
    int? id,
    String? question,
    List<String>? options,
    int? trueAnswer,
    String? selectedAnswer,
    bool? answered,
  }) =>
      QuizModel(
        id: this.id,
        question: this.question,
        options: this.options,
        trueAnswer: this.trueAnswer,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        answered: answered ?? this.answered,
      );
}

List<QuizModel> mockQuiz = [
  QuizModel(
    id: 1,
    question:
        'berapa hari sekali RO dan Promotor melakukan proses stock opname handphone?',
    options: const [
      'A. satu hari sekali',
      'B. dua hari sekali',
      'C. satu minggu sekali',
      'D. tiga hari sekali',
    ],
    trueAnswer: 0,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 2,
    question:
        'berapa hari sekali RO dan Promotor melakukan proses stock opname aksesori?',
    options: const [
      'A. satu hari sekali',
      'B. dua hari sekali',
      'C. satu minggu sekali',
      'D. tiga hari sekali',
    ],
    trueAnswer: 1,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 3,
    question: 'kepada siapa hasil stock opname wajib dilaporkan?',
    options: const [
      'A. retail store manager',
      'B. retail store coordinator',
      'C. retail store head',
      'D. operational audit team',
    ],
    trueAnswer: 2,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 4,
    question:
        'apa yang perlu dilakukan ketika terjadi selisih antara stok di sistem dengan stok fisik?',
    options: const [
      'A. membiarkan selisih yang terjadi',
      'B. bekerjasama dengan seluruh tim toko untuk menyembunyikan selisih',
      'C. bersikap tidak tahu apa apa ',
      'D. membuat laporan ke operasional audit tim',
    ],
    trueAnswer: 3,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 5,
    question:
        'Menurut Surat Edaran Tentang Mekanisme Stock Opname Toko Retail Nomor 599/SE/CS/HC/XI/2021 berikut merupakan sanksi pelanggaran jika tidak melakukan stock opname sesuai dengan ketentuan, kecuali ?',
    options: const [
      'A. Masuk Pagi Selama 3 hari',
      'B. Teguran oleh tim audit dan dilaporkan ke Retail Store Coordinator (RSC)',
      'C. Pembuatan Surat Pernyataan',
      'D. Surat Peringatan (SP) secara berjenjang',
    ],
    trueAnswer: 0,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 6,
    question: 'Bagaimana proses stock opname handphone dilakukan ?',
    options: const [
      'A. Dengan promotor masing-masing brand (Promotor Oppo Stock opname Handphone Oppo)',
      'B. Dengan cara merode lintas promotor (Misalnya, promotor vivo melakukan Stock Opname unit handphone Oppo)',
      'C. Stock opname selalu dilakukan oleh Relationship Officer (RO)',
      'D. Stock opname selalu dilakukan oleh Retail Store Head (RSH)',
    ],
    trueAnswer: 1,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 7,
    question:
        'Bagaimana cara melakukan stock opname handphone  yang tidak memiliki promotor di toko retail ?',
    options: const [
      'A. Tidak perlu dilakukan stock opname',
      'B. Stock opname hanya dapat dilakukan oleh Relationship Officer (RO)',
      'C. Stock opname dilakukan oleh promotor yang ada dan Relationship Officer (RO) secara bergantian',
      'D. Stock opname hanya dapat dilakukan oleh Retail Store Head (RSH)',
    ],
    trueAnswer: 2,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 8,
    question:
        'Relationship officer (RO) dan Promotor wajib melaporkan hasil stock opname kepada ?',
    options: const [
      'A. Admin Data Retail',
      'B. Admin Retail',
      'C. Retail Store Coordinator',
      'D. Retail Store head',
    ],
    trueAnswer: 3,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 9,
    question:
        'Siapakah yang wajib melaporkan hasil stock opname ke whatsapp group ?',
    options: const [
      'A. Retail Store head',
      'B. Promotor',
      'C. Relationship Officer',
      'D. Retail Store Coordinator',
    ],
    trueAnswer: 0,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 10,
    question:
        'Apakah lembar kerja stock opname wajib ditanda tangani oleh Relationship officer , promotor dan Retaol Store Head  setiap lembar nya ?',
    options: const [
      'A. Tidak wajib',
      'B. Wajib',
      'C. boleh diisi boleh tidak',
      'D. tidak boleh di tanda tangani',
    ],
    trueAnswer: 1,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 11,
    question:
        'Apa yang harus dilalukan oleh PIC yang melakukan stock opname apabila terdapat selisih kurang ?',
    options: const [
      'A. tidak dilakukan pelaporan',
      'B. dilaporkan bahwa barang itu ada',
      'C. Wajib menyantumkan keterangan beserta tanggal transaksi atau tanggal keluar masuk barang',
      'D. hanya asal ceklis lembar kerja',
    ],
    trueAnswer: 2,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 12,
    question:
        'Apa yang harus dilalukan oleh PIC yang melakukan stock opname apabila terdapat selisih lebih ?',
    options: const [
      'A. tidak dilakukan pelaporan',
      'B. dilaporkan bahwa barang itu ada',
      'C. hanya asal ceklis lembar kerja',
      'D. Wajib menyantumkan nama barang beserta asal barang tersebut',
    ],
    trueAnswer: 3,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 13,
    question:
        'Apa faktor yang menyebabkan terdapat selisih barang pada saat stock opname , kecuali ?',
    options: const [
      'A. Barang belum terjual',
      'B. penjualan barang yang masih menggunakan nota manual & belum distruk karena error sistem/perangkat komputer/mati listrik.',
      'C. penjualan leasing yang belum diproses Surat Jalan (SJ) untuk toko prinsipal atau penyetrukan untuk toko mitra.',
      'D. penjualan tempo ke instansi yang belum diproses Surat Jalan (SJ) untuk toko prinsipal atau penyetrukan untuk toko mitra. ',
    ],
    trueAnswer: 0,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 14,
    question: 'Berapa hari proses penyelesain transfer order ?',
    options: const [
      'A. maksimal 7 hari',
      'B. maksimal 3 hari',
      'C. maksimal 10 hari',
      'D. maksimal 14 hari',
    ],
    trueAnswer: 1,
    selectedAnswer: null,
    answered: null,
  ),
  QuizModel(
    id: 15,
    question:
        'Apa yang wajib dilakukan oleh Retail Store Head (RSH) apabila terdapat selisih dengan indikasi fraud ?',
    options: const [
      'A. tidak melaporkan selisih tersebut',
      'B. membiarkan saja selisih tersebut',
      'C. Membuat berita acara dan melaporkan ke internal audit',
      'D. memberikan sanksi sendiri',
    ],
    trueAnswer: 2,
    selectedAnswer: null,
    answered: null,
  ),
];
