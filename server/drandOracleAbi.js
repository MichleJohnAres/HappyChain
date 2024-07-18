const ContractConfig = {
  address: "0xca6451C106dc107A8aE14BAC306Eef8F9aE4034D",
  abi: [
    {
      type: "function",
      name: "DRAND_TIMEOUT",
      inputs: [],
      outputs: [{ name: "", type: "uint256", internalType: "uint256" }],
      stateMutability: "view",
    },
    {
      type: "function",
      name: "drandValues",
      inputs: [{ name: "", type: "uint256", internalType: "uint256" }],
      outputs: [{ name: "", type: "bytes32", internalType: "bytes32" }],
      stateMutability: "view",
    },
    {
      type: "function",
      name: "getDrand",
      inputs: [{ name: "timestamp", type: "uint256", internalType: "uint256" }],
      outputs: [{ name: "", type: "bytes32", internalType: "bytes32" }],
      stateMutability: "view",
    },
    {
      type: "function",
      name: "unsafeGetDrand",
      inputs: [{ name: "timestamp", type: "uint256", internalType: "uint256" }],
      outputs: [{ name: "", type: "bytes32", internalType: "bytes32" }],
      stateMutability: "view",
    },
    {
      type: "function",
      name: "updateDrand",
      inputs: [
        { name: "timestamp", type: "uint256", internalType: "uint256" },
        { name: "value", type: "bytes32", internalType: "bytes32" },
      ],
      outputs: [],
      stateMutability: "nonpayable",
    },
    {
      type: "function",
      name: "willDrandBeAvailable",
      inputs: [{ name: "timestamp", type: "uint256", internalType: "uint256" }],
      outputs: [{ name: "", type: "bool", internalType: "bool" }],
      stateMutability: "view",
    },
  ],
};

export { ContractConfig };
