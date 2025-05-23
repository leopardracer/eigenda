# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [churner/churner.proto](#churner_churner-proto)
    - [ChurnReply](#churner-ChurnReply)
    - [ChurnRequest](#churner-ChurnRequest)
    - [OperatorToChurn](#churner-OperatorToChurn)
    - [SignatureWithSaltAndExpiry](#churner-SignatureWithSaltAndExpiry)
  
    - [Churner](#churner-Churner)
  
- [common/common.proto](#common_common-proto)
    - [BlobCommitment](#common-BlobCommitment)
    - [G1Commitment](#common-G1Commitment)
  
- [common/v2/common_v2.proto](#common_v2_common_v2-proto)
    - [Batch](#common-v2-Batch)
    - [BatchHeader](#common-v2-BatchHeader)
    - [BlobCertificate](#common-v2-BlobCertificate)
    - [BlobHeader](#common-v2-BlobHeader)
    - [PaymentHeader](#common-v2-PaymentHeader)
  
- [disperser/disperser.proto](#disperser_disperser-proto)
    - [AuthenticatedReply](#disperser-AuthenticatedReply)
    - [AuthenticatedRequest](#disperser-AuthenticatedRequest)
    - [AuthenticationData](#disperser-AuthenticationData)
    - [BatchHeader](#disperser-BatchHeader)
    - [BatchMetadata](#disperser-BatchMetadata)
    - [BlobAuthHeader](#disperser-BlobAuthHeader)
    - [BlobHeader](#disperser-BlobHeader)
    - [BlobInfo](#disperser-BlobInfo)
    - [BlobQuorumParam](#disperser-BlobQuorumParam)
    - [BlobStatusReply](#disperser-BlobStatusReply)
    - [BlobStatusRequest](#disperser-BlobStatusRequest)
    - [BlobVerificationProof](#disperser-BlobVerificationProof)
    - [DisperseBlobReply](#disperser-DisperseBlobReply)
    - [DisperseBlobRequest](#disperser-DisperseBlobRequest)
    - [RetrieveBlobReply](#disperser-RetrieveBlobReply)
    - [RetrieveBlobRequest](#disperser-RetrieveBlobRequest)
  
    - [BlobStatus](#disperser-BlobStatus)
  
    - [Disperser](#disperser-Disperser)
  
- [disperser/v2/disperser_v2.proto](#disperser_v2_disperser_v2-proto)
    - [Attestation](#disperser-v2-Attestation)
    - [BlobCommitmentReply](#disperser-v2-BlobCommitmentReply)
    - [BlobCommitmentRequest](#disperser-v2-BlobCommitmentRequest)
    - [BlobInclusionInfo](#disperser-v2-BlobInclusionInfo)
    - [BlobStatusReply](#disperser-v2-BlobStatusReply)
    - [BlobStatusRequest](#disperser-v2-BlobStatusRequest)
    - [DisperseBlobReply](#disperser-v2-DisperseBlobReply)
    - [DisperseBlobRequest](#disperser-v2-DisperseBlobRequest)
    - [GetPaymentStateReply](#disperser-v2-GetPaymentStateReply)
    - [GetPaymentStateRequest](#disperser-v2-GetPaymentStateRequest)
    - [PaymentGlobalParams](#disperser-v2-PaymentGlobalParams)
    - [PeriodRecord](#disperser-v2-PeriodRecord)
    - [Reservation](#disperser-v2-Reservation)
    - [SignedBatch](#disperser-v2-SignedBatch)
  
    - [BlobStatus](#disperser-v2-BlobStatus)
  
    - [Disperser](#disperser-v2-Disperser)
  
- [encoder/encoder.proto](#encoder_encoder-proto)
    - [BlobCommitment](#encoder-BlobCommitment)
    - [EncodeBlobReply](#encoder-EncodeBlobReply)
    - [EncodeBlobRequest](#encoder-EncodeBlobRequest)
    - [EncodingParams](#encoder-EncodingParams)
  
    - [ChunkEncodingFormat](#encoder-ChunkEncodingFormat)
  
    - [Encoder](#encoder-Encoder)
  
- [encoder/v2/encoder_v2.proto](#encoder_v2_encoder_v2-proto)
    - [EncodeBlobReply](#encoder-v2-EncodeBlobReply)
    - [EncodeBlobRequest](#encoder-v2-EncodeBlobRequest)
    - [EncodingParams](#encoder-v2-EncodingParams)
    - [FragmentInfo](#encoder-v2-FragmentInfo)
  
    - [Encoder](#encoder-v2-Encoder)
  
- [node/node.proto](#node_node-proto)
    - [AttestBatchReply](#node-AttestBatchReply)
    - [AttestBatchRequest](#node-AttestBatchRequest)
    - [BatchHeader](#node-BatchHeader)
    - [Blob](#node-Blob)
    - [BlobHeader](#node-BlobHeader)
    - [BlobQuorumInfo](#node-BlobQuorumInfo)
    - [Bundle](#node-Bundle)
    - [G2Commitment](#node-G2Commitment)
    - [GetBlobHeaderReply](#node-GetBlobHeaderReply)
    - [GetBlobHeaderRequest](#node-GetBlobHeaderRequest)
    - [MerkleProof](#node-MerkleProof)
    - [NodeInfoReply](#node-NodeInfoReply)
    - [NodeInfoRequest](#node-NodeInfoRequest)
    - [RetrieveChunksReply](#node-RetrieveChunksReply)
    - [RetrieveChunksRequest](#node-RetrieveChunksRequest)
    - [StoreBlobsReply](#node-StoreBlobsReply)
    - [StoreBlobsRequest](#node-StoreBlobsRequest)
    - [StoreChunksReply](#node-StoreChunksReply)
    - [StoreChunksRequest](#node-StoreChunksRequest)
  
    - [ChunkEncodingFormat](#node-ChunkEncodingFormat)
  
    - [Dispersal](#node-Dispersal)
    - [Retrieval](#node-Retrieval)
  
- [relay/relay.proto](#relay_relay-proto)
    - [ChunkRequest](#relay-ChunkRequest)
    - [ChunkRequestByIndex](#relay-ChunkRequestByIndex)
    - [ChunkRequestByRange](#relay-ChunkRequestByRange)
    - [GetBlobReply](#relay-GetBlobReply)
    - [GetBlobRequest](#relay-GetBlobRequest)
    - [GetChunksReply](#relay-GetChunksReply)
    - [GetChunksRequest](#relay-GetChunksRequest)
  
    - [Relay](#relay-Relay)
  
- [retriever/retriever.proto](#retriever_retriever-proto)
    - [BlobReply](#retriever-BlobReply)
    - [BlobRequest](#retriever-BlobRequest)
  
    - [Retriever](#retriever-Retriever)
  
- [retriever/v2/retriever_v2.proto](#retriever_v2_retriever_v2-proto)
    - [BlobReply](#retriever-v2-BlobReply)
    - [BlobRequest](#retriever-v2-BlobRequest)
  
    - [Retriever](#retriever-v2-Retriever)
  
- [validator/node_v2.proto](#validator_node_v2-proto)
    - [GetChunksReply](#validator-GetChunksReply)
    - [GetChunksRequest](#validator-GetChunksRequest)
    - [GetNodeInfoReply](#validator-GetNodeInfoReply)
    - [GetNodeInfoRequest](#validator-GetNodeInfoRequest)
    - [StoreChunksReply](#validator-StoreChunksReply)
    - [StoreChunksRequest](#validator-StoreChunksRequest)
  
    - [ChunkEncodingFormat](#validator-ChunkEncodingFormat)
  
    - [Dispersal](#validator-Dispersal)
    - [Retrieval](#validator-Retrieval)
  
- [Scalar Value Types](#scalar-value-types)



<a name="churner_churner-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## churner/churner.proto



<a name="churner-ChurnReply"></a>

### ChurnReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature_with_salt_and_expiry | [SignatureWithSaltAndExpiry](#churner-SignatureWithSaltAndExpiry) |  | The signature signed by the Churner. |
| operators_to_churn | [OperatorToChurn](#churner-OperatorToChurn) | repeated | A list of existing operators that get churned out. This list will contain all quorums specified in the ChurnRequest even if some quorums may not have any churned out operators. If a quorum has available space, OperatorToChurn object will contain the quorum ID and empty operator and pubkey. The smart contract should only churn out the operators for quorums that are full.

For example, if the ChurnRequest specifies quorums 0 and 1 where quorum 0 is full and quorum 1 has available space, the ChurnReply will contain two OperatorToChurn objects with the respective quorums. OperatorToChurn for quorum 0 will contain the operator to churn out and OperatorToChurn for quorum 1 will contain empty operator (zero address) and pubkey. The smart contract should only churn out the operators for quorum 0 because quorum 1 has available space without having any operators churned. Note: it&#39;s possible an operator gets churned out just for one or more quorums (rather than entirely churned out for all quorums). |






<a name="churner-ChurnRequest"></a>

### ChurnRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| operator_address | [string](#string) |  | The Ethereum address (in hex like &#34;0x123abcdef...&#34;) of the operator. |
| operator_to_register_pubkey_g1 | [bytes](#bytes) |  | The operator making the churn request. |
| operator_to_register_pubkey_g2 | [bytes](#bytes) |  |  |
| operator_request_signature | [bytes](#bytes) |  | The operator&#39;s BLS signature signed on the keccak256 hash of concat(&#34;ChurnRequest&#34;, operator address, g1, g2, salt). |
| salt | [bytes](#bytes) |  | The salt used as part of the message to sign on for operator_request_signature. |
| quorum_ids | [uint32](#uint32) | repeated | The quorums to register for. Note: - If any of the quorum here has already been registered, this entire request will fail to proceed. - If any of the quorum fails to register, this entire request will fail. - Regardless of whether the specified quorums are full or not, the Churner will return parameters for all quorums specified here. The smart contract will determine whether it needs to churn out existing operators based on whether the quorums have available space. The IDs must be in range [0, 254]. |






<a name="churner-OperatorToChurn"></a>

### OperatorToChurn
This describes an operator to churn out for a quorum.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| quorum_id | [uint32](#uint32) |  | The ID of the quorum of the operator to churn out. |
| operator | [bytes](#bytes) |  | The address of the operator. |
| pubkey | [bytes](#bytes) |  | BLS pubkey (G1 point) of the operator. |






<a name="churner-SignatureWithSaltAndExpiry"></a>

### SignatureWithSaltAndExpiry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  | Churner&#39;s signature on the Operator&#39;s attributes. |
| salt | [bytes](#bytes) |  | Salt is the keccak256 hash of concat(&#34;churn&#34;, time.Now(), operatorToChurn&#39;s OperatorID, Churner&#39;s ECDSA private key) |
| expiry | [int64](#int64) |  | When this churn decision will expire. |





 

 

 


<a name="churner-Churner"></a>

### Churner
The Churner is a service that handles churn requests from new operators trying to
join the EigenDA network.
When the EigenDA network reaches the maximum number of operators, any new operator
trying to join will have to make a churn request to this Churner, which acts as the
sole decision maker to decide whether this new operator could join, and if so, which
existing operator will be churned out (so the max number of operators won&#39;t be
exceeded).
The max number of operators, as well as the rules to make churn decisions, are
defined onchain, see details in OperatorSetParam at:
https://github.com/Layr-Labs/eigenlayer-middleware/blob/master/src/interfaces/IBLSRegistryCoordinatorWithIndices.sol#L24.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| Churn | [ChurnRequest](#churner-ChurnRequest) | [ChurnReply](#churner-ChurnReply) |  |

 



<a name="common_common-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## common/common.proto



<a name="common-BlobCommitment"></a>

### BlobCommitment
BlobCommitment represents commitment of a specific blob, containing its
KZG commitment, degree proof, the actual degree, and data length in number of symbols (field elements).
It deserializes into https://github.com/Layr-Labs/eigenda/blob/ce89dab18d2f8f55004002e17dd3a18529277845/encoding/data.go#L27

See https://github.com/Layr-Labs/eigenda/blob/e86fb8515eb606d0eebb92097dc60d7238363e77/docs/spec/src/protocol/architecture/encoding.md#validation-via-kzg
to understand how this commitment is used to validate the blob.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| commitment | [bytes](#bytes) |  | Concatenation of the x and y coordinates of `common.G1Commitment`. |
| length_commitment | [bytes](#bytes) |  | A commitment to the blob data with G2 SRS, used to work with length_proof such that the claimed length below is verifiable. |
| length_proof | [bytes](#bytes) |  | A proof that the degree of the polynomial used to generate the blob commitment is valid. It consists of the KZG commitment of x^(SRSOrder-n) * P(x), where P(x) is polynomial of degree n representing the blob. |
| length | [uint32](#uint32) |  | The length of the blob in symbols (field elements), which must be a power of 2. This also specifies the degree of the polynomial used to generate the blob commitment, since length = degree &#43; 1. |






<a name="common-G1Commitment"></a>

### G1Commitment
G1Commitment represents the serialized coordinates of a G1 KZG commitment.
We use gnark-crypto so adopt its serialization, which is big-endian. See:
https://github.com/Consensys/gnark-crypto/blob/779e884dabb38b92e677f4891286637a3d2e5734/ecc/bn254/fp/element.go#L862


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| x | [bytes](#bytes) |  | The X coordinate of the KZG commitment. This is the raw byte representation of the field element. x should contain 32 bytes. |
| y | [bytes](#bytes) |  | The Y coordinate of the KZG commitment. This is the raw byte representation of the field element. y should contain 32 bytes. |





 

 

 

 



<a name="common_v2_common_v2-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## common/v2/common_v2.proto



<a name="common-v2-Batch"></a>

### Batch
Batch is a batch of blob certificates


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BatchHeader](#common-v2-BatchHeader) |  | header contains metadata about the batch |
| blob_certificates | [BlobCertificate](#common-v2-BlobCertificate) | repeated | blob_certificates is the list of blob certificates in the batch |






<a name="common-v2-BatchHeader"></a>

### BatchHeader
BatchHeader is the header of a batch of blobs


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_root | [bytes](#bytes) |  | batch_root is the root of the merkle tree of the hashes of blob certificates in the batch |
| reference_block_number | [uint64](#uint64) |  | reference_block_number is the block number that the state of the batch is based on for attestation |






<a name="common-v2-BlobCertificate"></a>

### BlobCertificate
BlobCertificate contains a full description of a blob and how it is dispersed. Part of the certificate
is provided by the blob submitter (i.e. the blob header), and part is provided by the disperser (i.e. the relays).
Validator nodes eventually sign the blob certificate once they are in custody of the required chunks
(note that the signature is indirect; validators sign the hash of a Batch, which contains the blob certificate).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_header | [BlobHeader](#common-v2-BlobHeader) |  | blob_header contains data about the blob. |
| signature | [bytes](#bytes) |  | signature is an ECDSA signature signed by the blob request signer&#39;s account ID over the BlobHeader&#39;s blobKey, which is a keccak hash of the serialized BlobHeader, and used to verify against blob dispersal request&#39;s account ID |
| relay_keys | [uint32](#uint32) | repeated | relay_keys is the list of relay keys that are in custody of the blob. The relays custodying the data are chosen by the Disperser to which the DisperseBlob request was submitted. It needs to contain at least 1 relay number. To retrieve a blob from the relay, one can find that relay&#39;s URL in the EigenDARelayRegistry contract: https://github.com/Layr-Labs/eigenda/blob/master/contracts/src/core/EigenDARelayRegistry.sol |






<a name="common-v2-BlobHeader"></a>

### BlobHeader
BlobHeader contains the information describing a blob and the way it is to be dispersed.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [uint32](#uint32) |  | The blob version. Blob versions are pushed onchain by EigenDA governance in an append only fashion and store the maximum number of operators, number of chunks, and coding rate for a blob. On blob verification, these values are checked against supplied or default security thresholds to validate the security assumptions of the blob&#39;s availability. |
| quorum_numbers | [uint32](#uint32) | repeated | quorum_numbers is the list of quorum numbers that the blob is part of. Each quorum will store the data, hence adding quorum numbers adds redundancy, making the blob more likely to be retrievable. Each quorum requires separate payment.

On-demand dispersal is currently limited to using a subset of the following quorums: - 0: ETH - 1: EIGEN

Reserved-bandwidth dispersal is free to use multiple quorums, however those must be reserved ahead of time. The quorum_numbers specified here must be a subset of the ones allowed by the on-chain reservation. Check the allowed quorum numbers by looking up reservation struct: https://github.com/Layr-Labs/eigenda/blob/1430d56258b4e814b388e497320fd76354bfb478/contracts/src/interfaces/IPaymentVault.sol#L10 |
| commitment | [common.BlobCommitment](#common-BlobCommitment) |  | commitment is the KZG commitment to the blob |
| payment_header | [PaymentHeader](#common-v2-PaymentHeader) |  | payment_header contains payment information for the blob |






<a name="common-v2-PaymentHeader"></a>

### PaymentHeader
PaymentHeader contains payment information for a blob.
At least one of reservation_period or cumulative_payment must be set, and reservation_period
is always considered before cumulative_payment. If reservation_period is set but not valid,
the server will reject the request and not proceed with dispersal. If reservation_period is not set
and cumulative_payment is set but not valid, the server will reject the request and not proceed with dispersal.
Once the server has accepted the payment header, a client cannot cancel or rollback the payment.
Every dispersal request will be charged by a multiple of `minNumSymbols` field defined by the payment vault contract.
If the request blob size is smaller or not a multiple of `minNumSymbols`, the server will charge the user for the next
multiple of `minNumSymbols` (https://github.com/Layr-Labs/eigenda/blob/1430d56258b4e814b388e497320fd76354bfb478/contracts/src/payments/PaymentVaultStorage.sol#L9).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id | [string](#string) |  | The account ID of the disperser client. This account ID is an eth wallet address of the user, corresponding to the key used by the client to sign the BlobHeader. |
| timestamp | [int64](#int64) |  | The timestamp should be set as the UNIX timestamp in units of nanoseconds at the time of the dispersal request, and will be used to determine the reservation period, and compared against the reservation active start and end timestamps On-chain reservation timestamps are in units of seconds, while the payment header timestamp is in nanoseconds for greater precision. If the timestamp is not set or is not part of the previous or current reservation period, the request will be rejected. The reservation period of the dispersal request is used for rate-limiting the user&#39;s account against their dedicated bandwidth. This method requires users to set up reservation accounts with EigenDA team, and the team will set up an on-chain record of reserved bandwidth for the user for some period of time. The dispersal client&#39;s accountant will set this value to the current timestamp in nanoseconds. The disperser server will find the corresponding reservation period by taking the nearest lower multiple of the on-chain configured reservation period interval, mapping each request to a time-based window and is serialized and parsed as a uint32. The disperser server then validates that it matches either the current or the previous period, and check against the user&#39;s reserved bandwidth.

Example Usage Flow: 1. The user sets up a reservation with the EigenDA team, including throughput (symbolsPerSecond), startTimestamp, endTimestamp, and reservationPeriodInterval. 2. When sending a dispersal request at time t, the client fill in the timestamp field with t. 3. The disperser take timestamp t and checks the reservation period and the user&#39;s bandwidth capacity: - If the reservation is active (t &gt;= startTimestamp and t &lt; endTimestamp). - After rounding up to the nearest multiple of `minNumSymbols` defined by the payment vault contract, the user still has enough bandwidth capacity (hasn’t exceeded symbolsPerSecond * reservationPeriodInterval). - The request is ratelimited against the current reservation period, and calculated as reservation_period = floor(t / reservationPeriodInterval) * reservationPeriodInterval. the request&#39;s reservation period must either be the disperser server&#39;s current reservation period or the previous reservation period. 4. Server always go ahead with recording the received request in the current reservation period, and then categorize the scenarios - If the remaining bandwidth is sufficient for the request, the dispersal request proceeds. - If the remaining bandwidth is not enough for the request, server fills up the current bin and overflowing the extra to a future bin. - If the bandwidth has already been exhausted, the request is rejected. 5. Once the dispersal request signature has been verified, the server will not roll back the payment or the usage records. Users should be aware of this when planning their usage. The dispersal client written by EigenDA team takes account of this. 6. When the reservation ends or usage is exhausted, the client must wait for the next reservation period or switch to on-demand. |
| cumulative_payment | [bytes](#bytes) |  | Cumulative payment is the total amount of tokens paid by the requesting account, including the current request. This value is serialized as an uint256 and parsed as a big integer, and must match the user’s on-chain deposit limits as well as the recorded payments for all previous requests. Because it is a cumulative (not incremental) total, requests can arrive out of order and still unambiguously declare how much of the on-chain deposit can be deducted.

Example Decision Flow: 1. In the set up phase, the user must deposit tokens into the EigenDA PaymentVault contract. The payment vault contract specifies the minimum number of symbols charged per dispersal, the pricing per symbol, and the maximum global rate for on-demand dispersals. The user should calculate the amount of tokens they would like to deposit based on their usage. The first time a user make a request, server will immediate read the contract for the on-chain balance. When user runs out of on-chain balance, the server will reject the request and not proceed with dispersal. When a user top up on-chain, the server will only refresh every few minutes for the top-up to take effect. 2. The disperser client accounts how many tokens they’ve already paid (previousCumPmt). 3. They should calculate the payment by rounding up blob size to the nearest multiple of `minNumSymbols` defined by the payment vault contract, and calculate the incremental amount of tokens needed for the current request needs based on protocol defined pricing. 4. They take the sum of previousCumPmt &#43; new incremental payment and place it in the “cumulative_payment” field. 5. The disperser checks this new cumulative total against on-chain deposits and prior records (largest previous payment and smallest later payment if exists). 6. If the payment number is valid, the request is confirmed and disperser proceeds with dispersal; otherwise it’s rejected. |





 

 

 

 



<a name="disperser_disperser-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## disperser/disperser.proto



<a name="disperser-AuthenticatedReply"></a>

### AuthenticatedReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_auth_header | [BlobAuthHeader](#disperser-BlobAuthHeader) |  |  |
| disperse_reply | [DisperseBlobReply](#disperser-DisperseBlobReply) |  |  |






<a name="disperser-AuthenticatedRequest"></a>

### AuthenticatedRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| disperse_request | [DisperseBlobRequest](#disperser-DisperseBlobRequest) |  |  |
| authentication_data | [AuthenticationData](#disperser-AuthenticationData) |  |  |






<a name="disperser-AuthenticationData"></a>

### AuthenticationData
AuthenticationData contains the signature of the BlobAuthHeader.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| authentication_data | [bytes](#bytes) |  |  |






<a name="disperser-BatchHeader"></a>

### BatchHeader



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_root | [bytes](#bytes) |  | The root of the merkle tree with the hashes of blob headers as leaves. |
| quorum_numbers | [bytes](#bytes) |  | All quorums associated with blobs in this batch. Sorted in ascending order. Ex. [0, 2, 1] =&gt; 0x000102 |
| quorum_signed_percentages | [bytes](#bytes) |  | The percentage of stake that has signed for this batch. The quorum_signed_percentages[i] is percentage for the quorum_numbers[i]. |
| reference_block_number | [uint32](#uint32) |  | The Ethereum block number at which the batch was created. The Disperser will encode and disperse the blobs based on the onchain info (e.g. operator stakes) at this block number. |






<a name="disperser-BatchMetadata"></a>

### BatchMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header | [BatchHeader](#disperser-BatchHeader) |  |  |
| signatory_record_hash | [bytes](#bytes) |  | The hash of all public keys of the operators that did not sign the batch. |
| fee | [bytes](#bytes) |  | The fee payment paid by users for dispersing this batch. It&#39;s the bytes representation of a big.Int value. |
| confirmation_block_number | [uint32](#uint32) |  | The Ethereum block number at which the batch is confirmed onchain. |
| batch_header_hash | [bytes](#bytes) |  | This is the hash of the ReducedBatchHeader defined onchain, see: https://github.com/Layr-Labs/eigenda/blob/master/contracts/src/interfaces/IEigenDAServiceManager.sol#L43 The is the message that the operators will sign their signatures on. |






<a name="disperser-BlobAuthHeader"></a>

### BlobAuthHeader
BlobAuthHeader contains information about the blob for the client to verify and sign.
- Once payments are enabled, the BlobAuthHeader will contain the KZG commitment to the blob, which the client
will verify and sign. Having the client verify the KZG commitment instead of calculating it avoids
the need for the client to have the KZG structured reference string (SRS), which can be large.
The signed KZG commitment prevents the disperser from sending a different blob to the DA Nodes
than the one the client sent.
- In the meantime, the BlobAuthHeader contains a simple challenge parameter is used to prevent
replay attacks in the event that a signature is leaked.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| challenge_parameter | [uint32](#uint32) |  |  |






<a name="disperser-BlobHeader"></a>

### BlobHeader



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| commitment | [common.G1Commitment](#common-G1Commitment) |  | KZG commitment of the blob. |
| data_length | [uint32](#uint32) |  | The length of the blob in symbols (each symbol is 32 bytes). |
| blob_quorum_params | [BlobQuorumParam](#disperser-BlobQuorumParam) | repeated | The params of the quorums that this blob participates in. |






<a name="disperser-BlobInfo"></a>

### BlobInfo
BlobInfo contains information needed to confirm the blob against the EigenDA contracts


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_header | [BlobHeader](#disperser-BlobHeader) |  |  |
| blob_verification_proof | [BlobVerificationProof](#disperser-BlobVerificationProof) |  |  |






<a name="disperser-BlobQuorumParam"></a>

### BlobQuorumParam



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| quorum_number | [uint32](#uint32) |  | The ID of the quorum. |
| adversary_threshold_percentage | [uint32](#uint32) |  | The max percentage of stake within the quorum that can be held by or delegated to adversarial operators. Currently, this and the next parameter are standardized across the quorum using values read from the EigenDA contracts. |
| confirmation_threshold_percentage | [uint32](#uint32) |  | The min percentage of stake that must attest in order to consider the dispersal is successful. |
| chunk_length | [uint32](#uint32) |  | The length of each chunk. |






<a name="disperser-BlobStatusReply"></a>

### BlobStatusReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [BlobStatus](#disperser-BlobStatus) |  | The status of the blob. |
| info | [BlobInfo](#disperser-BlobInfo) |  | The blob info needed for clients to confirm the blob against the EigenDA contracts. |






<a name="disperser-BlobStatusRequest"></a>

### BlobStatusRequest
BlobStatusRequest is used to query the status of a blob.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| request_id | [bytes](#bytes) |  | Refer to the documentation for `DisperseBlobReply.request_id`. Note that because the request_id depends on the timestamp at which the disperser received the request, it is not possible to compute it locally from the cert and blob. Clients should thus store this request_id if they plan on requerying the status of the blob in the future. |






<a name="disperser-BlobVerificationProof"></a>

### BlobVerificationProof



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_id | [uint32](#uint32) |  | batch_id is an incremental ID assigned to a batch by EigenDAServiceManager |
| blob_index | [uint32](#uint32) |  | The index of the blob in the batch (which is logically an ordered list of blobs). |
| batch_metadata | [BatchMetadata](#disperser-BatchMetadata) |  |  |
| inclusion_proof | [bytes](#bytes) |  | inclusion_proof is a merkle proof for a blob header&#39;s inclusion in a batch |
| quorum_indexes | [bytes](#bytes) |  | indexes of quorums in BatchHeader.quorum_numbers that match the quorums in BlobHeader.blob_quorum_params Ex. BlobHeader.blob_quorum_params = [ 	{ 		quorum_number = 0, 		... 	}, 	{ 		quorum_number = 3, 		... 	}, 	{ 		quorum_number = 5, 		... 	}, ] BatchHeader.quorum_numbers = [0, 5, 3] =&gt; 0x000503 Then, quorum_indexes = [0, 2, 1] =&gt; 0x000201 |






<a name="disperser-DisperseBlobReply"></a>

### DisperseBlobReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [BlobStatus](#disperser-BlobStatus) |  | The status of the blob associated with the request_id. Will always be PROCESSING. |
| request_id | [bytes](#bytes) |  | The request ID generated by the disperser.

Once a request is accepted, a unique request ID is generated. request_id = string(blob_key) = (hash(blob), hash(metadata)) where metadata contains a requestedAt timestamp and the requested quorum numbers and their adversarial thresholds. BlobKey definition: https://github.com/Layr-Labs/eigenda/blob/6b02bf966afa2b9bf2385db8dd01f66f17334e17/disperser/disperser.go#L87 BlobKey computation: https://github.com/Layr-Labs/eigenda/blob/6b02bf966afa2b9bf2385db8dd01f66f17334e17/disperser/common/blobstore/shared_storage.go#L83-L84

Different DisperseBlobRequests have different IDs, including two identical DisperseBlobRequests sent at different times. Clients should thus store this ID and use it to query the processing status of the request via the GetBlobStatus API. |






<a name="disperser-DisperseBlobRequest"></a>

### DisperseBlobRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  | The data to be dispersed. The size of data must be &lt;= 16MiB. Every 32 bytes of data is interpreted as an integer in big endian format where the lower address has more significant bits. The integer must stay in the valid range to be interpreted as a field element on the bn254 curve. The valid range is 0 &lt;= x &lt; 21888242871839275222246405745257275088548364400416034343698204186575808495617 If any one of the 32 bytes elements is outside the range, the whole request is deemed as invalid, and rejected. |
| custom_quorum_numbers | [uint32](#uint32) | repeated | The quorums to which the blob will be sent, in addition to the required quorums which are configured on the EigenDA smart contract. If required quorums are included here, an error will be returned. The disperser will ensure that the encoded blobs for each quorum are all processed within the same batch. |
| account_id | [string](#string) |  | The account ID of the client. This should be a hex-encoded string of the ECDSA public key corresponding to the key used by the client to sign the BlobAuthHeader. |






<a name="disperser-RetrieveBlobReply"></a>

### RetrieveBlobReply
RetrieveBlobReply contains the retrieved blob data


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  |  |






<a name="disperser-RetrieveBlobRequest"></a>

### RetrieveBlobRequest
RetrieveBlobRequest contains parameters to retrieve the blob.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header_hash | [bytes](#bytes) |  |  |
| blob_index | [uint32](#uint32) |  |  |





 


<a name="disperser-BlobStatus"></a>

### BlobStatus
BlobStatus represents the status of a blob.
The status of a blob is updated as the blob is processed by the disperser.
The status of a blob can be queried by the client using the GetBlobStatus API.
Intermediate states are states that the blob can be in while being processed, and it can be updated to a different state:
- PROCESSING
- DISPERSING
- CONFIRMED
Terminal states are states that will not be updated to a different state:
- FAILED
- FINALIZED
- INSUFFICIENT_SIGNATURES

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| PROCESSING | 1 | PROCESSING means that the blob is currently being processed by the disperser |
| CONFIRMED | 2 | CONFIRMED means that the blob has been dispersed to DA Nodes and the dispersed batch containing the blob has been confirmed onchain |
| FAILED | 3 | FAILED means that the blob has failed permanently (for reasons other than insufficient signatures, which is a separate state). This status is somewhat of a catch-all category, containing (but not necessarily exclusively as errors can be added in the future): - blob has expired - internal logic error while requesting encoding - blob retry has exceeded its limit while waiting for blob finalization after confirmation. Most likely triggered by a chain reorg: see https://github.com/Layr-Labs/eigenda/blob/master/disperser/batcher/finalizer.go#L179-L189. |
| FINALIZED | 4 | FINALIZED means that the block containing the blob&#39;s confirmation transaction has been finalized on Ethereum |
| INSUFFICIENT_SIGNATURES | 5 | INSUFFICIENT_SIGNATURES means that the confirmation threshold for the blob was not met for at least one quorum. |
| DISPERSING | 6 | The DISPERSING state is comprised of two separate phases: - Dispersing to DA nodes and collecting signature - Submitting the transaction on chain and waiting for tx receipt |


 

 


<a name="disperser-Disperser"></a>

### Disperser
Disperser defines the public APIs for dispersing blobs.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| DisperseBlob | [DisperseBlobRequest](#disperser-DisperseBlobRequest) | [DisperseBlobReply](#disperser-DisperseBlobReply) | DisperseBlob accepts a single blob to be dispersed. This executes the dispersal async, i.e. it returns once the request is accepted. The client should use GetBlobStatus() API to poll the processing status of the blob.

If DisperseBlob returns the following error codes: INVALID_ARGUMENT (400): request is invalid for a reason specified in the error msg. RESOURCE_EXHAUSTED (429): request is rate limited for the quorum specified in the error msg. user should retry after the specified duration. INTERNAL (500): serious error, user should NOT retry. |
| DisperseBlobAuthenticated | [AuthenticatedRequest](#disperser-AuthenticatedRequest) stream | [AuthenticatedReply](#disperser-AuthenticatedReply) stream | DisperseBlobAuthenticated is similar to DisperseBlob, except that it requires the client to authenticate itself via the AuthenticationData message. The protocol is as follows: 1. The client sends a DisperseBlobAuthenticated request with the DisperseBlobRequest message 2. The Disperser sends back a BlobAuthHeader message containing information for the client to verify and sign. 3. The client verifies the BlobAuthHeader and sends back the signed BlobAuthHeader in an 	 AuthenticationData message. 4. The Disperser verifies the signature and returns a DisperseBlobReply message. |
| GetBlobStatus | [BlobStatusRequest](#disperser-BlobStatusRequest) | [BlobStatusReply](#disperser-BlobStatusReply) | This API is meant to be polled for the blob status. |
| RetrieveBlob | [RetrieveBlobRequest](#disperser-RetrieveBlobRequest) | [RetrieveBlobReply](#disperser-RetrieveBlobReply) | This retrieves the requested blob from the Disperser&#39;s backend. This is a more efficient way to retrieve blobs than directly retrieving from the DA Nodes (see detail about this approach in api/proto/retriever/retriever.proto). The blob should have been initially dispersed via this Disperser service for this API to work. |

 



<a name="disperser_v2_disperser_v2-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## disperser/v2/disperser_v2.proto



<a name="disperser-v2-Attestation"></a>

### Attestation



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| non_signer_pubkeys | [bytes](#bytes) | repeated | Serialized bytes of non signer public keys (G1 points) |
| apk_g2 | [bytes](#bytes) |  | Serialized bytes of G2 point that represents aggregate public key of all signers |
| quorum_apks | [bytes](#bytes) | repeated | Serialized bytes of aggregate public keys (G1 points) from all nodes for each quorum The order of the quorum_apks should match the order of the quorum_numbers |
| sigma | [bytes](#bytes) |  | Serialized bytes of aggregate signature |
| quorum_numbers | [uint32](#uint32) | repeated | Relevant quorum numbers for the attestation |
| quorum_signed_percentages | [bytes](#bytes) |  | The attestation rate for each quorum. Each quorum&#39;s signing percentage is represented by an 8 bit unsigned integer. The integer is the fraction of the quorum that has signed, with 100 representing 100% of the quorum signing, and 0 representing 0% of the quorum signing. The first byte in the byte array corresponds to the first quorum in the quorum_numbers array, the second byte corresponds to the second quorum, and so on. |






<a name="disperser-v2-BlobCommitmentReply"></a>

### BlobCommitmentReply
The result of a BlobCommitmentRequest().


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_commitment | [common.BlobCommitment](#common-BlobCommitment) |  | The commitment of the blob. |






<a name="disperser-v2-BlobCommitmentRequest"></a>

### BlobCommitmentRequest
The input for a BlobCommitmentRequest().
This can be used to construct a BlobHeader.commitment.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob | [bytes](#bytes) |  | The blob data to compute the commitment for. |






<a name="disperser-v2-BlobInclusionInfo"></a>

### BlobInclusionInfo
BlobInclusionInfo is the information needed to verify the inclusion of a blob in a batch.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_certificate | [common.v2.BlobCertificate](#common-v2-BlobCertificate) |  |  |
| blob_index | [uint32](#uint32) |  | blob_index is the index of the blob in the batch |
| inclusion_proof | [bytes](#bytes) |  | inclusion_proof is the inclusion proof of the blob in the batch |






<a name="disperser-v2-BlobStatusReply"></a>

### BlobStatusReply
BlobStatusReply is the reply to a BlobStatusRequest.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [BlobStatus](#disperser-v2-BlobStatus) |  | The status of the blob. |
| signed_batch | [SignedBatch](#disperser-v2-SignedBatch) |  | The signed batch. Only set if the blob status is GATHERING_SIGNATURES or COMPLETE. signed_batch and blob_inclusion_info are only set if the blob status is GATHERING_SIGNATURES or COMPLETE. When blob is in GATHERING_SIGNATURES status, the attestation object in signed_batch contains attestation information at the point in time. As it gathers more signatures, attestation object will be updated according to the latest attestation status. The client can use this intermediate attestation to verify a blob if it has gathered enough signatures. Otherwise, it should should poll the GetBlobStatus API until the desired level of attestation has been gathered or status is COMPLETE. When blob is in COMPLETE status, the attestation object in signed_batch contains the final attestation information. If the final attestation does not meet the client&#39;s requirement, the client should try a new dispersal. |
| blob_inclusion_info | [BlobInclusionInfo](#disperser-v2-BlobInclusionInfo) |  | BlobInclusionInfo is the information needed to verify the inclusion of a blob in a batch. Only set if the blob status is GATHERING_SIGNATURES or COMPLETE. |






<a name="disperser-v2-BlobStatusRequest"></a>

### BlobStatusRequest
BlobStatusRequest is used to query the status of a blob.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_key | [bytes](#bytes) |  | The unique identifier for the blob. |






<a name="disperser-v2-DisperseBlobReply"></a>

### DisperseBlobReply
A reply to a DisperseBlob request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [BlobStatus](#disperser-v2-BlobStatus) |  | The status of the blob associated with the blob key. |
| blob_key | [bytes](#bytes) |  | The unique 32 byte identifier for the blob.

The blob_key is the keccak hash of the rlp serialization of the BlobHeader, as computed here: https://github.com/Layr-Labs/eigenda/blob/0f14d1c90b86d29c30ff7e92cbadf2762c47f402/core/v2/serialization.go#L30 The blob_key must thus be unique for every request, even if the same blob is being dispersed. Meaning the blob_header must be different for each request.

Note that attempting to disperse a blob with the same blob key as a previously dispersed blob may cause the disperser to reject the blob (DisperseBlob() RPC will return an error). |






<a name="disperser-v2-DisperseBlobRequest"></a>

### DisperseBlobRequest
A request to disperse a blob.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob | [bytes](#bytes) |  | The blob to be dispersed.

The size of this byte array may be any size as long as it does not exceed the maximum length of 16MiB. While the data being dispersed is only required to be greater than 0 bytes, the blob size charged against the payment method will be rounded up to the nearest multiple of `minNumSymbols` defined by the payment vault contract (https://github.com/Layr-Labs/eigenda/blob/1430d56258b4e814b388e497320fd76354bfb478/contracts/src/payments/PaymentVaultStorage.sol#L9).

Every 32 bytes of data is interpreted as an integer in big endian format where the lower address has more significant bits. The integer must stay in the valid range to be interpreted as a field element on the bn254 curve. The valid range is 0 &lt;= x &lt; 21888242871839275222246405745257275088548364400416034343698204186575808495617. If any one of the 32 bytes elements is outside the range, the whole request is deemed as invalid, and rejected. |
| blob_header | [common.v2.BlobHeader](#common-v2-BlobHeader) |  | The header contains metadata about the blob.

This header can be thought of as an &#34;eigenDA tx&#34;, in that it plays a purpose similar to an eth_tx to disperse a 4844 blob. Note that a call to DisperseBlob requires the blob and the blobHeader, which is similar to how dispersing a blob to ethereum requires sending a tx whose data contains the hash of the kzg commit of the blob, which is dispersed separately. |
| signature | [bytes](#bytes) |  | signature over keccak hash of the blob_header that can be verified by blob_header.payment_header.account_id |






<a name="disperser-v2-GetPaymentStateReply"></a>

### GetPaymentStateReply
GetPaymentStateReply contains the payment state of an account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| payment_global_params | [PaymentGlobalParams](#disperser-v2-PaymentGlobalParams) |  | global payment vault parameters |
| period_records | [PeriodRecord](#disperser-v2-PeriodRecord) | repeated | off-chain account reservation usage records |
| reservation | [Reservation](#disperser-v2-Reservation) |  | on-chain account reservation setting |
| cumulative_payment | [bytes](#bytes) |  | off-chain on-demand payment usage |
| onchain_cumulative_payment | [bytes](#bytes) |  | on-chain on-demand payment deposited |






<a name="disperser-v2-GetPaymentStateRequest"></a>

### GetPaymentStateRequest
GetPaymentStateRequest contains parameters to query the payment state of an account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id | [string](#string) |  | The ID of the account being queried. This account ID is an eth wallet address of the user. |
| signature | [bytes](#bytes) |  | Signature over the account ID |
| timestamp | [uint64](#uint64) |  | Timestamp of the request in nanoseconds since the Unix epoch. If too far out of sync with the server&#39;s clock, request may be rejected. |






<a name="disperser-v2-PaymentGlobalParams"></a>

### PaymentGlobalParams
Global constant parameters defined by the payment vault.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| global_symbols_per_second | [uint64](#uint64) |  | Global ratelimit for on-demand dispersals |
| min_num_symbols | [uint64](#uint64) |  | Minimum number of symbols accounted for all dispersals |
| price_per_symbol | [uint64](#uint64) |  | Price charged per symbol for on-demand dispersals |
| reservation_window | [uint64](#uint64) |  | Reservation window for all reservations |
| on_demand_quorum_numbers | [uint32](#uint32) | repeated | quorums allowed to make on-demand dispersals |






<a name="disperser-v2-PeriodRecord"></a>

### PeriodRecord
PeriodRecord is the usage record of an account in a bin. The API should return the active bin
record and the subsequent two records that contains potential overflows.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| index | [uint32](#uint32) |  | Period index of the reservation |
| usage | [uint64](#uint64) |  | symbol usage recorded |






<a name="disperser-v2-Reservation"></a>

### Reservation
Reservation parameters of an account, used to determine the rate limit for the account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| symbols_per_second | [uint64](#uint64) |  | rate limit for the account |
| start_timestamp | [uint32](#uint32) |  | start timestamp of the reservation |
| end_timestamp | [uint32](#uint32) |  | end timestamp of the reservation |
| quorum_numbers | [uint32](#uint32) | repeated | quorums allowed to make reserved dispersals |
| quorum_splits | [uint32](#uint32) | repeated | quorum splits describes how the payment is split among the quorums |






<a name="disperser-v2-SignedBatch"></a>

### SignedBatch
SignedBatch is a batch of blobs with a signature.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [common.v2.BatchHeader](#common-v2-BatchHeader) |  | header contains metadata about the batch |
| attestation | [Attestation](#disperser-v2-Attestation) |  | attestation on the batch |





 


<a name="disperser-v2-BlobStatus"></a>

### BlobStatus
BlobStatus represents the status of a blob.
The status of a blob is updated as the blob is processed by the disperser.
The status of a blob can be queried by the client using the GetBlobStatus API.
Intermediate states are states that the blob can be in while being processed, and it can be updated to a different state:
- QUEUED
- ENCODED
- GATHERING_SIGNATURES
Terminal states are states that will not be updated to a different state:
- UNKNOWN
- COMPLETE
- FAILED

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 | UNKNOWN means that the status of the blob is unknown. This is a catch all and should not be encountered absent a bug.

This status is functionally equivalent to FAILED, but is used to indicate that the failure is due to an unanticipated bug. |
| QUEUED | 1 | QUEUED means that the blob has been queued by the disperser for processing. The DisperseBlob API is asynchronous, meaning that after request validation, but before any processing, the blob is stored in a queue of some sort, and a response immediately returned to the client. |
| ENCODED | 2 | ENCODED means that the blob has been Reed-Solomon encoded into chunks and is ready to be dispersed to DA Nodes. |
| GATHERING_SIGNATURES | 3 | GATHERING_SIGNATURES means that the blob chunks are currently actively being transmitted to validators, and in doing so requesting that the validators sign to acknowledge receipt of the blob. Requests that timeout or receive errors are resubmitted to DA nodes for some period of time set by the disperser, after which the BlobStatus becomes COMPLETE. |
| COMPLETE | 4 | COMPLETE means the blob has been dispersed to DA nodes, and the GATHERING_SIGNATURES period of time has completed. This status does not guarantee any signer percentage, so a client should check that the signature has met its required threshold, and resubmit a new blob dispersal request if not. |
| FAILED | 5 | FAILED means that the blob has failed permanently. Note that this is a terminal state, and in order to retry the blob, the client must submit the blob again (blob key is required to be unique). |


 

 


<a name="disperser-v2-Disperser"></a>

### Disperser
Disperser defines the public APIs for dispersing blobs.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| DisperseBlob | [DisperseBlobRequest](#disperser-v2-DisperseBlobRequest) | [DisperseBlobReply](#disperser-v2-DisperseBlobReply) | DisperseBlob accepts blob to disperse from clients. This executes the dispersal asynchronously, i.e. it returns once the request is accepted. The client could use GetBlobStatus() API to poll the the processing status of the blob. |
| GetBlobStatus | [BlobStatusRequest](#disperser-v2-BlobStatusRequest) | [BlobStatusReply](#disperser-v2-BlobStatusReply) | GetBlobStatus is meant to be polled for the blob status. |
| GetBlobCommitment | [BlobCommitmentRequest](#disperser-v2-BlobCommitmentRequest) | [BlobCommitmentReply](#disperser-v2-BlobCommitmentReply) | GetBlobCommitment is a utility method that calculates commitment for a blob payload. It is provided to help clients who are trying to construct a DisperseBlobRequest.blob_header and don&#39;t have the ability to calculate the commitment themselves (expensive operation which requires SRS points).

For an example usage, see how our disperser_client makes a call to this endpoint when it doesn&#39;t have a local prover: https://github.com/Layr-Labs/eigenda/blob/6059c6a068298d11c41e50f5bcd208d0da44906a/api/clients/v2/disperser_client.go#L166 |
| GetPaymentState | [GetPaymentStateRequest](#disperser-v2-GetPaymentStateRequest) | [GetPaymentStateReply](#disperser-v2-GetPaymentStateReply) | GetPaymentState is a utility method to get the payment state of a given account, at a given disperser. EigenDA&#39;s payment system for v2 is currently centralized, meaning that each disperser does its own accounting. A client wanting to disperse a blob would thus need to synchronize its local accounting state with that of the disperser. That typically only needs to be done once, and the state can be updated locally as the client disperses blobs. The accounting rules are simple and can be updated locally, but periodic checks with the disperser can&#39;t hurt.

For an example usage, see how our disperser_client makes a call to this endpoint to populate its local accountant struct: https://github.com/Layr-Labs/eigenda/blob/6059c6a068298d11c41e50f5bcd208d0da44906a/api/clients/v2/disperser_client.go#L298 |

 



<a name="encoder_encoder-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## encoder/encoder.proto



<a name="encoder-BlobCommitment"></a>

### BlobCommitment
BlobCommitments contains the blob&#39;s commitment, degree proof, and the actual degree
DEPRECATED: use common.BlobCommitment instead


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| commitment | [bytes](#bytes) |  |  |
| length_commitment | [bytes](#bytes) |  |  |
| length_proof | [bytes](#bytes) |  |  |
| length | [uint32](#uint32) |  |  |






<a name="encoder-EncodeBlobReply"></a>

### EncodeBlobReply
EncodeBlobReply returns all encoded chunks along with BlobCommitment for the same,
where Chunk is the smallest unit that is distributed to DA nodes


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| commitment | [BlobCommitment](#encoder-BlobCommitment) |  |  |
| chunks | [bytes](#bytes) | repeated |  |
| chunk_encoding_format | [ChunkEncodingFormat](#encoder-ChunkEncodingFormat) |  | How the above chunks are encoded. |






<a name="encoder-EncodeBlobRequest"></a>

### EncodeBlobRequest
EncodeBlobRequest contains data and pre-computed encoding params provided to Encoder


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  |  |
| encoding_params | [EncodingParams](#encoder-EncodingParams) |  |  |






<a name="encoder-EncodingParams"></a>

### EncodingParams
Parameters needed by Encoder for encoding


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunk_length | [uint32](#uint32) |  |  |
| num_chunks | [uint32](#uint32) |  |  |





 


<a name="encoder-ChunkEncodingFormat"></a>

### ChunkEncodingFormat


| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| GNARK | 1 |  |
| GOB | 2 |  |


 

 


<a name="encoder-Encoder"></a>

### Encoder


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| EncodeBlob | [EncodeBlobRequest](#encoder-EncodeBlobRequest) | [EncodeBlobReply](#encoder-EncodeBlobReply) |  |

 



<a name="encoder_v2_encoder_v2-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## encoder/v2/encoder_v2.proto



<a name="encoder-v2-EncodeBlobReply"></a>

### EncodeBlobReply
EncodeBlobReply contains metadata about the encoded chunks


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fragment_info | [FragmentInfo](#encoder-v2-FragmentInfo) |  |  |






<a name="encoder-v2-EncodeBlobRequest"></a>

### EncodeBlobRequest
EncodeBlobRequest contains the reference to the blob to be encoded and the encoding parameters
determined by the control plane.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_key | [bytes](#bytes) |  |  |
| encoding_params | [EncodingParams](#encoder-v2-EncodingParams) |  |  |
| blob_size | [uint64](#uint64) |  |  |






<a name="encoder-v2-EncodingParams"></a>

### EncodingParams
EncodingParams specifies how the blob should be encoded into chunks


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunk_length | [uint64](#uint64) |  |  |
| num_chunks | [uint64](#uint64) |  |  |






<a name="encoder-v2-FragmentInfo"></a>

### FragmentInfo
FragmentInfo contains metadata about the encoded fragments


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| total_chunk_size_bytes | [uint32](#uint32) |  |  |
| fragment_size_bytes | [uint32](#uint32) |  |  |





 

 

 


<a name="encoder-v2-Encoder"></a>

### Encoder


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| EncodeBlob | [EncodeBlobRequest](#encoder-v2-EncodeBlobRequest) | [EncodeBlobReply](#encoder-v2-EncodeBlobReply) | EncodeBlob encodes a blob into chunks using specified encoding parameters. The blob is retrieved using the provided blob key and the encoded chunks are persisted for later retrieval. |

 



<a name="node_node-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## node/node.proto



<a name="node-AttestBatchReply"></a>

### AttestBatchReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  |  |






<a name="node-AttestBatchRequest"></a>

### AttestBatchRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header | [BatchHeader](#node-BatchHeader) |  | header of the batch |
| blob_header_hashes | [bytes](#bytes) | repeated | the header hashes of all blobs in the batch |






<a name="node-BatchHeader"></a>

### BatchHeader
BatchHeader (see core/data.go#BatchHeader)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_root | [bytes](#bytes) |  | The root of the merkle tree with hashes of blob headers as leaves. |
| reference_block_number | [uint32](#uint32) |  | The Ethereum block number at which the batch is dispersed. |






<a name="node-Blob"></a>

### Blob
In EigenDA, the original blob to disperse is encoded as a polynomial via taking
taking different point evaluations (i.e. erasure coding). These points are split
into disjoint subsets which are assigned to different operator nodes in the EigenDA
network.
The data in this message is a subset of these points that are assigned to a
single operator node.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlobHeader](#node-BlobHeader) |  | Which (original) blob this is for. |
| bundles | [Bundle](#node-Bundle) | repeated | Each bundle contains all chunks for a single quorum of the blob. The number of bundles must be equal to the total number of quorums associated with the blob, and the ordering must be the same as BlobHeader.quorum_headers. Note: an operator may be in some but not all of the quorums; in that case the bundle corresponding to that quorum will be empty. |






<a name="node-BlobHeader"></a>

### BlobHeader



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| commitment | [common.G1Commitment](#common-G1Commitment) |  | The KZG commitment to the polynomial representing the blob. |
| length_commitment | [G2Commitment](#node-G2Commitment) |  | The KZG commitment to the polynomial representing the blob on G2, it is used for proving the degree of the polynomial |
| length_proof | [G2Commitment](#node-G2Commitment) |  | The low degree proof. It&#39;s the KZG commitment to the polynomial shifted to the largest SRS degree. |
| length | [uint32](#uint32) |  | The length of the original blob in number of symbols (in the field where the polynomial is defined). |
| quorum_headers | [BlobQuorumInfo](#node-BlobQuorumInfo) | repeated | The params of the quorums that this blob participates in. |
| account_id | [string](#string) |  | The ID of the user who is dispersing this blob to EigenDA. |
| reference_block_number | [uint32](#uint32) |  | The reference block number whose state is used to encode the blob |






<a name="node-BlobQuorumInfo"></a>

### BlobQuorumInfo
See BlobQuorumParam as defined in
api/proto/disperser/disperser.proto


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| quorum_id | [uint32](#uint32) |  |  |
| adversary_threshold | [uint32](#uint32) |  |  |
| confirmation_threshold | [uint32](#uint32) |  |  |
| chunk_length | [uint32](#uint32) |  |  |
| ratelimit | [uint32](#uint32) |  |  |






<a name="node-Bundle"></a>

### Bundle
A Bundle is the collection of chunks associated with a single blob, for a single
operator and a single quorum.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunks | [bytes](#bytes) | repeated | Each chunk corresponds to a collection of points on the polynomial. Each chunk has same number of points. |
| bundle | [bytes](#bytes) |  | All chunks of the bundle encoded in a byte array. |






<a name="node-G2Commitment"></a>

### G2Commitment



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| x_a0 | [bytes](#bytes) |  | The A0 element of the X coordinate of G2 point. |
| x_a1 | [bytes](#bytes) |  | The A1 element of the X coordinate of G2 point. |
| y_a0 | [bytes](#bytes) |  | The A0 element of the Y coordinate of G2 point. |
| y_a1 | [bytes](#bytes) |  | The A1 element of the Y coordinate of G2 point. |






<a name="node-GetBlobHeaderReply"></a>

### GetBlobHeaderReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_header | [BlobHeader](#node-BlobHeader) |  | The header of the blob requested per GetBlobHeaderRequest. |
| proof | [MerkleProof](#node-MerkleProof) |  | Merkle proof that returned blob header belongs to the batch and is the batch&#39;s MerkleProof.index-th blob. This can be checked against the batch root on chain. |






<a name="node-GetBlobHeaderRequest"></a>

### GetBlobHeaderRequest
See RetrieveChunksRequest for documentation of each parameter of GetBlobHeaderRequest.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header_hash | [bytes](#bytes) |  |  |
| blob_index | [uint32](#uint32) |  |  |
| quorum_id | [uint32](#uint32) |  |  |






<a name="node-MerkleProof"></a>

### MerkleProof



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hashes | [bytes](#bytes) | repeated | The proof itself. |
| index | [uint32](#uint32) |  | Which index (the leaf of the Merkle tree) this proof is for. |






<a name="node-NodeInfoReply"></a>

### NodeInfoReply
Node info reply


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| semver | [string](#string) |  |  |
| arch | [string](#string) |  |  |
| os | [string](#string) |  |  |
| num_cpu | [uint32](#uint32) |  |  |
| mem_bytes | [uint64](#uint64) |  |  |






<a name="node-NodeInfoRequest"></a>

### NodeInfoRequest
Node info request






<a name="node-RetrieveChunksReply"></a>

### RetrieveChunksReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunks | [bytes](#bytes) | repeated | All chunks the Node is storing for the requested blob per RetrieveChunksRequest. |
| chunk_encoding_format | [ChunkEncodingFormat](#node-ChunkEncodingFormat) |  | How the above chunks are encoded. |






<a name="node-RetrieveChunksRequest"></a>

### RetrieveChunksRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header_hash | [bytes](#bytes) |  | The hash of the ReducedBatchHeader defined onchain, see: https://github.com/Layr-Labs/eigenda/blob/master/contracts/src/interfaces/IEigenDAServiceManager.sol#L43 This identifies which batch to retrieve for. |
| blob_index | [uint32](#uint32) |  | Which blob in the batch to retrieve for (note: a batch is logically an ordered list of blobs). |
| quorum_id | [uint32](#uint32) |  | Which quorum of the blob to retrieve for (note: a blob can have multiple quorums and the chunks for different quorums at a Node can be different). The ID must be in range [0, 254]. |






<a name="node-StoreBlobsReply"></a>

### StoreBlobsReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signatures | [google.protobuf.BytesValue](#google-protobuf-BytesValue) | repeated | The operator&#39;s BLS sgnature signed on the blob header hashes. The ordering of the signatures must match the ordering of the blobs sent in the request, with empty signatures in the places for discarded blobs. |






<a name="node-StoreBlobsRequest"></a>

### StoreBlobsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blobs | [Blob](#node-Blob) | repeated | Blobs to store |
| reference_block_number | [uint32](#uint32) |  | The reference block number whose state is used to encode the blobs |






<a name="node-StoreChunksReply"></a>

### StoreChunksReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  | The operator&#39;s BLS signature signed on the batch header hash. |






<a name="node-StoreChunksRequest"></a>

### StoreChunksRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header | [BatchHeader](#node-BatchHeader) |  | Which batch this request is for. |
| blobs | [Blob](#node-Blob) | repeated | The chunks for each blob in the batch to be stored in an EigenDA Node. |





 


<a name="node-ChunkEncodingFormat"></a>

### ChunkEncodingFormat
This describes how the chunks returned in RetrieveChunksReply are encoded.
Used to facilitate the decoding of chunks.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| GNARK | 1 |  |
| GOB | 2 |  |


 

 


<a name="node-Dispersal"></a>

### Dispersal


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| StoreChunks | [StoreChunksRequest](#node-StoreChunksRequest) | [StoreChunksReply](#node-StoreChunksReply) | StoreChunks validates that the chunks match what the Node is supposed to receive ( different Nodes are responsible for different chunks, as EigenDA is horizontally sharded) and is correctly coded (e.g. each chunk must be a valid KZG multiproof) according to the EigenDA protocol. It also stores the chunks along with metadata for the protocol-defined length of custody. It will return a signature at the end to attest to the data in this request it has processed. |
| StoreBlobs | [StoreBlobsRequest](#node-StoreBlobsRequest) | [StoreBlobsReply](#node-StoreBlobsReply) | StoreBlobs is similar to StoreChunks, but it stores the blobs using a different storage schema so that the stored blobs can later be aggregated by AttestBatch method to a bigger batch. StoreBlobs &#43; AttestBatch will eventually replace and deprecate StoreChunks method. DEPRECATED: StoreBlobs method is not used |
| AttestBatch | [AttestBatchRequest](#node-AttestBatchRequest) | [AttestBatchReply](#node-AttestBatchReply) | AttestBatch is used to aggregate the batches stored by StoreBlobs method to a bigger batch. It will return a signature at the end to attest to the aggregated batch. DEPRECATED: AttestBatch method is not used |
| NodeInfo | [NodeInfoRequest](#node-NodeInfoRequest) | [NodeInfoReply](#node-NodeInfoReply) | Retrieve node info metadata |


<a name="node-Retrieval"></a>

### Retrieval


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| RetrieveChunks | [RetrieveChunksRequest](#node-RetrieveChunksRequest) | [RetrieveChunksReply](#node-RetrieveChunksReply) | RetrieveChunks retrieves the chunks for a blob custodied at the Node. |
| GetBlobHeader | [GetBlobHeaderRequest](#node-GetBlobHeaderRequest) | [GetBlobHeaderReply](#node-GetBlobHeaderReply) | GetBlobHeader is similar to RetrieveChunks, this just returns the header of the blob. |
| NodeInfo | [NodeInfoRequest](#node-NodeInfoRequest) | [NodeInfoReply](#node-NodeInfoReply) | Retrieve node info metadata |

 



<a name="relay_relay-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## relay/relay.proto



<a name="relay-ChunkRequest"></a>

### ChunkRequest
A request for chunks within a specific blob. Requests are fulfilled in all-or-nothing fashion. If any of the
requested chunks are not found or are unable to be fetched, the entire request will fail.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| by_index | [ChunkRequestByIndex](#relay-ChunkRequestByIndex) |  | Request chunks by their individual indices. |
| by_range | [ChunkRequestByRange](#relay-ChunkRequestByRange) |  | Request chunks by a range of indices. |






<a name="relay-ChunkRequestByIndex"></a>

### ChunkRequestByIndex
A request for chunks within a specific blob. Each chunk is requested individually by its index.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_key | [bytes](#bytes) |  | The blob key. |
| chunk_indices | [uint32](#uint32) | repeated | The index of the chunk within the blob. |






<a name="relay-ChunkRequestByRange"></a>

### ChunkRequestByRange
A request for chunks within a specific blob. Each chunk is requested a range of indices.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_key | [bytes](#bytes) |  | The blob key. |
| start_index | [uint32](#uint32) |  | The first index to start fetching chunks from. |
| end_index | [uint32](#uint32) |  | One past the last index to fetch chunks from. Similar semantics to golang slices. |






<a name="relay-GetBlobReply"></a>

### GetBlobReply
The reply to a GetBlobs request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob | [bytes](#bytes) |  | The blob requested. |






<a name="relay-GetBlobRequest"></a>

### GetBlobRequest
A request to fetch one or more blobs.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_key | [bytes](#bytes) |  | The key of the blob to fetch. |






<a name="relay-GetChunksReply"></a>

### GetChunksReply
The reply to a GetChunks request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) | repeated | The chunks requested. The order of these chunks will be the same as the order of the requested chunks. data is the raw data of the bundle (i.e. serialized byte array of the frames) |






<a name="relay-GetChunksRequest"></a>

### GetChunksRequest
Request chunks from blobs stored by this relay.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunk_requests | [ChunkRequest](#relay-ChunkRequest) | repeated | The chunk requests. Chunks are returned in the same order as they are requested. |
| operator_id | [bytes](#bytes) |  | If this is an authenticated request, this should hold the ID of the operator. If this is an unauthenticated request, this field should be empty. Relays may choose to reject unauthenticated requests. |
| timestamp | [uint32](#uint32) |  | Timestamp of the request in seconds since the Unix epoch. If too far out of sync with the server&#39;s clock, request may be rejected. |
| operator_signature | [bytes](#bytes) |  | If this is an authenticated request, this field will hold a BLS signature by the requester on the hash of this request. Relays may choose to reject unauthenticated requests.

The following describes the schema for computing the hash of this request This algorithm is implemented in golang using relay.auth.HashGetChunksRequest().

All integers are encoded as unsigned 4 byte big endian values.

Perform a keccak256 hash on the following data in the following order: 1. the length of the operator ID in bytes 2. the operator id 3. the number of chunk requests 4. for each chunk request: a. if the chunk request is a request by index: i. a one byte ASCII representation of the character &#34;i&#34; (aka Ox69) ii. the length blob key in bytes iii. the blob key iv. the start index v. the end index b. if the chunk request is a request by range: i. a one byte ASCII representation of the character &#34;r&#34; (aka Ox72) ii. the length of the blob key in bytes iii. the blob key iv. each requested chunk index, in order 5. the timestamp (seconds since the Unix epoch encoded as a 4 byte big endian value) |





 

 

 


<a name="relay-Relay"></a>

### Relay
Relay is a service that provides access to public relay functionality.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetBlob | [GetBlobRequest](#relay-GetBlobRequest) | [GetBlobReply](#relay-GetBlobReply) | GetBlob retrieves a blob stored by the relay. |
| GetChunks | [GetChunksRequest](#relay-GetChunksRequest) | [GetChunksReply](#relay-GetChunksReply) | GetChunks retrieves chunks from blobs stored by the relay. |

 



<a name="retriever_retriever-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## retriever/retriever.proto



<a name="retriever-BlobReply"></a>

### BlobReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  | The blob retrieved and reconstructed from the EigenDA Nodes per BlobRequest. |






<a name="retriever-BlobRequest"></a>

### BlobRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch_header_hash | [bytes](#bytes) |  | The hash of the ReducedBatchHeader defined onchain, see: https://github.com/Layr-Labs/eigenda/blob/master/contracts/src/interfaces/IEigenDAServiceManager.sol#L43 This identifies the batch that this blob belongs to. |
| blob_index | [uint32](#uint32) |  | Which blob in the batch this is requesting for (note: a batch is logically an ordered list of blobs). |
| reference_block_number | [uint32](#uint32) |  | The Ethereum block number at which the batch for this blob was constructed. |
| quorum_id | [uint32](#uint32) |  | Which quorum of the blob this is requesting for (note a blob can participate in multiple quorums). |





 

 

 


<a name="retriever-Retriever"></a>

### Retriever
The Retriever is a service for retrieving chunks corresponding to a blob from
the EigenDA operator nodes and reconstructing the original blob from the chunks.
This is a client-side library that the users are supposed to operationalize.

Note: Users generally have two ways to retrieve a blob from EigenDA:
  1) Retrieve from the Disperser that the user initially used for dispersal: the API
     is Disperser.RetrieveBlob() as defined in api/proto/disperser/disperser.proto
  2) Retrieve directly from the EigenDA Nodes, which is supported by this Retriever.

The Disperser.RetrieveBlob() (the 1st approach) is generally faster and cheaper as the
Disperser manages the blobs that it has processed, whereas the Retriever.RetrieveBlob()
(the 2nd approach here) removes the need to trust the Disperser, with the downside of
worse cost and performance.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| RetrieveBlob | [BlobRequest](#retriever-BlobRequest) | [BlobReply](#retriever-BlobReply) | This fans out request to EigenDA Nodes to retrieve the chunks and returns the reconstructed original blob in response. |

 



<a name="retriever_v2_retriever_v2-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## retriever/v2/retriever_v2.proto



<a name="retriever-v2-BlobReply"></a>

### BlobReply
A reply to a RetrieveBlob() request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  | The blob retrieved and reconstructed from the EigenDA Nodes per BlobRequest. |






<a name="retriever-v2-BlobRequest"></a>

### BlobRequest
A request to retrieve a blob from the EigenDA Nodes via RetrieveBlob().


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_header | [common.v2.BlobHeader](#common-v2-BlobHeader) |  | header of the blob to be retrieved |
| reference_block_number | [uint32](#uint32) |  | The Ethereum block number at which the batch for this blob was constructed. |
| quorum_id | [uint32](#uint32) |  | Which quorum of the blob this is requesting for (note a blob can participate in multiple quorums). |





 

 

 


<a name="retriever-v2-Retriever"></a>

### Retriever
The Retriever is a service for retrieving chunks corresponding to a blob from
the EigenDA operator nodes and reconstructing the original blob from the chunks.
This is a client-side library that the users are supposed to operationalize.

Note: Users generally have two ways to retrieve a blob from EigenDA V2:
  1) Retrieve from the relay that the blob is assigned to: the API
     is Relay.GetBlob() as defined in api/proto/relay/relay.proto
  2) Retrieve directly from the EigenDA Nodes, which is supported by this Retriever.

The Relay.GetBlob() (the 1st approach) is generally faster and cheaper as the
relay manages the blobs that it has processed, whereas the Retriever.RetrieveBlob()
(the 2nd approach here) removes the need to trust the relay, with the downside of
worse cost and performance.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| RetrieveBlob | [BlobRequest](#retriever-v2-BlobRequest) | [BlobReply](#retriever-v2-BlobReply) | This fans out request to EigenDA Nodes to retrieve the chunks and returns the reconstructed original blob in response. |

 



<a name="validator_node_v2-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## validator/node_v2.proto



<a name="validator-GetChunksReply"></a>

### GetChunksReply
The response to the GetChunks() RPC.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunks | [bytes](#bytes) | repeated | All chunks the Node is storing for the requested blob per GetChunksRequest. |
| chunk_encoding_format | [ChunkEncodingFormat](#validator-ChunkEncodingFormat) |  | The format how the above chunks are encoded. |






<a name="validator-GetChunksRequest"></a>

### GetChunksRequest
The parameter for the GetChunks() RPC.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob_key | [bytes](#bytes) |  | The unique identifier for the blob the chunks are being requested for. The blob_key is the keccak hash of the rlp serialization of the BlobHeader, as computed here: https://github.com/Layr-Labs/eigenda/blob/0f14d1c90b86d29c30ff7e92cbadf2762c47f402/core/v2/serialization.go#L30 |
| quorum_id | [uint32](#uint32) |  | Which quorum of the blob to retrieve for (note: a blob can have multiple quorums and the chunks for different quorums at a Node can be different). The ID must be in range [0, 254]. |






<a name="validator-GetNodeInfoReply"></a>

### GetNodeInfoReply
Node info reply


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| semver | [string](#string) |  | The version of the node. |
| arch | [string](#string) |  | The architecture of the node. |
| os | [string](#string) |  | The operating system of the node. |
| num_cpu | [uint32](#uint32) |  | The number of CPUs on the node. |
| mem_bytes | [uint64](#uint64) |  | The amount of memory on the node in bytes. |






<a name="validator-GetNodeInfoRequest"></a>

### GetNodeInfoRequest
The parameter for the GetNodeInfo() RPC.






<a name="validator-StoreChunksReply"></a>

### StoreChunksReply
StoreChunksReply is the message type used to respond to a StoreChunks() RPC.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  | The validator&#39;s BSL signature signed on the batch header hash. |






<a name="validator-StoreChunksRequest"></a>

### StoreChunksRequest
Request that the Node store a batch of chunks.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| batch | [common.v2.Batch](#common-v2-Batch) |  | batch of blobs to store |
| disperserID | [uint32](#uint32) |  | ID of the disperser that is requesting the storage of the batch. |
| timestamp | [uint32](#uint32) |  | Timestamp of the request in seconds since the Unix epoch. If too far out of sync with the server&#39;s clock, request may be rejected. |
| signature | [bytes](#bytes) |  | Signature using the disperser&#39;s ECDSA key over keccak hash of the batch. The purpose of this signature is to prevent hooligans from tricking validators into storing data that they shouldn&#39;t be storing.

Algorithm for computing the hash is as follows. All integer values are serialized in big-endian order (unsigned). A reference implementation (golang) can be found at https://github.com/Layr-Labs/eigenda/blob/master/disperser/auth/request_signing.go

1. digest len(batch.BatchHeader.BatchRoot) (4 bytes, unsigned big endian) 2. digest batch.BatchHeader.BatchRoot 3. digest batch.BatchHeader.ReferenceBlockNumber (8 bytes, unsigned big endian) 4. digest len(batch.BlobCertificates) (4 bytes, unsigned big endian) 5. for each certificate in batch.BlobCertificates: a. digest certificate.BlobHeader.Version (4 bytes, unsigned big endian) b. digest len(certificate.BlobHeader.QuorumNumbers) (4 bytes, unsigned big endian) c. for each quorum_number in certificate.BlobHeader.QuorumNumbers: i. digest quorum_number (4 bytes, unsigned big endian) d. digest len(certificate.BlobHeader.Commitment.Commitment) (4 bytes, unsigned big endian) e. digest certificate.BlobHeader.Commitment.Commitment f digest len(certificate.BlobHeader.Commitment.LengthCommitment) (4 bytes, unsigned big endian) g. digest certificate.BlobHeader.Commitment.LengthCommitment h. digest len(certificate.BlobHeader.Commitment.LengthProof) (4 bytes, unsigned big endian) i. digest certificate.BlobHeader.Commitment.LengthProof j. digest certificate.BlobHeader.Commitment.Length (4 bytes, unsigned big endian) k. digest len(certificate.BlobHeader.PaymentHeader.AccountId) (4 bytes, unsigned big endian) l. digest certificate.BlobHeader.PaymentHeader.AccountId m. digest certificate.BlobHeader.PaymentHeader.Timestamp (4 bytes, signed big endian) n digest len(certificate.BlobHeader.PaymentHeader.CumulativePayment) (4 bytes, unsigned big endian) o. digest certificate.BlobHeader.PaymentHeader.CumulativePayment p digest len(certificate.BlobHeader.Signature) (4 bytes, unsigned big endian) q. digest certificate.BlobHeader.Signature r. digest len(certificate.Relays) (4 bytes, unsigned big endian) s. for each relay in certificate.Relays: i. digest relay (4 bytes, unsigned big endian) 6. digest disperserID (4 bytes, unsigned big endian) 7. digest timestamp (4 bytes, unsigned big endian)

Note that this signature is not included in the hash for obvious reasons. |





 


<a name="validator-ChunkEncodingFormat"></a>

### ChunkEncodingFormat
This describes how the chunks returned in GetChunksReply are encoded.
Used to facilitate the decoding of chunks.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 | A valid response should never use this value. If encountered, the client should treat it as an error. |
| GNARK | 1 | A chunk encoded in GNARK has the following format:

[KZG proof: 32 bytes] [Coeff 1: 32 bytes] [Coeff 2: 32 bytes] ... [Coeff n: 32 bytes]

The KZG proof is a point on G1 and is serialized with bn254.G1Affine.Bytes(). The coefficients are field elements in bn254 and serialized with fr.Element.Marshal().

References: - bn254.G1Affine: github.com/consensys/gnark-crypto/ecc/bn254 - fr.Element: github.com/consensys/gnark-crypto/ecc/bn254/fr

Golang serialization and deserialization can be found in: - Frame.SerializeGnark() - Frame.DeserializeGnark() Package: github.com/Layr-Labs/eigenda/encoding |


 

 


<a name="validator-Dispersal"></a>

### Dispersal
Dispersal is utilized to disperse chunk data.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| StoreChunks | [StoreChunksRequest](#validator-StoreChunksRequest) | [StoreChunksReply](#validator-StoreChunksReply) | StoreChunks instructs the validator to store a batch of chunks. This call blocks until the validator either acquires the chunks or the validator determines that it is unable to acquire the chunks. If the validator is able to acquire and validate the chunks, it returns a signature over the batch header. This RPC describes which chunks the validator should store but does not contain that chunk data. The validator is expected to fetch the chunk data from one of the relays that is in possession of the chunk. |
| GetNodeInfo | [GetNodeInfoRequest](#validator-GetNodeInfoRequest) | [GetNodeInfoReply](#validator-GetNodeInfoReply) | GetNodeInfo fetches metadata about the node. |


<a name="validator-Retrieval"></a>

### Retrieval
Retrieval is utilized to retrieve chunk data.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetChunks | [GetChunksRequest](#validator-GetChunksRequest) | [GetChunksReply](#validator-GetChunksReply) | GetChunks retrieves the chunks for a blob custodied at the Node. Note that where possible, it is generally faster to retrieve chunks from the relay service if that service is available. |
| GetNodeInfo | [GetNodeInfoRequest](#validator-GetNodeInfoRequest) | [GetNodeInfoReply](#validator-GetNodeInfoReply) | Retrieve node info metadata |

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

