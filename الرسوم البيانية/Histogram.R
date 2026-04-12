#  دَالّة | الرسوم البيانية في المعلوماتية الحيوية
#  الحلقة ١: المدرج التكراري (Histogram)

#تحميل المكتبات 

library(ggplot2)   # للرسم
library(tidyr)     # لتحويل شكل البيانات
library(dplyr)     # لمعالجة البيانات


# الخطوة ٢: قراءة البيانات 

# هكذا تأتي بيانات RNA-seq في الواقع:
# صف لكل جين، عمود لكل عينة
expr_matrix <- read.csv("dalah_rnaseq_wide.csv", row.names = 1)

# معلومات العينات (أي عينة في أي مجموعة)
metadata <- read.csv("dalah_metadata.csv")

# اطلع على شكل البيانات
head(expr_matrix)
# gene     S1_ctrl  S2_ctrl  S3_ctrl  S4_treat  S5_treat  S6_treat
# ACTB      7.21     7.38     7.15     7.19      7.42      7.28
# AKT1      5.33     5.49     5.26     7.54      7.71      7.43
# ...


# الخطوة ٣: تحويل الشكل  long format 
#
#  ggplot2 تحتاج البيانات بشكل مختلف:
#  بدل ما كل عينة عمود، نحتاج عمود واحد "sample" وعمود "expression"
#
#  wide format (كما تأتي):          long format (ما نحتاجه ggplot):
#  gene   S1   S2   S3   ...       gene   sample   expression
#  ACTB   7.2  7.3  7.1  ...  →   ACTB   S1_ctrl  7.2
#  AKT1   5.3  5.4  5.2  ...       ACTB   S2_ctrl  7.3
#                                  ...

df <- expr_matrix %>%
  # نضيف عمود gene من أسماء الصفوف
  mutate(gene = rownames(expr_matrix)) %>%
  # نحول من wide إلى long
  pivot_longer(
    cols      = -gene,       # كل الأعمدة ما عدا gene
    names_to  = "sample",    # أسماء العينات في عمود جديد
    values_to = "expression" # القيم في عمود expression
  ) %>%
  # نضيف معلومات المجموعة من الـ metadata
  left_join(metadata, by = "sample")

# الاطلاع على النتيجة
head(df)
# gene  sample    expression  group
# ACTB  S1_ctrl   7.21        Control
# ACTB  S2_ctrl   7.38        Control
# ...


#  الرسم ١: المدرج التكراري الأساسي
#  الهدف: رسم كيف تتوزع قيم التعبير الجيني


ggplot(df, aes(x = expression)) +
  geom_histogram(
    bins  = 20,        # عدد الأعمدة — جرب 10 أو 30 لرؤية الفرق
    fill  = "#2A9D8F", # لون الأعمدة
    color = "white"    # لون حواف الأعمدة
  ) +
  labs(
    title = "Gene Expression",
    x     = "log2 Expression",
    y     = "Frequency"
  ) +
  theme_minimal(base_size = 14)

# ماذا نلاحظ؟
# - معظم القيم بين 3 و8 (هذا طبيعي بعد log2)
# - التوزيع شبه متماثل — لأن البيانات لدينا بعد log2
# - لو كانت raw counts لكان شكل مختلف تماماً (منحرف لليمين)


#  الرسم ٢: مدرج تكراري منفصل لكل مجموعة
#  الهدف: هل التوزيع مختلف بين Control و Treatment؟

ggplot(df, aes(x = expression, fill = group)) +
  geom_histogram(
    bins     = 20,
    color    = "white",
    alpha    = 0.7,      
    position = "identity" 
  ) +
  scale_fill_manual(values = c(
    "Control"   = "#3E4677",
    "Treatment" = "#2A9D8F"
  )) +
  labs(
    title = "Gene Expression | Control vs Treatment",
    x     = "log2 Expression",
    y     = "Frequency",
    fill  = "Group"
  ) +
  theme_minimal(base_size = 14)

# ماذا نلاحظ؟
# - Treatment (أخضر) ينزاح نحو اليمين — تعبير أعلى بشكل عام
# - هذا يعني أن العلاج رفع تعبير معظم الجينات