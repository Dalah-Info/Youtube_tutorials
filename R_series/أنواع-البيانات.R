# ما هو المتغير
sample_id <- "S001"
num_genes <- 1000
seq(from=1,to=10,by=2) #للحصول على تسلسل أرقام فردية

# شروط وممارسات تسمية المتغيرات
sample_id <- "S002" #يبدأ بحرف كابيتال
Sample_id <- "S003" #يبدأ يحرف سمول
sample1 <- "s004" #يحتوي عى رقم 
1sample <- "s005" #ERROR لأنه يحتوي على رقم في البداية
sample.id <- "s006" #يحتوي على نقطة
sample-id <- "s007" #ERROR 
sample id <- "s008" #ERROR يحتوي على مسافة
if <- "s009" #ERROR
for <- "s0010" #ERROR
TRUE <- "s0011" #ERROR
FALSE <- "s0012" #ERROR
gene1 <- "BRCA1"
gene2 <- "BRCA1"
gene_name <- "EGFR"
gene_name <- "TP53"

# أنواع البيانات وأمثلة عملية على التعامل مع المتغيرات
#الأعداد| Numeric
num_genes <- 300
average_expression <- 15.7
num_samples <- 100

# العمليات الحسابية على المتغيرات العددية
total <- num_genes * num_samples
num_genes + num_samples
num_genes - num_samples

# النصوص | Character
gene_name <- "BRCA1"
gene_name <- BRCA1 #ERROR
dna_seq <- "ATCGGCTA"

# القيم المنطقية (TRUE/FALSE) | Logical
a <- 1
b <- 2
b >= a
b <= a

# القوائم | Vectors
gene_name <- c("BRCA1","TP53","EGFR")
expression_level <- c(12.5,40,14)

# الإطارات البيانية | Data Frames
gene_data <- data.frame(gene_name = c("BRCA1","TP53","EGFR"),expression_level = c(12.5,40,14))

# القوائم | Lists
gene_info <- list(gene_name = "BRCA1",
                  expression_level = 12.5,
                  has_mutation = TRUE)
gene_info$expression_level

# الفرق بين الإطارات البيانية و القوائم
# القوائم
gene_info2 <- list(gene_name=c('BRCA1',"TP53"),
                   expression_level = 12.5,
                   mutation = c(TRUE,FALSE))

#إطار بيانات
gene_info3 <- data.frame(gene_name=c("BRCA1","TP53","BRCA2"),
                         expression_level = 12.5,
                         mutation = c(TRUE,FALSE))











