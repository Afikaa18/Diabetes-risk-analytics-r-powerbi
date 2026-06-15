install.packages("mlbenc")
library(mlbench)
data("PimaIndiansDiabetes2")
View(PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)
summary(PimaIndiansDiabetes2)
install.packages("dplyr")
library(dplyr)
install.packages("dplyr")
library(dplyr)
df_clean <- df %>%
  mutate(
    glucose = ifelse(glucose == 0, NA, glucose),
    pressure = ifelse(pressure == 0, NA, pressure),
    triceps = ifelse(triceps == 0, NA, triceps),
    insulin = ifelse(insulin == 0, NA, insulin),
    mass = ifelse(mass == 0, NA, mass)
  ) %>%
  mutate(
    glucose = ifelse(is.na(glucose), median(glucose, na.rm = TRUE), glucose),
    pressure = ifelse(is.na(pressure), median(pressure, na.rm = TRUE), pressure),
    triceps = ifelse(is.na(triceps), median(triceps, na.rm = TRUE), triceps),
    insulin = ifelse(is.na(insulin), median(insulin, na.rm = TRUE), insulin),
    mass = ifelse(is.na(mass), median(mass, na.rm = TRUE), mass)
  )
head(df_clean)
install.packages("caret")
library(caret)
set.seed(123)
index <- createDataPartition(df_clean$diabetes, p = 0.8, list = FALSE)
train_data <- df_clean[index, ]
test_data  <- df_clean[-index, ]
model_logistik <- glm(diabetes ~ glucose + mass + age + pregnant, 
                        data = train_data, 
                        family = "binomial")
summary(model_logistik)
prediksi_prob <- predict(model_logistik, newdata = test_data, type = "response")
prediksi_kelas <- ifelse(prediksi_prob > 0.5, "pos", "neg")
evaluasi <- confusionMatrix(as.factor(prediksi_kelas), test_data$diabetes)
evaluasi