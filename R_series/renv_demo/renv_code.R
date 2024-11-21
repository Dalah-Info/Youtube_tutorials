# 1. تثبيت مكتبة renv
install.packages("renv")
library(renv)

# 2. تهيئة مشروع جديد
renv::init()

# 3. تثبيت حزمة tidyverse داخل المشروع
install.packages("tidyverse")
library(tidyverse)

# 4. حفظ المشروع باستخدام snapshot
renv::snapshot()

# 5. استعادة البيئة
renv::restore()
