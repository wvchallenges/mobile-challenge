package android.sample.wavechallenge.api

open class DataSourceException(message: String? = null) : Exception(message)

class RemoteDataNotFoundException : DataSourceException("Data not found from the remote source")