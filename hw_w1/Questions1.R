data = read.table(file.choose(),header = TRUE,sep = '\t',dec = '.' )
data_mat = data.matrix(data)

library(kernlab)

svm_model = ksvm(data_mat[,1:10],data[,11],type = "C-svc",kernel = 'vanilladot',C=100,scaled=TRUE)

a = colSums(svm_model@xmatrix[[1]]*svm_model@coef[[1]])
a0 = svm_model@b

pred = predict(svm_model,data_mat[,1:10])
sum(pred==data_mat[,11])/nrow(data_mat)

library(kknn)
