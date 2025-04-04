class QIpInfoFeedBackState {
  bool? succes;
  QIpInfoFeedBackState({this.succes});

  QIpInfoFeedBackState copyWith({
    bool? succes
  }) {
    return QIpInfoFeedBackState(
      succes: succes ?? this.succes
    );
  }
}