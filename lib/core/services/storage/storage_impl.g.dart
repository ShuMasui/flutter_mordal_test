// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storage)
final storageProvider = StorageProvider._();

final class StorageProvider
    extends $FunctionalProvider<StorageImpl, StorageImpl, StorageImpl>
    with $Provider<StorageImpl> {
  StorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageHash();

  @$internal
  @override
  $ProviderElement<StorageImpl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageImpl create(Ref ref) {
    return storage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageImpl>(value),
    );
  }
}

String _$storageHash() => r'bccf7c79a2a181ddfd72ec3787f8ca28d9ccdb7b';
