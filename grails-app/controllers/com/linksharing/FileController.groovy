package com.linksharing

class FileController {

    def file()
    {

    }
    def upload()
    {
        def f=params.file
        response.setContentType('image/png')
        byte[] b= f.inputStream.bytes
        render b
    }
}
