import PyPDF2

pdfFileObj = open('my_file.pdf','rb')     #'rb' for read binary mode
pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
pdfReader.numPages
pageObj = pdfReader.getPage(1)  
pageObj = pdfReader.getPage(2)        
pageObj.extractText()
