part of 'matrix_cubit.dart';

enum MatrixStatus { empty, processing, invalid, valid }

class MatrixState extends Equatable {
  const MatrixState._({
    this.status = MatrixStatus.empty,
  });
  final MatrixStatus status;

  const MatrixState.empty() : this._(status: MatrixStatus.empty);
  const MatrixState.processing() : this._(status: MatrixStatus.processing);
  const MatrixState.invalid() : this._(status: MatrixStatus.invalid);
  const MatrixState.valid() : this._(status: MatrixStatus.valid);

  @override
  List<Object> get props => [status];
}
