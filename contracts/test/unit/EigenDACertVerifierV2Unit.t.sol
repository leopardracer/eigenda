// SPDX-License-Identifier: MIT
pragma solidity =0.8.12;

import "../MockEigenDADeployer.sol";
import {EigenDACertVerificationV2Lib as CertV2Lib} from "src/libraries/EigenDACertVerificationV2Lib.sol";

contract EigenDACertVerifierV2Unit is MockEigenDADeployer {
    using stdStorage for StdStorage;
    using BN254 for BN254.G1Point;

    address relay0 = address(uint160(uint256(keccak256(abi.encodePacked("relay0")))));
    address relay1 = address(uint160(uint256(keccak256(abi.encodePacked("relay1")))));

    function setUp() public virtual {
        quorumNumbersRequired = hex"00";
        _deployDA();
    }

    function test_verifyDACertV2(uint256 pseudoRandomNumber) public {
        (
            SignedBatch memory signedBatch,
            BlobInclusionInfo memory blobInclusionInfo,
            BLSSignatureChecker.NonSignerStakesAndSignature memory nssas
        ) = _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 0);

        NonSignerStakesAndSignature memory nonSignerStakesAndSignature;
        nonSignerStakesAndSignature.nonSignerQuorumBitmapIndices = nssas.nonSignerQuorumBitmapIndices;
        nonSignerStakesAndSignature.nonSignerPubkeys = nssas.nonSignerPubkeys;
        nonSignerStakesAndSignature.quorumApks = nssas.quorumApks;
        nonSignerStakesAndSignature.apkG2 = nssas.apkG2;
        nonSignerStakesAndSignature.sigma = nssas.sigma;
        nonSignerStakesAndSignature.quorumApkIndices = nssas.quorumApkIndices;
        nonSignerStakesAndSignature.totalStakeIndices = nssas.totalStakeIndices;
        nonSignerStakesAndSignature.nonSignerStakeIndices = nssas.nonSignerStakeIndices;

        _registerRelayKeys();

        eigenDACertVerifier.verifyDACertV2FromSignedBatch(signedBatch, blobInclusionInfo);

        (NonSignerStakesAndSignature memory _nonSignerStakesAndSignature, bytes memory signedQuorumNumbers) =
            CertV2Lib.getNonSignerStakesAndSignature(operatorStateRetriever, registryCoordinator, signedBatch);
        eigenDACertVerifier.verifyDACertV2(
            signedBatch.batchHeader, blobInclusionInfo, _nonSignerStakesAndSignature, signedQuorumNumbers
        );
    }

    function test_verifyDACertV2ZK_True(uint256 pseudoRandomNumber) public {
        (
            SignedBatch memory signedBatch,
            BlobInclusionInfo memory blobInclusionInfo,
            BLSSignatureChecker.NonSignerStakesAndSignature memory nssas
        ) = _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 0);

        NonSignerStakesAndSignature memory nonSignerStakesAndSignature;
        nonSignerStakesAndSignature.nonSignerQuorumBitmapIndices = nssas.nonSignerQuorumBitmapIndices;
        nonSignerStakesAndSignature.nonSignerPubkeys = nssas.nonSignerPubkeys;
        nonSignerStakesAndSignature.quorumApks = nssas.quorumApks;
        nonSignerStakesAndSignature.apkG2 = nssas.apkG2;
        nonSignerStakesAndSignature.sigma = nssas.sigma;
        nonSignerStakesAndSignature.quorumApkIndices = nssas.quorumApkIndices;
        nonSignerStakesAndSignature.totalStakeIndices = nssas.totalStakeIndices;
        nonSignerStakesAndSignature.nonSignerStakeIndices = nssas.nonSignerStakeIndices;

        _registerRelayKeys();

        (NonSignerStakesAndSignature memory _nonSignerStakesAndSignature, bytes memory signedQuorumNumbers) =
            CertV2Lib.getNonSignerStakesAndSignature(operatorStateRetriever, registryCoordinator, signedBatch);
        bool zk = eigenDACertVerifier.verifyDACertV2ForZKProof(
            signedBatch.batchHeader, blobInclusionInfo, _nonSignerStakesAndSignature, signedQuorumNumbers
        );
        assert(zk);
    }

    function test_verifyDACertV2ZK_False(uint256 pseudoRandomNumber) public {
        (
            SignedBatch memory signedBatch,
            BlobInclusionInfo memory blobInclusionInfo,
            BLSSignatureChecker.NonSignerStakesAndSignature memory nssas
        ) = _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 0);

        NonSignerStakesAndSignature memory nonSignerStakesAndSignature;
        nonSignerStakesAndSignature.nonSignerQuorumBitmapIndices = nssas.nonSignerQuorumBitmapIndices;
        nonSignerStakesAndSignature.nonSignerPubkeys = nssas.nonSignerPubkeys;
        nonSignerStakesAndSignature.quorumApks = nssas.quorumApks;
        nonSignerStakesAndSignature.apkG2 = nssas.apkG2;
        nonSignerStakesAndSignature.sigma = nssas.sigma;
        nonSignerStakesAndSignature.quorumApkIndices = nssas.quorumApkIndices;
        nonSignerStakesAndSignature.totalStakeIndices = nssas.totalStakeIndices;
        nonSignerStakesAndSignature.nonSignerStakeIndices = nssas.nonSignerStakeIndices;

        (NonSignerStakesAndSignature memory _nonSignerStakesAndSignature, bytes memory signedQuorumNumbers) =
            CertV2Lib.getNonSignerStakesAndSignature(operatorStateRetriever, registryCoordinator, signedBatch);
        bool zk = eigenDACertVerifier.verifyDACertV2ForZKProof(
            signedBatch.batchHeader, blobInclusionInfo, _nonSignerStakesAndSignature, signedQuorumNumbers
        );
        assert(!zk);
    }

    function test_verifyDACertV2_revert_RelayKeysNotSet(uint256 pseudoRandomNumber) public {
        (SignedBatch memory signedBatch, BlobInclusionInfo memory blobInclusionInfo,) =
            _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 0);

        vm.expectPartialRevert(CertV2Lib.RelayKeyNotSet.selector);
        eigenDACertVerifier.verifyDACertV2FromSignedBatch(signedBatch, blobInclusionInfo);
    }

    function test_verifyDACertV2_revert_InclusionProofInvalid(uint256 pseudoRandomNumber) public {
        (SignedBatch memory signedBatch, BlobInclusionInfo memory blobInclusionInfo,) =
            _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 0);

        blobInclusionInfo.inclusionProof =
            abi.encodePacked(keccak256(abi.encode(pseudoRandomNumber, "inclusion proof")));

        vm.expectPartialRevert(CertV2Lib.InvalidInclusionProof.selector);
        eigenDACertVerifier.verifyDACertV2FromSignedBatch(signedBatch, blobInclusionInfo);
    }

    function test_verifyDACertV2_revert_BadVersion(uint256 pseudoRandomNumber) public {
        (SignedBatch memory signedBatch, BlobInclusionInfo memory blobInclusionInfo,) =
            _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 1);

        _registerRelayKeys();

        vm.expectRevert();
        eigenDACertVerifier.verifyDACertV2FromSignedBatch(signedBatch, blobInclusionInfo);
    }

    function test_verifyDACertV2_revert_BadSecurityParams(uint256 pseudoRandomNumber) public {
        (SignedBatch memory signedBatch, BlobInclusionInfo memory blobInclusionInfo,) =
            _getSignedBatchAndBlobVerificationProof(pseudoRandomNumber, 0);

        vm.store(address(eigenDACertVerifier), bytes32(uint256(0)), bytes32(uint256(14113)));

        _registerRelayKeys();

        vm.expectPartialRevert(CertV2Lib.InvalidThresholdPercentages.selector);
        eigenDACertVerifier.verifyDACertV2FromSignedBatch(signedBatch, blobInclusionInfo);
    }

    function test_verifyDACertSecurityParams() public view {
        VersionedBlobParams memory blobParams = eigenDAThresholdRegistry.getBlobParams(0);
        (uint8 confirmationThreshold, uint8 adversaryThreshold) = eigenDACertVerifier.securityThresholdsV2();
        SecurityThresholds memory securityThresholds =
            SecurityThresholds({confirmationThreshold: confirmationThreshold, adversaryThreshold: adversaryThreshold});
        eigenDACertVerifier.verifyDACertSecurityParams(blobParams, securityThresholds);
        eigenDACertVerifier.verifyDACertSecurityParams(0, securityThresholds);
    }

    function _getSignedBatchAndBlobVerificationProof(uint256 pseudoRandomNumber, uint8 version)
        internal
        returns (SignedBatch memory, BlobInclusionInfo memory, BLSSignatureChecker.NonSignerStakesAndSignature memory)
    {
        BlobHeaderV2 memory blobHeader1 = _getRandomBlobHeaderV2(pseudoRandomNumber, version);
        BlobHeaderV2 memory blobHeader2 = _getRandomBlobHeaderV2(pseudoRandomNumber, version);

        uint32[] memory relayKeys = new uint32[](2);
        relayKeys[0] = 0;
        relayKeys[1] = 1;

        BlobCertificate memory blobCertificate1 =
            BlobCertificate({blobHeader: blobHeader1, signature: hex"00", relayKeys: relayKeys});

        BlobCertificate memory blobCertificate2 =
            BlobCertificate({blobHeader: blobHeader2, signature: hex"0001", relayKeys: relayKeys});

        bytes32 batchRoot = keccak256(
            abi.encode(
                keccak256(abi.encode(EigenDAHasher.hashBlobCertificate(blobCertificate1))),
                keccak256(abi.encode(EigenDAHasher.hashBlobCertificate(blobCertificate2)))
            )
        );

        BlobInclusionInfo memory blobInclusionInfo = BlobInclusionInfo({
            blobCertificate: blobCertificate1,
            blobIndex: 0,
            inclusionProof: abi.encodePacked(keccak256(abi.encode(EigenDAHasher.hashBlobCertificate(blobCertificate2))))
        });

        (
            uint32 referenceBlockNumber,
            BLSSignatureChecker.NonSignerStakesAndSignature memory nonSignerStakesAndSignature
        ) = _registerSignatoriesAndGetNonSignerStakeAndSignatureRandom(pseudoRandomNumber, 0, 1);

        BatchHeaderV2 memory batchHeader =
            BatchHeaderV2({batchRoot: batchRoot, referenceBlockNumber: referenceBlockNumber});

        nonSignerStakesAndSignature.sigma =
            BN254.hashToG1(keccak256(abi.encode(batchHeader))).scalar_mul(aggSignerPrivKey);

        uint32[] memory quorumNumbers = new uint32[](1);
        quorumNumbers[0] = 0;

        Attestation memory attestation = Attestation({
            nonSignerPubkeys: nonSignerStakesAndSignature.nonSignerPubkeys,
            quorumApks: nonSignerStakesAndSignature.quorumApks,
            sigma: nonSignerStakesAndSignature.sigma,
            apkG2: nonSignerStakesAndSignature.apkG2,
            quorumNumbers: quorumNumbers
        });

        SignedBatch memory signedBatch = SignedBatch({batchHeader: batchHeader, attestation: attestation});

        return (signedBatch, blobInclusionInfo, nonSignerStakesAndSignature);
    }

    function _getRandomBlobHeaderV2(uint256 psuedoRandomNumber, uint8 version)
        internal
        pure
        returns (BlobHeaderV2 memory)
    {
        uint256[2] memory lengthCommitmentX = [
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthCommitment.X"))),
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthCommitment.X")))
        ];
        uint256[2] memory lengthCommitmentY = [
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthCommitment.Y"))),
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthCommitment.Y")))
        ];
        uint256[2] memory lengthProofX = [
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthProof.X"))),
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthProof.X")))
        ];
        uint256[2] memory lengthProofY = [
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthProof.Y"))),
            uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.lengthProof.Y")))
        ];

        BlobHeaderV2 memory blobHeader = BlobHeaderV2({
            version: version,
            quorumNumbers: hex"00",
            commitment: BlobCommitment({
                commitment: BN254.G1Point(
                    uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.X"))),
                    uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.commitment.Y")))
                ),
                lengthCommitment: BN254.G2Point(lengthCommitmentX, lengthCommitmentY),
                lengthProof: BN254.G2Point(lengthProofX, lengthProofY),
                length: uint32(uint256(keccak256(abi.encode(psuedoRandomNumber, "blobHeader.length"))))
            }),
            paymentHeaderHash: keccak256(abi.encode(psuedoRandomNumber, "blobHeader.paymentHeaderHash"))
        });

        return blobHeader;
    }

    function _registerRelayKeys() internal {
        vm.startPrank(registryCoordinatorOwner);
        eigenDARelayRegistry.addRelayInfo(RelayInfo({relayAddress: relay0, relayURL: "https://relay0.com"}));
        eigenDARelayRegistry.addRelayInfo(RelayInfo({relayAddress: relay1, relayURL: "https://relay1.com"}));
        vm.stopPrank();
    }
}
