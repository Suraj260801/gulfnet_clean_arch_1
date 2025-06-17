abstract class NetworkInfo{
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo{
  @override
  Future<bool> isConnected() async {
    // Simulate network connection status
    await Future.delayed(const Duration(milliseconds: 500));
    return true; // Always connected for this example
  }

}