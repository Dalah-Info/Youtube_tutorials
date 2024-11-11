# تثبيت وتحميل مكتبة Tidyverse
install.packages("tidyverse")
library(tidyverse)

# قراءة الملف 
airway <- read.csv("airway_data.csv")

# عرض الجدول 
print(airway)
view(airway)

# %>% شرح


# 1. filter(): تصفية الجينات التي يكون فيها التعبير الجيني المعالج أكبر من 1000
high_expression_genes <- airway %>% 
  filter(expression_treated > 1000)
print(high_expression_genes)

# 2. select(): اختيار عمودي الجين والتعبير الجيني المعالج فقط
selected_genes <- airway %>%
  select(gene, expression_treated)

# 3. mutate(): إنشاء عمود جديد لحساب نسبة التعبير بين حالتي الأساس  والمعالج
airway <- airway %>%
  mutate(ratio = expression_treated / expression_control)


# 4. arrange(): ترتيب الجينات حسب التعبير الجيني المعالج تنازليًا
sorted_genes <- airway %>%
  arrange(desc(expression_treated))

# 5. group_by() و summarise(): حساب متوسط التعبير الجيني المعالج لكل نوع من أنواع الجينات
summarized_genes <- airway %>%
  group_by(gene_type) %>%
  summarise(mean_expression_treated = mean(expression_treated))

# 6. Chaining: دمج عدة دوال معًا
result <- airway %>%
  filter(expression_treated > 500) %>%
  select(gene, expression_treated, gene_type) %>%
  arrange(desc(expression_treated))

########
#بدون استخدام رمز %>%

# 1. تصفية البيانات بحيث يكون التعبير الجيني المعالج أكبر من 500
filtered_data <- filter(airway, expression_treated > 500)

# 2. اختيار الأعمدة المطلوبة فقط
selected_data <- select(filtered_data, gene, expression_treated, gene_type)

# 3. ترتيب البيانات تنازليًا حسب التعبير الجيني المعالج
result <- arrange(selected_data, desc(expression_treated))

#########

# 7. التعامل مع القيم المفقودة (NA Values): حذف الصفوف التي تحتوي على قيم مفقودة
clean_data <- airway %>%
  na.omit()

# 8. استخدام rename(): تغيير اسم عمود "expression_treated" إلى "treated_expression"
renamed_data <- airway %>%
  rename(treated_expression = expression_treated)

# 9. استخدام column_to_rownames() من tibble: تعيين عمود الجين كأسماء للصفوف
gene_data <- airway %>%
  column_to_rownames(var = "gene")

# 10. حذف عمود 
# حذف عمود "sample" من البيانات
data_without_sample <- airway %>%
  select(-sample)

# حذف الصفوف التي يكون التعبير الجيني المعالج لها أقل من 500 (إذا كانت القيمة ليست NA)
filtered_data <- airway %>%
  filter(expression_treated >= 500 | is.na(expression_treated))

# حفظ الملف النهائي   
write.csv(result, "clean_airway_data.csv", row.names = FALSE)

#قراءة الملف مرة أخرى للتأكد
clean_airway_data <- read.csv("clean_airway_data.csv")


