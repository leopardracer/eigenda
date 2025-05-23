// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {IEigenDACertVerifier} from "../interfaces/IEigenDACertVerifier.sol";
import {IEigenDAThresholdRegistry} from "../interfaces/IEigenDAThresholdRegistry.sol";
import {IEigenDABatchMetadataStorage} from "../interfaces/IEigenDABatchMetadataStorage.sol";
import {IEigenDASignatureVerifier} from "../interfaces/IEigenDASignatureVerifier.sol";
import {EigenDACertVerificationV1Lib as CertV1Lib} from "src/libraries/EigenDACertVerificationV1Lib.sol";
import {EigenDACertVerificationV2Lib as CertV2Lib} from "src/libraries/EigenDACertVerificationV2Lib.sol";
import {OperatorStateRetriever} from "../../lib/eigenlayer-middleware/src/OperatorStateRetriever.sol";
import {IRegistryCoordinator} from "../../lib/eigenlayer-middleware/src/RegistryCoordinator.sol";
import {IEigenDARelayRegistry} from "../interfaces/IEigenDARelayRegistry.sol";
import "../interfaces/IEigenDAStructs.sol";

/**
 * @title A CertVerifier is an immutable contract that is used by a consumer to verify EigenDA blob certificates
 * @notice For V2 verification this contract is deployed with immutable security thresholds and required quorum numbers,
 *         to change these values or verification behavior a new CertVerifier must be deployed
 */
contract EigenDACertVerifier is IEigenDACertVerifier {
    /// @notice The EigenDAThresholdRegistry contract address
    IEigenDAThresholdRegistry public immutable eigenDAThresholdRegistry;

    /// @notice The EigenDABatchMetadataStorage contract address
    /// @dev On L1 this contract is the EigenDA Service Manager contract
    IEigenDABatchMetadataStorage public immutable eigenDABatchMetadataStorage;

    /// @notice The EigenDASignatureVerifier contract address
    /// @dev On L1 this contract is the EigenDA Service Manager contract
    IEigenDASignatureVerifier public immutable eigenDASignatureVerifier;

    /// @notice The EigenDARelayRegistry contract address
    IEigenDARelayRegistry public immutable eigenDARelayRegistry;

    /// @notice The EigenDA middleware OperatorStateRetriever contract address
    OperatorStateRetriever public immutable operatorStateRetriever;

    /// @notice The EigenDA middleware RegistryCoordinator contract address
    IRegistryCoordinator public immutable registryCoordinator;

    SecurityThresholds public securityThresholdsV2;
    bytes public quorumNumbersRequiredV2;

    constructor(
        IEigenDAThresholdRegistry _eigenDAThresholdRegistry,
        IEigenDABatchMetadataStorage _eigenDABatchMetadataStorage,
        IEigenDASignatureVerifier _eigenDASignatureVerifier,
        IEigenDARelayRegistry _eigenDARelayRegistry,
        OperatorStateRetriever _operatorStateRetriever,
        IRegistryCoordinator _registryCoordinator,
        SecurityThresholds memory _securityThresholdsV2,
        bytes memory _quorumNumbersRequiredV2
    ) {
        eigenDAThresholdRegistry = _eigenDAThresholdRegistry;
        eigenDABatchMetadataStorage = _eigenDABatchMetadataStorage;
        eigenDASignatureVerifier = _eigenDASignatureVerifier;
        eigenDARelayRegistry = _eigenDARelayRegistry;
        operatorStateRetriever = _operatorStateRetriever;
        registryCoordinator = _registryCoordinator;

        // confirmation and adversary signing thresholds that must be met for all quorums in a V2 certificate
        securityThresholdsV2 = _securityThresholdsV2;

        // quorum numbers that must be validated in a V2 certificate
        quorumNumbersRequiredV2 = _quorumNumbersRequiredV2;
    }

    ///////////////////////// V1 ///////////////////////////////

    /**
     * @notice Verifies a the blob cert is valid for the required quorums
     * @param blobHeader The blob header to verify
     * @param blobVerificationProof The blob cert verification proof to verify
     */
    function verifyDACertV1(BlobHeader calldata blobHeader, BlobVerificationProof calldata blobVerificationProof)
        external
        view
    {
        CertV1Lib._verifyDACertV1ForQuorums(
            eigenDAThresholdRegistry,
            eigenDABatchMetadataStorage,
            blobHeader,
            blobVerificationProof,
            quorumNumbersRequired()
        );
    }

    /**
     * @notice Verifies a batch of blob certs for the required quorums
     * @param blobHeaders The blob headers to verify
     * @param blobVerificationProofs The blob cert verification proofs to verify against
     */
    function verifyDACertsV1(BlobHeader[] calldata blobHeaders, BlobVerificationProof[] calldata blobVerificationProofs)
        external
        view
    {
        CertV1Lib._verifyDACertsV1ForQuorums(
            eigenDAThresholdRegistry,
            eigenDABatchMetadataStorage,
            blobHeaders,
            blobVerificationProofs,
            quorumNumbersRequired()
        );
    }

    ///////////////////////// V2 ///////////////////////////////

    /**
     * @notice Verifies a blob cert using the immutable required quorums and security thresholds set in the constructor
     * @param batchHeader The batch header of the blob
     * @param blobInclusionInfo The inclusion proof for the blob cert
     * @param nonSignerStakesAndSignature The nonSignerStakesAndSignature to verify the blob cert against
     * @param signedQuorumNumbers The signed quorum numbers corresponding to the nonSignerStakesAndSignature
     */
    function verifyDACertV2(
        BatchHeaderV2 calldata batchHeader,
        BlobInclusionInfo calldata blobInclusionInfo,
        NonSignerStakesAndSignature calldata nonSignerStakesAndSignature,
        bytes memory signedQuorumNumbers
    ) external view {
        CertV2Lib.verifyDACertV2(
            eigenDAThresholdRegistry,
            eigenDASignatureVerifier,
            eigenDARelayRegistry,
            batchHeader,
            blobInclusionInfo,
            nonSignerStakesAndSignature,
            securityThresholdsV2,
            quorumNumbersRequiredV2,
            signedQuorumNumbers
        );
    }

    /**
     * @notice Verifies a blob cert using the immutable required quorums and security thresholds set in the constructor
     * @param signedBatch The signed batch to verify the blob cert against
     * @param blobInclusionInfo The inclusion proof for the blob cert
     */
    function verifyDACertV2FromSignedBatch(
        SignedBatch calldata signedBatch,
        BlobInclusionInfo calldata blobInclusionInfo
    ) external view {
        CertV2Lib.verifyDACertV2FromSignedBatch(
            eigenDAThresholdRegistry,
            eigenDASignatureVerifier,
            eigenDARelayRegistry,
            operatorStateRetriever,
            registryCoordinator,
            signedBatch,
            blobInclusionInfo,
            securityThresholdsV2,
            quorumNumbersRequiredV2
        );
    }

    /**
     * @notice Thin try/catch wrapper around verifyDACertV2 that returns false instead of panicing
     * @dev The Steel library (https://github.com/risc0/risc0-ethereum/tree/main/crates/steel)
     *      currently has a limitation that it can only create zk proofs for functions that return a value
     * @param batchHeader The batch header of the blob
     * @param blobInclusionInfo The inclusion proof for the blob cert
     * @param nonSignerStakesAndSignature The nonSignerStakesAndSignature to verify the blob cert against
     * @param signedQuorumNumbers The signed quorum numbers corresponding to the nonSignerStakesAndSignature
     */
    function verifyDACertV2ForZKProof(
        BatchHeaderV2 calldata batchHeader,
        BlobInclusionInfo calldata blobInclusionInfo,
        NonSignerStakesAndSignature calldata nonSignerStakesAndSignature,
        bytes memory signedQuorumNumbers
    ) external view returns (bool) {
        (CertV2Lib.StatusCode status,) = CertV2Lib.checkDACertV2(
            eigenDAThresholdRegistry,
            eigenDASignatureVerifier,
            eigenDARelayRegistry,
            batchHeader,
            blobInclusionInfo,
            nonSignerStakesAndSignature,
            securityThresholdsV2,
            quorumNumbersRequiredV2,
            signedQuorumNumbers
        );
        if (status == CertV2Lib.StatusCode.SUCCESS) {
            return true;
        } else {
            return false;
        }
    }

    ///////////////////////// HELPER FUNCTIONS ///////////////////////////////

    /**
     * @notice Returns the nonSignerStakesAndSignature for a given blob cert and signed batch
     * @param signedBatch The signed batch to get the nonSignerStakesAndSignature for
     * @return nonSignerStakesAndSignature The nonSignerStakesAndSignature for the given signed batch attestation
     */
    function getNonSignerStakesAndSignature(SignedBatch calldata signedBatch)
        external
        view
        returns (NonSignerStakesAndSignature memory)
    {
        (NonSignerStakesAndSignature memory nonSignerStakesAndSignature,) =
            CertV2Lib.getNonSignerStakesAndSignature(operatorStateRetriever, registryCoordinator, signedBatch);
        return nonSignerStakesAndSignature;
    }

    /**
     * @notice Verifies the security parameters for a blob cert
     * @param blobParams The blob params to verify
     * @param securityThresholds The security thresholds to verify against
     */
    function verifyDACertSecurityParams(
        VersionedBlobParams memory blobParams,
        SecurityThresholds memory securityThresholds
    ) external pure {
        (CertV2Lib.StatusCode status, bytes memory statusParams) =
            CertV2Lib.checkSecurityParams(blobParams, securityThresholds);
        CertV2Lib.revertOnError(status, statusParams);
    }

    /**
     * @notice Verifies the security parameters for a blob cert
     * @param version The version of the blob to verify
     * @param securityThresholds The security thresholds to verify against
     */
    function verifyDACertSecurityParams(uint16 version, SecurityThresholds memory securityThresholds) external view {
        (CertV2Lib.StatusCode status, bytes memory statusParams) =
            CertV2Lib.checkSecurityParams(getBlobParams(version), securityThresholds);
        CertV2Lib.revertOnError(status, statusParams);
    }

    /// @notice Returns an array of bytes where each byte represents the adversary threshold percentage of the quorum at that index
    function quorumAdversaryThresholdPercentages() external view returns (bytes memory) {
        return eigenDAThresholdRegistry.quorumAdversaryThresholdPercentages();
    }

    /// @notice Returns an array of bytes where each byte represents the confirmation threshold percentage of the quorum at that index
    function quorumConfirmationThresholdPercentages() external view returns (bytes memory) {
        return eigenDAThresholdRegistry.quorumConfirmationThresholdPercentages();
    }

    /// @notice Returns an array of bytes where each byte represents the number of a required quorum
    function quorumNumbersRequired() public view returns (bytes memory) {
        return eigenDAThresholdRegistry.quorumNumbersRequired();
    }

    function getQuorumAdversaryThresholdPercentage(uint8 quorumNumber) external view returns (uint8) {
        return eigenDAThresholdRegistry.getQuorumAdversaryThresholdPercentage(quorumNumber);
    }

    /// @notice Gets the confirmation threshold percentage for a quorum
    function getQuorumConfirmationThresholdPercentage(uint8 quorumNumber) external view returns (uint8) {
        return eigenDAThresholdRegistry.getQuorumConfirmationThresholdPercentage(quorumNumber);
    }

    /// @notice Checks if a quorum is required
    function getIsQuorumRequired(uint8 quorumNumber) external view returns (bool) {
        return eigenDAThresholdRegistry.getIsQuorumRequired(quorumNumber);
    }

    /// @notice Returns the blob params for a given blob version
    function getBlobParams(uint16 version) public view returns (VersionedBlobParams memory) {
        return eigenDAThresholdRegistry.getBlobParams(version);
    }
}
