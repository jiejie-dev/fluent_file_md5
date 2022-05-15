package dev.jiejie.fluent_file_md5

import android.util.Base64
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest

private const val BUFFER_SIZE = 16 * 1024
private const val SLICE_SIZE = 256 * 1024

fun getFileMd5(filePath: String?): String {
    if (filePath.isNullOrEmpty()) throw  RuntimeException("filePath is null or empty")

    val file = File(filePath)
    if (!file.exists()) throw RuntimeException("file does not exist")

    var exception: Exception
    val inputStream = FileInputStream(file)
    try {
        val buffer = ByteArray(BUFFER_SIZE)
        var len: Int
        val md = MessageDigest.getInstance("MD5")
        while (inputStream.read(buffer).also { len = it } != -1) {
            md.update(buffer, 0, len)
        }
        val digest = md.digest()
        val checksum = digest.toHex()
        return checksum.trim { it <= ' ' }
    } catch (e: Exception) {
        exception = e
    } finally {
        try {
            inputStream.close()
        } catch (e: Exception) {
            exception = e
        }
    }
    throw exception
}

fun getFileSliceMd5(filePath: String?): String {
    if (filePath.isNullOrEmpty()) throw  RuntimeException("filePath is null or empty")

    val file = File(filePath)
    if (!file.exists()) throw RuntimeException("file does not exist")

    var exception: Exception
    val inputStream = FileInputStream(file)
    try {
        val buffer = ByteArray(SLICE_SIZE)
        val md = MessageDigest.getInstance("MD5")
        inputStream.read(buffer)
        md.update(buffer, 0, SLICE_SIZE)
        val digest = md.digest()
        val checksum = digest.toHex()
        return checksum.trim { it <= ' ' }
    } catch (e: Exception) {
        exception = e
    } finally {
        try {
            inputStream.close()
        } catch (e: Exception) {
            exception = e
        }
    }
    throw exception
}

fun ByteArray.toHex() = joinToString(separator = "") { byte -> "%02x".format(byte) }
