
## **مقدمة**
قبل تنفيذ خطوات العمل، تأكد من تحميل ملف **الجينوم المرجعي** وملفات **FASTQ** في المجلدات المخصصة.

لمشاهدة الدرس على اليوتيوب: https://youtu.be/g40S6DzZkdk

لتحميل ملفات Fastq: 
```bash
fastq-dump --split-files SRR30893788
```




## **1. تثبيت BWA-MEM2**
قم بتنفيذ الأوامر التالية لتثبيت أداة **BWA-MEM2**:
يمكنك زيارة [صفحة GitHub الخاصة بأداة BWA-MEM2](https://github.com/bwa-mem2/bwa-mem2) لمزيد من المعلومات.

```bash
git clone --recursive https://github.com/bwa-mem2/bwa-mem2
cd bwa-mem2
git submodule init
git submodule update
make
./bwa-mem2
```

## **2. إضافة BWA-MEM2 إلى مسار PATH**
افتح ملف الإعدادات باستخدام الأمر التالي:

```bash
nano ~/.bashrc
```

أضف السطر التالي إلى الملف:

```bash
export PATH="$PATH:/home/atheer/dalah/bwa-mem2"
```

> **ملاحظة:** قم بتعديل المسار "/home/atheer/dalah/" إلى المسار الخاص بك.

ثم نفذ الأمر التالي لتفعيل التغييرات:

```bash
source ~/.bashrc
```

## **3. فهرسة الجينوم المرجعي**
نفذ الأمر التالي لفهرسة ملف الجينوم المرجعي:

```bash
bwa-mem2 index reference_genome/chr17.fa.gz
```

## **4. مطابقة ملفات FASTQ إلى الجينوم المرجعي**
استخدم الأمر التالي لمطابقة ملفات **FASTQ** مع الجينوم المرجعي:

```bash
bwa-mem2 mem -t 4 reference_genome/chr17.fa.gz fastq_files/SRR30893788_1.fastq fastq_files/SRR30893788_2.fastq > SRR30893788.sam
```

## **5. تحويل ملف SAM إلى ملف BAM باستخدام samtools**
نفذ الأمر التالي لتحويل الملف الناتج من صيغة **SAM** إلى **BAM**:

```bash
samtools view -b SRR30893788.sam > SRR30893788.bam
```

## **ملاحظة ختامية**
تأكد من أن جميع المسارات صحيحة وأن الأدوات مثبتة بشكل صحيح قبل بدء العملية لضمان نجاح التحليل.
